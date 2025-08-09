# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.39


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Security Review – **Ollama Bash Library**  

**Version examined:** `0.42.39` (script header)  
**Target interpreter:** Bash ≥ 3.2  

*Prepared by:* ChatGPT – Expert Security Professional  

---  

## 1. Overview  

The script implements a fairly extensive Bash “library” for interacting with the **Ollama** AI inference server (both local and cloud‑based).  
It provides:

* Low‑level HTTP wrappers (`_call_curl`, `ollama_api_*`)  
* Generation / chat helpers (`ollama_generate*`, `ollama_chat*`)  
* Convenience utilities (model list, process view, env dump, version, etc.)  
* A command‑line “eval” helper (`ollama_eval`, alias `oe`) that builds a prompt, asks the model to generate a Bash one‑liner, and optionally executes it.

The bulk of the code is functional, but several **security‑relevant patterns** appear that merit close scrutiny, especially because the library deals with:

* **Untrusted input** (prompt text, model names, user‑supplied arguments).  
* **Dynamic command execution** (`eval`, `curl -d @-`).  
* **External network calls** (HTTP API, optional “Turbo” API key).  
* **Environment manipulation** (exporting variables, reading hidden input).  

Below we enumerate the findings, rate their severity, and give concrete remediation recommendations.

---  

## 2. Threat Model  

| Asset | Potential Adversary | Impact if compromised |
|-------|--------------------|-----------------------|
| **Local machine** (shell environment, files) | Untrusted local user, malicious script that sources this library | Remote code execution (RCE) via `eval`, leakage of API key, privilege escalation if library runs as root. |
| **Ollama server / Cloud API** | Network attacker, malicious model response | Data exfiltration, request spoofing, DoS, injection into downstream services. |
| **Stored API Key (`OLLAMA_LIB_TURBO_KEY`)** | Any process that can read environment variables / script source | Unauthorized use of the paid Ollama Cloud service, billing abuse. |
| **Debug / logging output** | Attacker with access to stdout/stderr | Sensitive data (prompt, model name, API key) may be exposed. |

---  

## 3. Findings  

### 3.1 Input Validation & Sanitisation  

| Location | Issue | Severity | Details |
|----------|-------|----------|---------|
| `ollama_generate_json`, `ollama_chat_json`, `ollama_api_post` | **JSON payloads are built with `jq -c -n`** – This is safe *as long as* the input strings are passed as `--arg`. That is done correctly. | Low | No injection into JSON, but note that `jq` may not be present – script would fail (handled later). |
| `ollama_generate` → `result="$(ollama_generate_json "$1" "$2")"` | The `result` variable captures **raw JSON** printed by the API. The script later runs `_is_valid_json "$result"` and extracts fields with `jq`. If the API ever returns malformed JSON, the script will treat it as failure – safe. | Low | Still, an attacker could cause the JSON to contain control characters (`\n`, `\r`, `\b`) that later get printed to the terminal. The library has a “safe mode” flag but it is never used. |
| `ollama_eval` – **User‑supplied *task* argument** is incorporated directly into the prompt that is sent to the model. While this is only used for *generation*, the model’s output (a Bash one‑liner) is later fed to `eval` after an **interactive confirmation**. | **Critical** | The model can be coerced (or the attacker can supply a crafted task) to return a command that performs any action the current user can run. The confirmation step mitigates accidental execution, but a malicious user could simply answer “y”. The library itself provides the confirmation UI, so a malicious caller can bypass it by setting `permission=y` via a non‑interactive wrapper or by feeding stdin. |
| `ollama_app_turbo` – reads API key from stdin (`read -r -s api_key`). The key is stored in a **global variable** and exported as `OLLAMA_HOST`/`OLLAMA_LIB_API`. No protection against accidental export to child processes. | Medium | Any later command that inherits the environment (including the generated command from `ollama_eval`) will see the key. This may leak to logs, `ps`, or other processes. |
| `ollama_model_random` – uses `RANDOM%${#models[@]}` inside a double‑quoted arithmetic context. Bash‑3.2 supports this, but the modulo expression can yield a *negative* index if `${#models[@]}` is zero (division by zero). The script checks length before, so safe. | Low | No issue. |

**Overall:** Input is *mostly* quoted correctly when passed to `jq`. The biggest validation gap concerns the **`eval` path** – the library deliberately executes arbitrary code generated by an LLM.

