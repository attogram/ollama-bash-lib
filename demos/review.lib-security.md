# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.3


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_thinking hide
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Security Review – **Ollama Bash Lib**  
*Version 0.45.3 – Bash ≥ 3.2*  

---  

## 1. Overview  

The script provides a fairly complete Bash wrapper around the **Ollama** API, exposing functions for:

* HTTP GET/POST via `curl`  
* Model interaction (generate, chat, stream, list, unload, …)  
* Message‑history handling  
* “Tools” (named commands that a model can invoke)  
* A **command‑line “eval” helper** (`ollama_eval`) that asks a LLM to generate a Bash one‑liner and, after a series of safety checks, optionally runs it.

The code is well‑documented and attempts to be defensive (validation, error handling, debug levels).  

Below is a systematic security analysis, focusing on potential vulnerabilities when the library is used in a typical Unix environment.  

---  

## 2. Compatibility with Bash 3.2  

* **Arrays** – All indexed arrays (`myarray=()`, `${myarray[@]}`) are supported in Bash 3.2.  
* **`[[`**, **`=~`** (regex), **`local`**, **`declare -a`** – all present.  
* **`command -v`** – works.  
* **`[[ -n "${var+x}" ]]`** – works.  
* **`(( ))` arithmetic** – works.  

The script **does not use associative arrays**, **nameref**, or **`declare -g`**, which are Bash 4+ features, so it should run on Bash 3.2 without modification.  

---  

## 3. Threat Model  

| Actor | Goal | Potential Impact |
|-------|------|-------------------|
| **Untrusted user** (e.g., an attacker who can supply input to any of the public functions) | Execute arbitrary commands on the host, read secrets, cause denial‑of‑service, or exfiltrate data. | Full system compromise, data leakage, service disruption. |
| **Compromised LLM API** (malicious response from Ollama or Turbo API) | Inject harmful payloads through the JSON returned by `_ollama_*` functions. | Same as above – remote code execution via generated commands. |
| **Malicious environment** (e.g., a rogue `curl`, `jq`, or `shuf` binary) | Subvert library logic, leak data, or run code. | Privilege escalation, data exfiltration. |
| **Accidental misuse** (developer enables debug, streams large payloads) | Information disclosure (model prompts, API keys) to other users on the system. | Credential leakage, privacy breach. |

---  

## 4. Findings  

### 4.1 Information Leakage  

| Issue | Description | Impact |
|-------|-------------|--------|
| **Debug output (`_debug`) prints raw prompts, models, JSON payloads** | When `OLLAMA_LIB_DEBUG` ≥ 1, the library writes the full prompt, model name, and sometimes the entire JSON request to *stderr*. The debug routine does redact only the value of `OLLAMA_LIB_TURBO_KEY`. | Sensitive data (e.g., private prompts, file paths, user‑provided content) can be seen by any local user that can read the process’s stderr (e.g., via a log file, screen capture, `ps` output on some terminals). |
| **`_get_redacted_var` only redacts var names containing `AUTH`, `KEY`, `TOKEN`** | Environment variables such as `OLLAMA_HOST`, `CUDA_VISIBLE_DEVICES`, etc. are printed in clear text by `ollama_app_vars`. | May expose internal network topology or GPU configuration, which can aid an attacker. |
| **`OLLAMA_LIB_TURBO_KEY` is stored in the environment** | The key is exported optionally (via `-e` flag) and therefore appears in the process environment, visible to other users via `ps e` or `/proc/<pid>/environ`. | Credential theft if another local user can read those files. |

**Recommendation**  
* Make debug logging optional at **runtime** (e.g., an environment variable that defaults to `0` and must be explicitly set).  
* Redact *all* user‑supplied values when `OLLAMA_LIB_DEBUG` ≥ 1, not just the Turbo key.  
* Provide a dedicated “sanitized‑debug” mode that strips or masks any value that is not known to be public.  

### 4.2 Command‑Injection / Unsafe Execution  

