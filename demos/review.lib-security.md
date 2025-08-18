# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.5


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_thinking hide
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Security Review – **Ollama Bash Lib**  

**Version examined:** `0.45.5` (2025)  
**Target Bash version:** ≥ 3.2  

---  

## 1. Overview  

The script is a fairly large Bash library that wraps the Ollama HTTP API and provides a set of convenience functions (chat, generate, tools, model‑management, etc.).  
It relies on a handful of external utilities (`curl`, `jq`, `shuf`, `awk`, `timeout`, …) and stores an optional API‑key (`OLLAMA_LIB_TURBO_KEY`) for the “Turbo” cloud mode.

The primary security concerns for a Bash library of this size are:

| Area | Why it matters |
|------|----------------|
| **Input validation / command injection** | Any data that is interpolated into a shell command (e.g. `curl`, tool execution, `eval`) can become a vector for code execution. |
| **Secret handling** | API keys must never be logged or exported unintentionally. |
| **Execution environment** | Tools and the optional “sandboxed eval” run external commands; the environment they inherit must be tightly controlled. |
| **Error handling & exit status** | Unexpected failures should not leave the library in an insecure state (e.g. partially‑filled globals). |
| **Compatibility** | The script must continue to work on Bash 3.2 without relying on later‑only features. |

Below is a systematic analysis of the script against these concerns, followed by concrete hardening recommendations.

---  

## 2. Threat Model  

| Actor | Goal | Capability |
|-------|------|------------|
| **Malicious user** who can supply arguments to library functions (e.g. `ollama_generate_json "model" "$(malicious_prompt)"`). | Run arbitrary commands on the host, exfiltrate secrets. | Can only use the public functions; cannot directly edit the script. |
| **Compromised remote API** (e.g. a malicious Ollama server). | Return crafted JSON that triggers unsafe behaviour when parsed. | Can influence any JSON payload that the library forwards to `jq` or `curl`. |
| **Local privileged attacker** who can read environment variables or the script on disk. | Harvest the Turbo API key. | Can read the process environment; may attempt to dump memory. |
| **Supply‑chain attacker** who can replace a required external binary (`jq`, `curl`, …). | Induce arbitrary code execution via trojaned binaries. | Must have write access to the host’s `$PATH`. |

The library already mitigates a number of these vectors, but a few gaps remain (see Findings).

---  

## 3. Findings  

### 3.1 General / Coding Practices  