---

### 3.2 Command Execution  

| Location | Issue | Severity | Details |
|----------|-------|----------|---------|
| `_call_curl` – builds `curl_args` array and later runs `echo "$json_body" | curl "${curl_args[@]}"`. The JSON body is piped via stdin; there is **no quoting issue**. However, the **error check** (`if [ "$error_curl" -gt 0 ]; then`) uses `[ … ]` (POSIX test) which is fine. | Low | No command injection. |
| `ollama_eval` – uses `eval "$cmd"` **without any sanitisation**. | **Critical** | `eval` will interpret any characters, including backticks, `$()`, redirections, etc. The library tries to mitigate by prompting the user, but as noted above, the prompt can be bypassed. |
| `ollama_chat`, `ollama_generate` – call downstream functions that invoke `curl`, `jq`, `awk`, `sort`, etc. All invocation strings are quoted or passed as arrays, so no injection there. | Low | Good practice. |
| `ollama_list` – runs `ollama list` (external binary). If an attacker can place a malicious `ollama` executable earlier in `$PATH`, they could hijack the call. | Medium | No explicit path validation (e.g., `command -v ollama`), but this is common in scripts. It could be mitigated by using an absolute path or checking `command -v`. |
| `_exists` – uses `command -v`. Safe. |
| `ollama_app_vars` – prints many environment variables directly. If any of those contain newlines or control characters, they could corrupt terminal output or log files. | Low | Mostly informational. |

**Conclusion:** The **`eval` usage is the only high‑severity risk**. The rest of the command execution is safe with respect to injection, but there are a few opportunities to harden against binary hijacking and environment leakage.

---

### 3.3 Network & Credential Handling  

| Location | Issue | Severity | Details |
|----------|-------|----------|---------|
| `OLLAMA_LIB_TURBO_KEY` – stored in a **plain‑text environment variable** and sent as an HTTP `Authorization: Bearer` header. The variable is exported and thus inherited by *any* child process launched after the key is set. | High | An attacker who can run a command in the same session (or a malicious plug‑in) can read the environment via `ps e` or `/proc/<pid>/environ` and steal the key. |
| `_call_curl` – always uses `-s` (silent) and `-N` (no buffering). No explicit `--tlsv1.2` or `--cert` flags. If `OLLAMA_LIB_API` points to an HTTPS endpoint (Turbo mode), TLS is used automatically, but there is **no verification of the server’s certificate** (`curl` will verify by default, but the script does not set `--fail`), so a man‑in‑the‑middle could get a response but not the key. | Medium | Acceptable but could be hardened with `--fail` and explicit `--tls-max 1.2`. |
| No timeout on `curl` requests (`--max-time` missing). This could cause the script to hang indefinitely if the server becomes unresponsive. | Low | Not a direct security issue, but a DoS vector. |
| Turbo mode toggles `OLLAMA_HOST` to `https://ollama.com`. No validation that the URL is indeed the expected domain; an attacker could export `OLLAMA_HOST` beforehand to a malicious URL, then call library functions. | Medium | Environment variable is user‑controlled, which is expected; however, library could validate scheme+host when `OLLAMA_HOST` is set. |
| `ollama_api_ping` returns success for any response equal to the literal string `"Ollama is running"`. If an attacker controls the response body (e.g., via a proxy), they could cause false‑positive pings. | Low | Not critical but could mask connectivity problems. |

**Recommendations:** Store the Turbo key in a more protected location (e.g., a file with strict permissions) and **avoid exporting** it. Optionally use `set +a` to prevent automatic export, or unset after each request.

---

### 3.4 Filesystem & State  

| Location | Issue | Severity | Details |
|----------|-------|----------|---------|
| The library **does not write** any files except possibly temporary files created by `curl`/`jq`. No explicit cleanup needed. | Low | No file‑based attack surface. |
| `OLLAMA_LIB_MESSAGES` – an in‑memory Bash array of JSON strings. The array is never persisted, so no data leakage to disk. | Low | Safe. |
| `ollama_app_vars` prints environment variables, including potentially secret ones (`OLLAMA_AUTH`, `OLLAMA_HOST`, etc.). | Low | Information disclosure if the output is logged. |
| No use of `mktemp` or other temporary files in the script itself, reducing the risk of symlink attacks. | Low | Good practice. |