| Issue | Location | Description | Impact |
|-------|----------|-------------|--------|
| **`ollama_eval` → `eval "$cmd"`** | `_ollama_eval_permission_dangerous_eval` | If a user answers “eval”, the generated command is executed in the caller’s shell without any sandbox. The script tries to mitigate with `_ollama_eval_danger_check`, but the regex can be bypassed (e.g., using `\`eval\`` or quoting tricks). | Full command‑execution with the privileges of the caller. |
| **Tool execution (`ollama_tools_run`)** | `ollama_tools_run` → `"$command" "$tool_args_str"` | The command stored in `OLLAMA_LIB_TOOLS_COMMAND` is executed directly. No validation of the command string is performed beyond the fact that the tool must be *registered* beforehand. If an attacker can influence the registration (e.g., via a malicious script that sources the lib) they can inject arbitrary commands. | Arbitrary command execution. |
| **`_call_curl` → `curl ... -d "@-"`** | `_call_curl` | The JSON body is passed via stdin to `curl`. While this is safe in itself, the JSON is built from user‑provided values (`model`, `prompt`, `messages`). If an attacker can inject a newline into any of those fields, they could cause `curl` to treat the data as multiple arguments (unlikely because `-d @-` reads the body, but older curl versions with `--data @-` might mishandle). | Potential injection into the HTTP request – could affect remote API only. |
| **Dynamic `host` URL** | `ollama_app_turbo` – sets `OLLAMA_HOST`/`OLLAMA_LIB_API` after validation | The URL is validated with a regex, but the regex allows **any scheme** (`http|https|ftp|file`) and any characters that match `[-A-Za-z0-9\+&@#/%?=~_|!:,.;]`. An attacker could set `OLLAMA_HOST` to `file:///etc/passwd` or `ftp://evil.com/…`, causing the script to leak local files if other parts later treat the URL as a file path. | Information disclosure or remote request to attacker‑controlled server. |

**Recommendation**  
* **Never use `eval`** on data that originates from an LLM, even after checks. Replace the “dangerous eval” branch with a **strict whitelist of allowed commands** or remove the feature entirely.  
* For **tool execution**, enforce a *sandbox* (e.g., run the command under `bwrap`, `firejail`, or Docker) or at minimum sanitize the command name against a whitelist.  
* When constructing URLs, restrict the scheme to `http` or `https` only, and disallow relative paths that could resolve to local files.  

### 4.3 Insecure Defaults / Privilege Escalation  

| Issue | Description | Impact |
|-------|-------------|--------|
| **`OLLAMA_LIB_TIMEOUT` is user‑controllable** | It defaults to 300 s, but a malicious user can set it to `0` (or a very large value) before calling any function. | `curl --max-time 0` will cause an immediate failure; a large timeout could be used for a **Denial‑of‑Service** (slow‑loris style) against the local Ollama server. |
| **`OLLAMA_LIB_STREAM` toggles streaming** | The global flag is modified by many public functions (e.g., `ollama_generate`, `ollama_chat`). A malicious script could toggle streaming on/off to affect downstream logic (e.g., forcing JSON line‑splitting). | Unexpected behavior, possibly breaking downstream parsers. |
| **`set -o pipefail`** – good, but **`set -e` is not used** | Errors inside pipelines are detected, but the script still continues after many failures, sometimes returning generic error codes. | May lead to hidden failures and the calling script proceeding with incomplete data. |
| **Exported environment variables** | `ollama_app_turbo` can export `OLLAMA_LIB_TURBO_KEY` and `OLLAMA_HOST`. Once exported, they inherit to **any child process** (including potentially untrusted commands). | Secret leakage to sub‑processes. |

**Recommendation**  
* Make **timeout** a **read‑only** variable after initialization (`readonly OLLAMA_LIB_TIMEOUT`).  
* Encourage callers to pass a **local copy** of the flag (`local OLLAMA_LIB_STREAM=0`) rather than mutating the global state.  
* Consider adding `set -e` (or explicit checks after each critical command) to ensure failures abort the script early.  
* Export secrets **only when absolutely necessary**; otherwise keep them in the shell’s private environment.  

### 4.4 Dependency & Path Control  

| Issue | Description | Impact |
|-------|-------------|--------|
| **Reliance on external commands (`curl`, `jq`, `shuf`, `awk`, `timeout`)** | No verification of the *integrity* of these binaries (e.g., they could be replaced with malicious wrappers). | Potential supply‑chain attack. |
| **`command -v` check** can be fooled by a *function* named `curl`/`jq` defined earlier in the script or in the calling environment. | The library could end up calling the attacker‑controlled function. | Arbitrary code execution. |
| **No explicit `PATH` sanitisation** before invoking tools. | If the user manipulates `PATH` to point to a malicious binary, the library will blindly execute it. | Same as above. |

**Recommendation**  
* Resolve full paths once at library load (e.g., `CURL=$(command -v curl)`; `JQ=$(command -v jq)`) and use those variables.  
* Optionally enforce a *trusted path* (`PATH=/usr/bin:/bin`) before critical operations.  

