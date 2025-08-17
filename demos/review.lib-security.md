# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.2


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
*Version 0.45.2* – Review performed for Bash ≥ 3.2  

---

## 1️⃣  Overview  

The script implements a fairly large Bash‑only client library for the **Ollama** AI service.  
It provides:

* HTTP wrapper (`curl`) for the Ollama REST API  
* Helper functions for generation, chat, streaming, model management, tools, etc.  
* “Turbo” mode that adds an Authorization header (secret API key)  
* An **`ollama_eval`** helper that can `eval` AI‑generated Bash code after an optional safety‑check.  

Overall the code is well‑structured, heavily commented and avoids many classic Bash pitfalls (e.g. it uses `printf` instead of `echo -e`, quotes variables, checks command existence, validates JSON with `jq`, validates URLs with a regex, etc.).

Nevertheless, the script runs untrusted data (model responses, user‑provided arguments, tool definitions) through a number of external commands and, in one place, through `eval`. Below is a detailed security analysis with recommendations.

---

## 2️⃣  Compatibility with Bash 3.2  

| Feature | Bash 3.2 support | Comment |
|--------|------------------|---------|
| `local` variables | ✅ | Supported |
| Arrays (indexed) | ✅ | Used throughout |
| `$(( ))` arithmetic | ✅ | Used for flags |
| Process substitution `<(...)` | ✅ (since Bash 3) | Used in streaming functions |
| Here‑string `<<<` | ✅ | Used in syntax checks |
| `[[ … =~ … ]]` regex matching | ✅ | Used for validation |
| `set -o pipefail` | ✅ (since Bash 3) | Already enabled |
| `declare -A` (associative arrays) | ❌ – not used, so fine | Avoided for compatibility |
| `[[ -v var ]]` (variable existence) | ❌ – not used | No impact |

The script **should work** on any Bash ≥ 3.2 without modification.

---

## 3️⃣  Security Findings  

### 3.1 Input Validation & Sanitisation  

| Area | Issue | Risk | Current Mitigation |
|------|-------|------|--------------------|
| **API endpoint (`_call_curl`)** | Checks that the endpoint starts with `/` and contains no spaces or backslashes, but it does **not** prevent path traversal (`/../`) or other special characters (e.g. `\r`). | Potentially allows a malicious caller to reach unintended API paths (`/api/../secret`). | Basic validation only. |
| **JSON payloads** | Relies on `_is_valid_json` (via `jq`) which ensures syntactically valid JSON, but does **not** enforce size limits or escape dangerous characters before they are sent to the server. | Large or malformed payloads could cause DoS or unexpected behaviour in the API server. | Validation done, but no size/complexity limits. |
| **Tool definitions (`ollama_tools_add`)** | Checks that the definition is valid JSON, but does not limit the JSON schema or content (e.g. could embed malicious shell commands). | Malicious tool can be added, later executed by `ollama_tools_run`. | Only JSON syntax check. |
| **Environment variables** | Secret variables (`OLLAMA_LIB_TURBO_KEY`) are redacted only in `_redact`. Other potentially-sensitive env vars (e.g. `CUDA_VISIBLE_DEVICES`) are printed unredacted in `ollama_app_vars`. | Information leakage (system layout, credentials) when debugging or when a user runs `ollama_lib_about`. | Limited redaction. |
| **User‑provided model name** (`_is_valid_model`) | Allows any alphanumerics, `.`, `_`, `:`, `/`, `-`. This is reasonable, but no length check. | Extremely long model names could overflow buffers in downstream tools (unlikely in Bash, but could affect the API). | No explicit length limit. |

### 3.2 Command Injection  