---

### 3.5 Environment & Side‑Effects  

| Issue | Severity | Details |
|-------|----------|---------|
| Global variables (`OLLAMA_LIB_*`) are mutable by any caller that sources the script. A malicious caller could set `OLLAMA_LIB_DEBUG=1` to dump all prompts and responses to stderr, potentially leaking secrets. | Medium | Consider making internal variables **readonly** where possible (`readonly OLLAMA_LIB_VERSION`) or namespacing them with a leading underscore. |
| The `oe` alias is defined globally. If another script also defines `oe`, the behavior may be overridden. | Low | Not a security issue per se. |
| `set -e` / `set -u` are **not** used. Errors may be ignored unintentionally, leading to unexpected behaviour (e.g., a failed `curl` still returning JSON). The script does explicit error checks, but lack of strict mode can mask bugs. | Low/Medium | Adding `set -euo pipefail` would improve robustness (still compatible with Bash 3.2 except for `pipefail`, which is supported). |

---

### 3.6 Compatibility with Bash 3.2  

| Feature | Compatibility | Comment |
|---------|---------------|---------|
| **Arrays** – used (`OLLAMA_LIB_MESSAGES`). Bash 3.2 supports indexed arrays, so OK. |
| **Associative arrays** – *none* used. Good. |
| **`[[ ... ]]`** – supported. |
| **`local`** – supported. |
| **`${VAR:-default}`** – supported. |
| **`${#array[@]}`** – supported. |
| **Process substitution `< <(...)`** – supported. |
| **`printf -v`** – *not used* (good). |
| **`declare -A` / `-g`** – not used. |
| **`(( ))` arithmetic** – supported. |
| **`read -r -s`** – supported. |
| **`$(command)`** – supported. |
| **`BASH_VERSION`** – fallback to `bash --version` works. |

**Conclusion:** The script appears **compatible with Bash 3.2**. The only potential incompatibility is the usage of `declare -p` or `local -a` (not present).  

---  

## 4. Recommendations  

Below are **actionable fixes**, grouped by severity.  

### 4.1 Immediate, high‑impact mitigations  

| # | Recommendation | How to implement |
|---|----------------|------------------|
| 1 | **Eliminate `eval`** – replace `ollama_eval`’s `eval "$cmd"` with a safer execution path (e.g., `bash -c "$cmd"` after strict validation, or require the generated command to be whitelisted). | Add a verification step: <br>`[[ "$cmd" =~ ^[[:alnum:]_/.\-]+$ ]] && bash -c "$cmd"` or use `set -o errexit` and `set -o pipefail`. |
| 2 | **Do not export the Turbo API key**. Store it in a file with mode `600` (e.g., `$HOME/.ollama_turbo_key`) and read it only when needed, then `unset OLLAMA_LIB_TURBO_KEY` after the request. | In `ollama_app_turbo`, replace `export OLLAMA_LIB_TURBO_KEY=...` with `OLLAMA_LIB_TURBO_KEY=$(<"$keyfile")` and `unset OLLAMA_LIB_TURBO_KEY` right after `_call_curl`. |
| 3 | **Add a strict‑mode guard** at the start of the script: `set -euo pipefail` (compatible with Bash 3.2; `pipefail` is optional but available). | Insert after the shebang: `set -euo pipefail`. |
| 4 | **Validate binary locations** for external commands (`curl`, `jq`, `ollama`). Use `command -v` and abort with a clear message if the binary is missing or not absolute. | Add a function `assert_cmd_exists` that calls `_exists` and checks that the returned path is absolute (`[[ "$(command -v curl)" = /* ]]`). Call it during initialization. |

### 4.2 Medium‑impact hardening  

