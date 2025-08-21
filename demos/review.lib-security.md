# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.9


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_thinking hide
ollama_generate -m "gpt-oss:120b" -p "$task\n\n$(cat "$file")"
```
# Security Review – Ollama Bash Library  
**Target Bash version:** 3.2 or higher  

---  

## 1. Overview  

The script provides a fairly large collection of helper functions that wrap the Ollama HTTP API (via `curl`) and the local Ollama CLI.  
Its design is **functional** – most public entry points are `ollama_*` functions, while the rest are internal helpers prefixed with `_`.  

From a security standpoint the library is mainly a **client** that:

* builds HTTP requests,
* parses JSON with `jq`,
* maintains in‑memory state (messages, tools, configuration variables).

The review focuses on **confidentiality, integrity and availability** of the library itself and of the data it handles.

---  

## 2. Threat Model  

| Actor | Goal | Likely Attack Vector |
|------|------|----------------------|
| **Malicious user of the library** (e.g. a script that sources the file) | Leak API keys, execute arbitrary commands, poison JSON payloads, cause DoS | 1️⃣ Use of debugging output, 2️⃣ Injection through environment variables or function arguments, 3️⃣ Tool‑execution feature |
| **Remote attacker** (able to influence the Ollama API URL or the content returned by the API) | Perform server‑side request forgery (SSRF), steal data, run malicious JSON through the library | Manipulating `OLLAMA_LIB_API`, `OLLAMA_HOST`, or the JSON that the API returns |
| **Local attacker** (low‑privileged user on the same host) | Read the API key from the process environment or from a script that enables debug mode | Access to the environment variables or to the terminal output when `OLLAMA_LIB_DEBUG` ≥ 1 |

---  

## 3. Findings  

### 3.1 Information Disclosure  

| Location | Issue | Impact |
|----------|-------|--------|
| `_debug` / `_error` | When `OLLAMA_LIB_DEBUG` ≥ 1 the full message (including any user‑supplied data) is printed to **stderr**. The redaction routine only replaces the exact value of `OLLAMA_LIB_TURBO_KEY`. Other secrets (e.g. `OLLAMA_AUTH`, `CUDA_VISIBLE_DEVICES`) are **not** redacted. | Sensitive information may be written to logs, screen recordings, or pipe‑chains. |
| `ollama_app_turbo` | The API key is stored in the variable `OLLAMA_LIB_TURBO_KEY`. If the user enables debug mode *after* the key is set, the key will appear in debug messages that are not redacted (the key string is only replaced when it is present **exactly** as stored). | Accidental exposure of the API key. |
| `ollama_lib_about` | Prints the presence of the Turbo key (`YES [REDACTED]`). The presence flag itself leaks the fact that a privileged key is loaded. | Minor, but may assist enumeration. |

### 3.2 Input Validation / Injection  

| Location | Issue | Impact |
|----------|-------|--------|
| `_is_valid_url` | Very permissive regex – only checks for `http(s)://host[:port]`. It **allows** URLs such as `http://example.com:80/evil?cmd=rm%20-rf%20/`. The path part is stripped later, but a crafted host with embedded newlines or shell metacharacters could bypass later checks. | Possible **Server‑Side Request Forgery** (SSRF) if an attacker can set `OLLAMA_LIB_HOST` or `OLLAMA_LIB_API`. |
| `_call_curl` | Endpoint is concatenated directly: `"${OLLAMA_LIB_API}${endpoint}"`. No validation of the *full* URL after concatenation. If `OLLAMA_LIB_API` contains a trailing slash or extra arguments (`http://host:11434/;rm -rf /`), the entire string is handed to `curl`, which will treat the semicolon as a separate argument only if word‑splitting occurs. The code uses an **array** (`curl_args+=`) and **quotes** the value, so word splitting is prevented; however, a malicious value that contains *newlines* could introduce extra arguments when Bash expands the array. | Potential command injection via crafted environment variable. |
| Model name handling (`_is_valid_model`) | Validation regex `^[a-zA-Z0-9._:/-]+$` permits **colon** (`:`) and **slash** (`/`). A model string like `my/model:bad` is accepted and later interpolated into a JSON payload (`--arg model "$model"`). Since `jq` receives the value as a JSON string, the content is safely escaped, but the value is also used as a **CLI argument** in some places (e.g. `ollama show "$model"`). If the model contains spaces or shell meta‑characters, it would be split or interpreted by the CLI, leading to **command injection**. The current regex does *not* allow spaces, which mitigates this risk, but `/` and `:` can still be used to trick the CLI into interpreting a *different* sub‑command. | Remote code execution when a malicious model name is supplied. |
| Tool execution (`ollama_tools_run`) | The command associated with a tool is executed directly: `"$command" "$tool_args_str"`. No sanitisation of `$command`. If an attacker can register a tool with a malicious command (e.g. `rm -rf /`), it will be executed with the privileges of the script. | **Privilege escalation** or destructive actions via malicious tool registration. |
| `ollama_app_turbo` – reading API key | Reads key via `read -r -s api_key`. The input is stored unchanged in a variable that later may be exported. No verification of the format. | If the user accidentally pastes extra characters (e.g. newline) they become part of the key and could break authentication but not a security issue. |  

### 3.3 Sensitive Data Lifetime  

* The key (`OLLAMA_LIB_TURBO_KEY`) is kept in the process environment for the life of the script.  
* No explicit **unset** after it is no longer needed (except when switching to “off”).  

**Impact:** An attacker that can inspect the process environment (e.g. via `ps e` on the same machine) can retrieve the key while the script is running.

### 3.4 Denial‑of‑Service (DoS)  