| Function | Issue | Risk | Mitigation |
|----------|-------|------|-----------|
| **`_exists`** | Uses `command -v "$1"` – safe because `$1` is not expanded as a command line. | None | ✅ |
| **`ollama_tools_run`** | Executes `"$command" "$tool_args_str"` where `command` comes from a previously‑registered tool. The command string is **not** quoted as a single argument; if it contains spaces the shell will split it, potentially invoking unexpected binaries. | Tool registration could be abused to run arbitrary commands. | Use `eval "exec $command" "$tool_args_str"`? Better: store the command in an **array** and `"$command"` as the first element, e.g. `OLLAMA_LIB_TOOLS_COMMAND[i]=("$cmd" "arg1" "arg2")`. |
| **`ollama_eval`** | Provides a user‑controlled “eval” path that can run AI‑generated Bash code. Though safe mode disables it, the function itself prompts the user and can run code in a sandboxed environment with `env -i PATH="/bin:/usr/bin" bash -r -c "$cmd"`. However, if a user answers **`Y`** the code is executed with **privileges of the caller**. | Remote code execution if attacker convinces a privileged user to run the helper. | • Keep safe mode on by default (`OLLAMA_LIB_SAFE_MODE=1`). <br>• Remove the “eval” branch entirely or require the script to be run as non‑root. <br>• Perform additional static analysis (e.g., use `shellcheck` on the generated command) before execution. |
| **`_call_curl`** | Builds `curl` arguments from user‑controlled variables (`OLLAMA_LIB_API`, `$endpoint`, `$json_body`). Uses an array, so argument splitting is safe. The only potential risk is **shell‑expansion** in `$json_body` before it is piped into `curl`. The script uses `printf '%s' "$json_body"` which prevents interpretation of backslashes, but does not escape new‑lines that could break JSON. | Unlikely, but malformed JSON could leak via HTTP error messages. | Consider using a temporary file (`curl -d @tmpfile`) to avoid any hidden characters. |
| **`ollama_app_turbo`** | Prompts for the API key with `read -s`. The key is stored in a variable and exported only when `-e` is passed. No injection risk here. | None | ✅ |

### 3.3 Secret / Credential Handling  

* **Redaction** – Implemented only for `OLLAMA_LIB_TURBO_KEY` in `_redact`. Other secrets (e.g., `CUDA_VISIBLE_DEVICES`, `HTTP_PROXY`, the Discord invite URL) are printed in plain text by `ollama_lib_about` and `ollama_app_vars`.  
* **Exported vars** – In Turbo mode the script does `export OLLAMA_HOST` and `export OLLAMA_LIB_API`. If the script is sourced in a login shell these variables persist for the whole session, potentially leaking to unrelated child processes.  

**Recommendation** – Centralise secret handling:  

```bash
_redact_all() {
    local val="$1"
    case "$2" in
        *KEY*|*TOKEN*|*PASS*|*AUTH*) printf '[REDACTED]' ;;
        *) printf '%s' "$val" ;;
    esac
}
```

and use it in all “about / vars” printers.

### 3.4 Use of External Dependencies  

| Dependency | Criticality | Observation |
|------------|------------|--------------|
| `curl` | Required for every API call | Checked with `_exists`. |
| `jq` | Required for JSON validation & manipulation | Checked, but many functions abort if missing (good). |
| `timeout` | Used for syntax checking in `ollama_eval` | Optional; missing `timeout` degrades safety checks. |
| `shuf`, `awk` | Used for random model selection | Fallbacks are provided. |
| `column`, `compgen` | Used only for pretty‑printing the function list | Not security‑critical. |

All external commands are **invoked via arrays** (not via string concatenation), which prevents word‑splitting attacks.  

### 3.5 Privilege / Sandbox  

* The library never attempts to **drop privileges**. If a user runs the script as **root**, any `ollama_eval` execution (sandboxed or not) will also run as root.  
* The sandbox implemented in `ollama_eval` (`env -i PATH="/bin:/usr/bin" bash -r -c "$cmd"`) removes environment variables but **does not** restrict filesystem access (e.g., via `rm -rf /`).  

**Recommendation** – Either:  

1. Detect if `$EUID == 0` and refuse to run `ollama_eval`, or  
2. Run the sandboxed command inside a more restrictive container (e.g., `nsenter`, `firejail`, or `docker run --rm -i alpine sh -c "$cmd"`).

### 3.6 Error Handling & Exit Codes  

* The script frequently uses `return` inside functions, which is fine for library usage.  
* `set -o pipefail` is enabled, but **`set -e` (errexit)** is **not** – an error in a subshell can be ignored if the caller does not check `$?`. Most callers do check, but a missed check could lead to silent failures.  

**Recommendation** – Add `set -euo pipefail` at the top of the library (with a guard that disables `-e` for interactive use if that is undesirable).  

### 3.7 Logging / Debug Output  

* `_debug` prints messages to **stderr** (good) but includes potentially sensitive values: e.g., the full JSON payload, the full API URL, the raw command in `ollama_eval`.  
* Debug output can be disabled by setting `OLLAMA_LIB_DEBUG=0`, but in **turbo mode** it is still possible to enable debugging inadvertently.  

**Recommendation** – Filter debug output through `_redact_all` to strip any secret values before printing.

---

## 4️⃣  Recommendations & Hardening Steps  

Below are concrete actions you can take to improve the security posture while keeping Bash ≥ 3.2 compatibility.

### 4️⃣.1 Sanitise API Paths

```bash
_is_valid_api_path() {
    local p="$1"
    # Reject any ".." or control characters
    [[ "$p" =~ ^/[^[:cntrl:]]+$ && "$p" != *'..'* ]] && return 0
    return 1
}
```