### 4.5 Input Validation  

* **URL validation** (`_is_valid_url`) uses a permissive regex that accepts **`file://`** and **`ftp://`** schemes.  
* **Model name validation** (`_is_valid_model`) only checks the regex `^[a-zA-Z0-9._:/-]+$`, which allows **absolute paths** (e.g., `/etc/passwd`) as a model name. The name is then sent to the API, which likely rejects it, but it could be used for *path‑traversal* when the library later builds JSON.  

**Recommendation**  
* Restrict the URL regex to `https?://` only.  
* Reject model names that contain a forward slash (`/`) unless it’s part of a known repository name (e.g., `repo/model`).  

### 4.6 Miscellaneous  

| Issue | Description |
|-------|-------------|
| **Use of `printf '%s' "$var"`** – safe, but some places concatenate without quoting (e.g., building usage strings). This is not a direct exploit, but could break on strings containing `%` causing `printf` format‑string issues. |
| **`read -r -s api_key`** blocks on non‑interactive terminals. If the script is sourced in CI without a TTY, the prompt will hang. |
| **`_ollama_thinking_stream`** reads a *single* character from stdin (`read -r -n 1 chunk`), which discards the rest of the stream if the thinking block exceeds one character. This is a functional bug, not a security issue. |

---  

## 5. Recommendations – Hardening Checklist  

| Category | Action |
|----------|--------|
| **Logging & Debug** | • Default `OLLAMA_LIB_DEBUG=0`. <br>• When enabled, redact *all* user‑supplied values (prompt, model, JSON). |
| **Secret Handling** | • Keep `OLLAMA_LIB_TURBO_KEY` **unset** in the environment unless explicitly exported. <br>• Use a dedicated “key store” file with restricted permissions if persistence is required. |
| **Command Execution** | • **Remove** the `eval` branch (`_ollama_eval_permission_dangerous_eval`). <br>• For tool execution, run commands under a sandbox (`firejail`, `bwrap`, or a Docker container) and whitelist allowed binaries. |
| **Input Validation** | • Tighten URL regex to `^(https?)://[^\s/$.?#].[^\s]*$`. <br>• Disallow `file://` and `ftp://`. <br>• Validate model names to exclude absolute paths and strange characters. |
| **Dependency Integrity** | • Resolve full paths for external commands at load time and store them in read‑only variables. <br>• Optionally verify checksums of those binaries (e.g., via `dpkg -S` or `rpm -qf`). |
| **Environment Hygiene** | • Reset or sanitize `PATH` before invoking external commands. <br>• Avoid exporting global flags (`OLLAMA_LIB_TIMEOUT`, `OLLAMA_LIB_DEBUG`) unless needed. |
| **Error‑Handling** | • Add `set -e` **or** explicit `|| exit 1` after critical calls. <br>• Return distinct error codes from each failure path for easier auditing. |
| **Resource Limits** | • Enforce a **maximum** `OLLAMA_LIB_TIMEOUT` (e.g., 60 s) to mitigate DoS. <br>• Limit the size of streamed responses (use `head -c` in debugging mode). |
| **User Prompts** | • Provide a non‑interactive fallback for `ollama_app_turbo` (e.g., read key from `$OLLAMA_TURBO_KEY_FILE`). |
| **Testing** | • Run the library through a **static analysis** tool (ShellCheck) and a **runtime fuzzer** (e.g., `bats` with malicious inputs). <br>• Test under Bash 3.2 on a minimal system. |

---  

## 6. Conclusion  

The **Ollama Bash Lib** is a sophisticated wrapper that makes extensive use of Bash features while staying compatible with Bash 3.2.  

From a security standpoint, the biggest concerns are:

1. **Potential execution of untrusted code** – especially via the `ollama_eval` “dangerous eval” path and generic tool execution.  
2. **Information leakage** through debug logging and environment export of secrets.  
3. **Insufficient validation** of URLs and model names, permitting unintended schemes or path traversal.  
4. **Trust in external binaries** without path hardening.

If these issues are mitigated (remove `eval`, tighten validation, properly redact/debug, sandbox tool commands, and lock down dependency paths), the library can be safely used in typical developer or CI environments.  

Implementing the recommendations above will greatly reduce attack surface and make the library suitable for production use.  

---  

*Prepared by:* **Security Review Engineer**  
*Date:* 2025‑08‑18  

---  