* Functions that read from `stdin` (`ollama_generate_json`, `ollama_generate`, `ollama_generate_stream`, etc.) will block indefinitely if no data is ever provided and the script is not attached to a terminal.  
* No timeout for reading from `stdin`.  

**Impact:** A malicious caller could cause the script to hang, tying up system resources.

### 3.5 Compatibility / Portability  

* The script uses **indexed arrays**, which are available in Bash 3.2.  
* It uses `$(( ))` arithmetic, `[[ ]]`, `local`, and `declare -a`‑style array expansions – all supported.  
* It depends on external commands (`jq`, `curl`, `shuf`, `awk`, `column`, `compgen`) that may be absent on minimal installations. The script checks for existence in many places, but some functions (e.g., `ollama_list_array`) assume `awk` is present without a pre‑flight check.  

---  

## 4. Recommendations  

### 4.1 Harden Debug / Logging  

1. **Never enable debug in production** unless you explicitly need it.  
2. Extend `_redact` to mask *any* environment variable that contains the substrings `KEY`, `TOKEN`, `SECRET`, `PASS`, `PWD`, `AUTH`, `CERT`, etc., not only the exact turbo key.  
3. When `OLLAMA_LIB_DEBUG` ≥ 2 (verbose) consider redirecting debug output to a dedicated log file with restricted permissions (e.g., `chmod 600`).  

### 4.2 Validate & Sanitize Configuration Variables  

```bash
# Validate the full API URL after concatenation
_is_valid_full_url() {
    local url="$1"
    # Simple check – must start with http(s):// and contain no whitespace or control chars
    [[ "$url" =~ ^https?://[^\[:space:]]+$ ]]
}
```

* Call this after setting `OLLAMA_LIB_API` and abort if the URL is invalid.  
* Strip trailing slashes from `OLLAMA_LIB_API` to avoid accidental double‑slashes:  
  `OLLAMA_LIB_API="${OLLAVA_LIB_API%/}"`.

### 4.3 Tighten Model Name Validation  

* Disallow `:` and `/` unless they are part of a known namespace.  
* Example more restrictive regex: `^[a-zA-Z0-9._-]+$`.  
* If a colon is required for a tag (e.g., `model:latest`), validate the part before the colon separately.

### 4.4 Secure Tool Registration  

* Require the tool command to be an **absolute path** and verify it exists before registration:  

```bash
if [[ "$command" != /* ]] || ! _exists "$command"; then
    _error "Tool command must be an absolute, existing executable"
    return 1
fi
```

* Optionally maintain a whitelist of allowed directories (e.g., `/usr/local/bin`).  

### 4.5 Limit Lifetime of Secrets  

* After a request that needs the Turbo key is completed, consider **unsetting** the variable (or at least overwriting it with a random string).  
* Example: `unset OLLAMA_LIB_TURBO_KEY` after each `ollama_api_*` call when `OLLAMA_LIB_TURBO_KEY` is not needed for subsequent calls.  

### 4.6 Defensive Programming for STDIN  

* Add a *read timeout* when reading from stdin (requires `read -t`).  
* Example for `ollama_generate_json`:

```bash
if [ -z "$prompt" ] && [ ! -t 0 ]; then
    if ! prompt=$(dd bs=1K count=64 2>/dev/null); then   # limit to 64 KB
        _error "Failed to read prompt from stdin"
        return 1
    fi
fi
```

### 4.7 Use Safer `set` Options  

* Add `set -euo pipefail` at the top (after the shebang) to abort on unset variables and on any command failure, reducing the chance of silent errors that could be exploited.  
* For Bash 3.2, `set -u` is supported, but be sure all variables are initialised before use.

### 4.8 Harden HTTP Requests  

* Enforce TLS verification when `OLLAMA_LIB_API` starts with `https://`. Pass `--tlsv1.2` and `--fail-with-body` to `curl` for better error handling:  

```bash
curl_args+=(
    --fail-with-body
    ${OLLAMA_LIB_API%%/*} # ensures no trailing slash
)
```

* Consider adding `--http1.1` explicitly to avoid unintended protocol upgrades.

### 4.9 Documentation & Usage Guidance  

* Clearly state in the README that **debug mode must not be used in production**.  
* Mention that the library stores the Turbo API key in the environment and advise the user to clear it after use.  
* Provide a short **security checklist** for developers who source the library (e.g., "Do not source from untrusted directories").

---  

## 5. Summary  

| Severity | Finding | Mitigation |
|----------|---------|------------|
| **High** | Unrestricted execution of arbitrary commands via `ollama_tools_add` / `ollama_tools_run`. | Enforce absolute‑path validation, whitelist directories, and require user confirmation. |
| **High** | Potential exposure of the Turbo API key via debug output. | Extend redaction, disable debug by default, clear the key after use. |
| **Medium** | Weak URL validation for `OLLAMA_LIB_API`, allowing possible SSRF. | Add full‑URL validation, strip trailing slashes, enforce HTTPS where appropriate. |
| **Medium** | Model name may contain `:` or `/`, which can confuse the CLI (`ollama show "$model"`). | Tighten regex to disallow those characters, or perform separate whitelist validation. |
| **Low** | No timeout on reading from stdin – possible DoS. | Limit the amount read and/or add a timeout. |
| **Low** | Debug logs could be written to shared stderr streams. | Direct debug output to a protected log file or use `exec 2>/dev/null` when not needed. |

Overall, the library follows good Bash practices (uses arrays, quotes variables, checks for required utilities) and does **not** contain obvious command‑injection bugs. The primary security concerns revolve around **secret handling**, **tool registration**, and **environment‑controlled URLs**. Implementing the recommendations above will bring the library to a robust security posture while maintaining compatibility with Bash 3.2+.  