| # | Recommendation | How to implement |
|---|----------------|------------------|
| 5 | **Add timeouts** to all `curl` calls (`--max-time 30` and `--connect-timeout 5`). | Extend `curl_args` in `_call_curl`. |
| 6 | **Force TLS verification** when using HTTPS. Add `--fail --silent --show-error` to `curl` to treat HTTP errors as failures. | Update `curl_args` accordingly. |
| 7 | **Sanitise debug output** – never write full request bodies when `OLLAMA_LIB_DEBUG` is enabled in production. Offer a masked mode (`*_debug` can truncate or hide secrets). | In `_debug`, replace `"$1"` with a filtered version: `printf '%s' "$1" | sed -E 's/(Authorization: Bearer )[^[:space:]]+/\1******/'`. |
| 8 | **Avoid leaking API key via child processes** – use `env -i` or `unset` before spawning commands that don’t need it (e.g., `ollama_list`). | Wrap calls: `env -i OLLAMA_LIB_API="$OLLAMA_LIB_API" curl …`. |
| 9 | **Validate `OLLAMA_LIB_API` URL** – ensure it starts with `http://` or `https://` and does not contain whitespace or shell metacharacters. | Add a check in initialization: `[[ "$OLLAMA_LIB_API" =~ ^https?://[^[:space:]]+$ ]] || { _error "Invalid OLLAMA_LIB_API"; exit 1; }`. |

### 4.3 Low‑impact improvements  

| # | Recommendation | How to implement |
|---|----------------|------------------|
| 10 | **Make internal constants readonly** (e.g., `readonly OLLAMA_LIB_NAME`). | Add `readonly` declarations after variable assignments. |
| 11 | **Document safe‑mode** – currently a flag (`OLLAMA_LIB_SAFE_MODE`) that never influences any function. Either implement it (escape control characters before printing) or remove it. | Implement a `_escape_control_characters` wrapper used in all `printf`/`echo` calls when the flag is set. |
| 12 | **Improve help output** – include usage examples and note that `eval` is dangerous. | Extend `ollama_lib_about` or add a `--help` function. |
| 13 | **Add unit‑test harness** – a small test suite using `bats-core` can automatically verify that invalid inputs are rejected. | Provide a separate `tests/` directory. |
| 14 | **Avoid hard‑coded prompts** – let callers provide a template or a “no‑eval” mode. | Add an optional argument to `ollama_eval` that disables execution. |

---  

## 5. Summary  

| Category | Findings | Overall Risk |
|----------|----------|--------------|
| **Command injection** | `eval` on untrusted model output | **Critical** |
| **Credential leakage** | Turbo API key stored in exported env var | **High** |
| **Network robustness** | No curl timeouts, no explicit TLS hardening | **Medium** |
| **Binary hijacking** | Calls to external binaries without path verification | **Medium** |
| **Information disclosure** | Debug prints, env dump, raw prompts | **Low–Medium** |
| **Compatibility** | Works with Bash 3.2, no modern features used | **None** |

**Bottom line:** The library is functional and reasonably well‑structured, but the **ability to execute arbitrary Bash code generated by an LLM** makes it unsuitable for *untrusted* environments without additional safeguards. Implement the high‑severity mitigations (remove or lock down `eval`, protect the API key, and enforce strict error handling) before using this script in production or distributing it to other users.  

---  

### Quick “hardening” checklist

```bash
# Add at top of the script
set -euo pipefail   # abort on errors, treat unset vars as errors
readonly OLLAMA_LIB_NAME OLLAMA_LIB_VERSION OLLAMA_LIB_URL ...

# Prevent API key export
unset OLLAMA_LIB_TURBO_KEY
read_api_key() {  # called only when needed
  local key_file="${HOME}/.ollama_turbo_key"
  if [[ -r "$key_file" ]]; then
    OLLAMA_LIB_TURBO_KEY=$(<"$key_file")
  else
    read -r -s "Enter Ollama API Key: " OLLAMA_LIB_TURBO_KEY
    printf '%s' "$OLLAMA_LIB_TURBO_KEY" >"$key_file"
    chmod 600 "$key_file"
  fi
}
# Call read_api_key just before _call_curl when OLLAMA_LIB_TURBO_KEY is required,
# then `unset OLLAMA_LIB_TURBO_KEY` immediately afterwards.

# Replace eval with safe exec
safe_exec() {
  local cmd="$1"
  # Very simple whitelist: allow only alphanum, /, ., -, _, and whitespace
  if [[ "$cmd" =~ ^[[:alnum:]_/.\-[:space:]]+$ ]]; then
    bash -c "$cmd"
  else
    _error "Command rejected by safe_exec"
    return 1
  fi
}
# In ollama_eval:
if [[ "$permission" == 'y' ]]; then
  safe_exec "$cmd"
fi
```

Implementing the above (or similar) will dramatically reduce the attack surface while preserving the library’s core functionality.  

---  

*End of review.*