| Observation | Severity | Details |
|-------------|----------|---------|
| `set -o pipefail` is used, but **`set -euo`** is not. | **Medium** | Without `-e` the script continues after a failed command, which can leave globals in an inconsistent state. `-u` would catch accidental use of unset variables. |
| Global constants (`OLLAMA_LIB_NAME`, `OLLAMA_LIB_VERSION`, …) are plain variables, not `readonly`. | Low | Accidentally re‑assigning them could alter library behaviour. |
| Functions frequently use `printf '%s' "$var"` – good – but a few places use `$var` unquoted (e.g. `curl_args+=( "${OLLAMA_LIB_API}${endpoint}" )` where `endpoint` is validated, still better to always quote. | Low | Quoting everywhere removes any future risk if validation changes. |
| Many functions accept “help” flags by looping over `"$@"`. This works, but it also accepts `-h` **anywhere** in the argument list which could mask legitimate positional arguments. | Low | Not a security issue, but could cause unexpected behaviour. |
| Use of `read -r -n 1` in `_ollama_thinking_stream`. This reads a *single* character from stdin; if the stdin is a pipe from a malicious source the function may block or truncate data. | Low | Not exploitable, but could be a denial‑of‑service in badly‑behaving pipelines. |

### 3.2 Input Validation  

| Function | Validation | Verdict |
|----------|------------|---------|
| `_exists`, `_is_valid_url`, `_is_valid_json` | Good – they rely on `command -v`, regex, and `jq -e`. | ✅ |
| `_call_curl` – endpoint validation | Checks that the endpoint starts with `/` and contains no spaces or backslashes. | ✅ |
| `_is_valid_model` | Allows alphanumerics, `. _ : / -`. This matches Ollama’s model identifiers, but also permits `../` traversal strings that could be interpreted by a downstream tool. | ⚠️ |
| `ollama_tools_add` – tool command | No validation of the supplied command other than “non‑empty”. The command is later executed verbatim by `ollama_tools_run`. | ❗️ High |
| `ollama_tools_run` – runs `"$command" "$tool_args_str"` | No sanitisation; any command supplied by the user of the library will be executed with the library’s privileges. | ❗️ High |
| `ollama_eval` – final `eval "$cmd"` | An explicit “dangerous eval” path exists, but the danger check is a simple pattern list; sophisticated bypasses (e.g. `$'\\e[...` or indirect expansion) are possible. | ⚠️ Medium |

### 3.3 Secret Management  

| Observation | Severity | Details |
|-------------|----------|---------|
| The Turbo API key is stored in the shell variable `OLLAMA_LIB_TURBO_KEY`. It is **not exported** unless the caller passes `-e` to `ollama_app_turbo`. | Low | Good practice – the key stays in the script’s process only. |
| `_redact` only replaces the key if it appears *exactly* as the string stored in `OLLAMA_LIB_TURBO_KEY`. If the key is included in a larger string (e.g. JSON value `"key":"$OLLAMA_LIB_TURBO_KEY"`), the function will still redact correctly because it substitutes the raw value. However, other secrets (e.g. `OLLAMA_AUTH`) are only redacted by `_get_redacted_var` if the variable name contains *AUTH*, *KEY* or *TOKEN*. | Medium | The library could inadvertently expose other secret‑like env vars (e.g. `MY_SUPER_SECRET`) when `ollama_lib_about` prints all env vars. |
| `ollama_lib_about` prints the **status** of the key (`YES [REDACTED]`) but never the value itself. | ✅ |
| `ollama_app_turbo` validates the host URL after constructing it, but does not validate the format of the API key (e.g. length, allowed characters). | Low |

### 3.4 Command Execution  

| Path | Risk |
|------|------|
| **Tool execution** (`ollama_tools_run`) – runs an arbitrary command stored by the user. The arguments are passed as a **single string** (`"$tool_args_str"`). If the command itself performs shell parsing (e.g. `sh -c "$args"` inside the tool script) the supplied JSON could cause injection. | **High** – this is the most powerful “code‑exec” surface. |
| **Sandboxed eval** (`_ollama_eval_permission_sandbox`) – spawns a fresh Bash with only `PATH` set. This mitigates many risks, but the command still receives the full JSON string as a literal argument; a malicious command could read that argument and use it to exfiltrate data. | Medium |
| **Dangerous eval** (`_ollama_eval_permission_dangerous_eval`) – calls `eval` directly after a second confirmation. The danger check attempts to block known destructive utilities, but pattern matching can be evaded (`$(rm -rf /)` inside a string, use of `\` to escape, etc.). | High |
| **`curl`** – all user‑supplied data is transmitted via `-d @-` (stdin) after being processed by `jq`. No command‑injection risk here. |
| **`timeout`** – used for syntax checking only; not a security issue. |
| **`env -i PATH="/bin:/usr/bin" bash -r -c "$cmd"`** (sandbox) – runs the command with a *restricted* environment but **does not drop privileges**. If the script is executed as a privileged user (e.g. via `sudo`), the sandbox still runs with root. | Critical if the library is ever used in a privileged context. |

### 3.5 External Dependencies  

| Dependency | Issue |
|------------|-------|
| `jq` – required for JSON handling. If an attacker can replace it with a malicious binary, arbitrary code can be executed at the point of the first `jq` call. | Mitigation: prefer `command -v jq` (already done) and document the need for integrity‑checked binaries. |
| `curl` – same supply‑chain risk. |
| `shuf` – optional; fallback to `awk` works on all POSIX‑compatible systems. |
| `timeout` – optional; fallback works. |
| `column`, `compgen` – optional for pretty‑printing; no security impact. |

### 3.6 Compatibility (Bash 3.2)  

The script **avoids** features that require Bash 4+:

| Feature | Bash 3.2 support |
|---------|-----------------|
| Associative arrays – **not used**. |
| `declare -A` – not used. |
| `printf -v` – not used. |
| `${var@Q}` quoting – not used. |
| `readarray`/`mapfile` – not used. |
| `[[ -v var ]]` – not used. |
| `[[ $var =~ $regex ]]` – works in Bash 3.2. |
| `[[ -n "${var:-}" ]]` – fine. |
| `local` in functions – supported. |
| `${array[@]}` expansion – works. |
| `pipefail` – supported. |

The only possible compatibility snag is `read -r -n 1` used in `_ollama_thinking_stream`. This option exists in Bash 3.2 (see `man bash`), so it is safe.

---  

## 4. Recommendations  

### 4.1 Harden Execution Flow  

| Recommendation | Rationale |
|----------------|-----------|
| **Add `set -euo pipefail`** at the top (or emulate `-u` with manual checks). This forces the script to abort on any unexpected error or use of an unset variable, preventing continuation with corrupted globals. |
| **Make constant variables `readonly`** (e.g. `readonly OLLAMA_LIB_NAME='Ollama Bash Lib'`). Prevent accidental re‑assignment. |
| **Quote all expansions** – even those that appear safe today. E.g. `curl_args+=( "${OLLAMA_LIB_API}${endpoint}" )`. |
| **Validate model names more strictly** – disallow `..` or leading `/` to avoid path‑traversal‑like surprises when a model name is later used in a tool command. |
| **Sanitize tool commands**: before adding a tool (`ollama_tools_add`), check that the command does **not** contain any of the dangerous tokens already listed for `ollama_eval`. Optionally force the command to be an absolute path (e.g. `/usr/bin/awk`) and ensure the file is executable. |
| **Run tools in a restricted environment**: modify `ollama_tools_run` to invoke the command via `env -i PATH="/usr/bin:/bin" bash -c "$command" "$tool_args_str"` – this mirrors the sandbox used for `ollama_eval`. This prevents tools from inheriting secrets such as `OLLAMA_LIB_TURBO_KEY`. |
| **Never run the library as root**. If a privileged execution is unavoidable, explicitly drop privileges inside sandboxed sections (`sudo -u nobody …`). |
| **Add a timeout to tool execution** (e.g. `timeout 30 env -i … "$command" "$tool_args_str"`). Prevent runaway commands. |
| **Strengthen `ollama_eval` danger check**: use a full parser (`bash -n`) **and** a whitelist of allowed built‑ins (`printf`, `sed`, `awk`, …) rather than a blacklist. Consider removing the dangerous‑eval path entirely in production deployments. |
| **Do not expose raw environment variables** in `ollama_lib_about`. Instead, list only the *known* library variables, or optionally filter with a pattern whitelist. |
| **Separate “debug” from “verbose”**: Use two flags (`OLLAMA_LIB_DEBUG` and `OLLAMA_LIB_VERBOSE`) so that level‑2 debug does not accidentally log secrets. |

### 4.2 Secret Handling Enhancements  

| Recommendation | Rationale |
|----------------|-----------|
| Store the Turbo API key in a **read‑only** variable (`readonly OLLAMA_LIB_TURBO_KEY`) after it is imported, to avoid accidental modification. |
| When reading the key from stdin, trim whitespace (`api_key="${api_key##*([[:space:]])}"`) to avoid accidental newline characters that could be reflected in logs. |
| Provide an option to read the key from a **protected file** (e.g. `${HOME}/.ollama/turbo.key` with mode `600`). |
| In all debug messages (`_debug`), **always** pass the text through `_redact` first, even if the message does not contain the key (defensive programming). |
| If the library is sourced by other scripts, consider prefixing secret variables with an underscore (`_OLLAMA_TURBO_KEY`) to make accidental export less likely. |

### 4.3 Dependency Integrity  

| Recommendation | Rationale |
|----------------|-----------|
| At start‑up, verify the **checksums** of required binaries (`jq`, `curl`, `shuf`, `timeout`) or at least confirm they are located in a trusted directory (`/usr/bin`, `/bin`). |
| Provide a fallback that aborts if `jq` is missing, rather than attempting to continue with malformed JSON. |
| Document the minimal required versions of external tools (e.g. `jq >= 1.5`). |

### 4.4 Documentation & Usage Guidance  

| Recommendation | Rationale |
|----------------|-----------|
| Clearly state in the README that **tool commands are executed with the privileges of the calling process** and that adding tools should be limited to trusted users. |
| Mention that the `ollama_eval` dangerous‑eval mode is **high‑risk** and should be disabled in production. |
| Add an “installation checklist” that includes: `chmod 600` on any file containing the Turbo key, avoid running as root, verify `jq`/`curl` binaries. |
| Provide example “hardening” wrappers (`ollama_tools_add --safe …`) that enforce the extra checks. |

---  

## 5. Summary  

| Category | Overall Rating |
|----------|----------------|
| **Input validation** | **Good** (most endpoints validated) – but **tool commands** and **eval** are high‑risk surfaces. |
| **Secret handling** | **Adequate** – redaction works, but broader env‑var filtering and optional key‑file support would improve it. |
| **Command execution** | **Needs hardening** – sandbox all external commands, add timeouts, and consider removing the dangerous `eval` path. |
| **Error handling** | **Fair** – add `set -euo` and explicit checks for return codes. |
| **Compatibility** | **Excellent** – works on Bash 3.2, avoids newer Bash features. |
| **Supply‑chain** | **Typical** – relies on external binaries; recommend checksum verification. |

**Bottom line:** The library is functional and reasonably safe for *trusted* local use. To make it robust for untrusted or multi‑user environments, focus on:

* stricter validation for tool commands,  
* sandboxing every external command (including tools),  
* tightening the eval pathway, and  
* adopting `set -euo pipefail` + readonly constants.

Implementing the recommendations above will raise the security posture from “acceptable for personal scripts” to “suitable for broader, production‑type deployments”.  

---  

*Prepared by: [Your Name], Security Engineer – Bash & DevOps*  
*Date: 2025‑08‑18*  