Call this in `_call_curl` instead of the current simple check.

### 4️⃣.2 Redact All Secrets in Logs

Replace `_redact` with a more generic version:

```bash
_redact() {
    local str="$1"
    # List of patterns considered secret
    local -a secret_vars=("OLLAMA_LIB_TURBO_KEY" "CUDA_VISIBLE_DEVICES" "HTTP_PROXY" "HTTPS_PROXY" "ALL_PROXY" "PASS" "TOKEN")
    for var in "${secret_vars[@]}"; do
        local val="${!var}"
        [[ -n "$val" ]] && str=${str//"$val"/[REDACTED]}
    done
    printf '%s' "$str"
}
```

### 4️⃣.3 Make `ollama_eval` Safer (or remove)

* **Default safe mode** – set `OLLAMA_LIB_SAFE_MODE=1` in the library header.  
* **Remove the “eval” branch** completely; users who truly need it can source a modified copy.  
* If kept, add an extra confirmation that the caller is **not root** and **is aware**:

```bash
if [[ $EUID -eq 0 ]]; then
    _error "Refusing to run eval as root"
    return 1
fi
```

### 4️⃣.4 Tool Execution Safety

Store commands as **arrays** to preserve spacing and avoid word‑splitting:

```bash
OLLAMA_LIB_TOOLS_COMMAND=()   # each element is a *single* command string

ollama_tools_add() {
    ...
    OLLAMA_LIB_TOOLS_COMMAND+=("$command")  # quoted, stored as one element
}
```

Then run with `eval`‑less execution:

```bash
"$command" "$tool_args_str"
# or if you need arguments split:
cmd_arr=(${command})   # split once at definition time, not at exec time
"${cmd_arr[@]}" "$tool_args_str"
```

### 4️⃣.5 Limit Verbose Information Exposure

* Remove the `ollama_lib_about` and `ollama_app_vars` functions from any production environment, or hide them behind a `DEBUG_ONLY` flag.  
* Ensure `OLLAMA_LIB_DEBUG` is **off by default**.

### 4️⃣.6 Add Size / Rate Limits

When dealing with model responses, limit the amount of data streamed:

```bash
# Example in ollama_generate_json
if (( $(printf '%s' "$json_payload" | wc -c) > 1048576 )); then
    _error "Payload > 1 MiB – aborting to avoid DoS"
    return 1
fi
```

### 4️⃣.7 Improve Error Propagation

Add `set -euo pipefail` at the very top (or expose them as an optional “strict mode” that callers can enable):

```bash
set -euo pipefail
```

Wrap library load in a guard to avoid breaking scripts that deliberately ignore errors:

```bash
{ set -euo pipefail; source /path/to/ollama-bash-lib.sh; } || true
```

### 4️⃣.8 Consider Using `mktemp` for JSON Body

Instead of piping via `printf`, write the payload to a temporary file owned by the current user and pass `-d @tmpfile` to `curl`. This eliminates the risk of *control characters* being interpreted by `printf` or the shell.

```bash
tmp=$(mktemp)
printf '%s' "$json_body" >"$tmp"
curl "${curl_args[@]}" -d @"$tmp"
rm -f "$tmp"
```

### 4️⃣.9 Guard Against Path Traversal in Tool Definitions

If you ever expand tool definitions into file paths (future features), enforce that the path is under a known safe directory using `realpath`.

---

## 5️⃣  Summary of Findings  

| Category | Severity | Quick Wins |
|----------|----------|------------|
| **Command injection via `ollama_eval`** | **High** (remote code execution) | Enable safe mode by default, optionally remove the function. |
| **Insufficient logging redaction** | Medium | Expand `_redact` to cover all known secret env vars. |
| **Tool command word‑splitting** | Medium | Store commands as arrays or quote them tightly. |
| **API path validation** | Low | Add stricter regex that forbids `..` and control chars. |
| **Privilege escalation via sandbox** | Low‑Medium | Disallow `ollama_eval` when run as root; consider stronger sandbox (container). |
| **Missing strict error handling** | Low | Add `set -euo pipefail` or provide an optional strict‑mode flag. |
| **Information leakage in “about/vars” commands** | Low | Make these functions debug‑only or remove from production. |

Overall, the library is **well‑engineered** for its purpose, but the **`ollama_eval`** helper combined with the **optional debug output** constitute the most critical attack surfaces. By applying the mitigations above, the script can be safely used in production environments while remaining compatible with Bash 3.2.  

--- 

*Prepared by: **Security Analyst – Bash Hardening Specialist***  
*Date: 2025‑08‑17*  
