# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.7


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_thinking hide
ollama_generate -m "gpt-oss:120b" -p "$task\n\n$(cat "$file")"
```
# Security Review – **Ollama Bash Lib**  
**Version:** 0.46.7 (as declared in the script)  
**Target Bash version:** ≥ 3.2  

---

## 1. Overview  

The script provides a fairly complete Bash‑level client library for the [Ollama](https://github.com/ollama/ollama) inference server.  
It wraps `curl`/`ollama` CLI commands, builds JSON payloads with **jq**, maintains an in‑memory message history, and offers many convenience functions (list, chat, generate, streaming, etc.).  

From a security standpoint the script deals with three sensitive assets:

| Asset | Where it appears | Potential exposure |
|------|------------------|--------------------|
| **Ollama API key** (`OBL_TURBO_KEY`) | Stored in an env‑var, added to the `Authorization: Bearer …` HTTP header, optionally exported to the environment | Process‑list leakage, accidental echo to stdout/stderr, retained in bash history |
| **User‑supplied JSON / prompt text** | Passed to `_call_curl` → `curl -d @-` or embedded in JSON built with `jq` | Injection into JSON (handled by `jq`), but malformed JSON may break downstream calls |
| **Shell command line arguments** | Many functions forward arguments directly to `curl` or `ollama` CLI | Possibility of command‑injection if validation is insufficient |

The rest of the code is largely “read‑only” – it prints information, manipulates arrays, and performs network I/O.

---

## 2. Threat Model  

| Actor | Goal | Likely Attack Vector |
|------|------|----------------------|
| **Local unprivileged user** | Read the API key or other secrets of the current user | `ps`, `/proc/<pid>/cmdline`, or Bash history |
| **Malicious script / user** | Cause the library to execute arbitrary commands or exfiltrate data | Supplying crafted endpoint, model name, or JSON payload that bypasses validation |
| **Remote attacker** | Exploit the API server (out of scope for the client) | Not applicable – the client merely forwards data |
| **Insider** | Persist malicious model name that triggers server‑side exploits | Not mitigated by the client; relies on server hardening |

The primary concerns reside in **local confidentiality** (protecting `OBL_TURBO_KEY`) and **input validation** (preventing the client from sending malformed data that could cause crashes or unintended behaviour).

---

## 3. Findings  

### 3.1 Input Validation  

| Function | Issue | Impact | Recommendation |
|----------|--------|--------|----------------|
| `_call_curl` – endpoint validation | Checks that endpoint begins with `/` and contains no spaces or backslashes. This is sufficient for the intended API but does **not** validate other characters (e.g., `;`, `` ` ``, `$(`). However the endpoint is later concatenated to `$OBL_API` without quoting, relying on Bash’s word splitting. | If an attacker controls `$endpoint` they could inject extra curl arguments (`-H`, `-X`). The current pattern prevents spaces, which blocks most injection attempts, but a path like `/api/../secret` would be accepted. | Keep the strict whitespace / backslash check, but also ensure the string matches a whitelist of characters: `^[a-zA-Z0-9/_-]+$`. Reject any `..` components. |
| `_is_valid_url` | Simple regex, does **not** allow paths, query strings, or IPv6 literals. It only checks `http(s)://host[:port]`. The library uses this only on `OBL_API` (host only). | Acceptable – the library never passes a URL with a path to this function. | No change needed, but document that only host URLs are supported. |
| Model name validation (`_is_valid_model`) | Allows `[a-zA-Z0-9._:/-]` characters. This is fairly permissive, but Ollama’s model identifiers may contain additional characters (e.g., `@`). However the regex rejects characters that could be used for command injection. | Acceptable; the function also falls back to a random model when empty. | Consider tightening to the exact pattern documented by Ollama, or at least reject `..` and leading `/`. |
| JSON payload generation | Uses `jq -c -n` with `--arg`/`--argjson`. This guarantees proper JSON escaping for all values, eliminating injection via JSON fields. | Safe. | Keep as‑is. |
| Prompt handling (`ollama_generate_json`, `ollama_generate`) | Prompt may be read from STDIN without any sanitisation. The content is later passed to `jq` which safely escapes it. | Safe for JSON creation; however the prompt may contain control characters that affect terminal output (e.g., escape sequences). | If the library ever prints the prompt directly, consider stripping or escaping ANSI sequences. |

### 3.2 Secrets Management  

| Observation | Risk | Recommendation |
|-------------|------|----------------|
| `OBL_TURBO_KEY` is sent as a **plain‑text header** to `curl`. The header becomes part of the **process command line** (`curl -H "Authorization: Bearer $OBL_TURBO_KEY" …`). On most Unix systems other users can view the full command line via `ps` or `/proc/<pid>/cmdline`. | Confidential API key can be leaked to any local user while the request is in flight. | Prefer **curl’s `--header @-`** technique: write the header to a temporary file (or pipe) and let curl read it, e.g. `printf 'Authorization: Bearer %s\n' "$OBL_TURBO_KEY" | curl -H @- …`. The temporary file should be created with `mktemp` and removed immediately. |
| Redaction function `_redact` replaces occurrences of the key in **debug / error messages**, but does **not** redact it from the `curl` command line itself (which is logged by `_debug` via `$(_redact "$1")`). | If `OBL_DEBUG` ≥ 1, the command line (including the key) could be printed to stderr. | Ensure `_debug` also redacts the key when printing the curl argument list, or disable debug output when a Turbo key is set. |
| `ollama_app_turbo` optionally **exports** the key to the environment (`export OBL_TURBO_KEY`). Exported variables are inherited by any child process, making them visible to commands executed later. | Any subprocess spawned after export can read the key via its environment. | Export only when absolutely required, and document the trade‑off. For a tighter default, keep the variable **non‑exported** and pass it explicitly to functions that need it. |
| `_get_redacted_var` redacts only a handful of variable names (`*AUTH*`, `*KEY*`, `*TOKEN*`), but **does not** redact `OBL_TURBO_KEY`. | When `ollama_app_vars` is run, the key could be displayed in clear text. | Add `OBL_TURBO_KEY` to the redaction list. |

### 3.3 External Dependencies  

| Dependency | Version constraints | Security notes |
|------------|--------------------|----------------|
| `curl` | Any version exposing `--max-time`, `-w` (standard). | Ensure the system’s libcurl is up‑to‑date (CVE‑2023‑44487, etc.). |
| `jq` | Required for every JSON operation. | Prefer using a recent version (>= 1.6) that enforces strict parsing (`-e`). Older `jq` might have bugs in handling Unicode. |
| `ollama` CLI | Used for several “list/ps/show” commands. | If the CLI is compromised, the library inherits that risk. |
| `shuf` (optional) | Used for random model selection; falls back to `awk`. | `shuf` is part of GNU coreutils – verify it is present on target OS. |
| `column`/`compgen` (optional) | Used only for pretty‑printing help. | No security impact. |

All external binaries are invoked **via `command -v` checks** (`_exists`), which prevents “command not found” failures, but they are **not verified for absolute path**. An attacker with a malicious `$PATH` entry could hijack these utilities.  

**Recommendation:** Use `command -v` results to obtain the absolute path and invoke that, e.g.:

```bash
curl_path=$(command -v curl) || { _error "curl missing"; return 1; }
"$curl_path" "${curl_args[@]}"
```

### 3.4 Logging & Debug Output  

* `_debug` prints to **stderr**, which is appropriate.  
* The date format falls back when `%N` is unsupported – good compatibility.  
* Debug output includes **raw JSON payloads** (which may contain user data). No secret leakage (thanks to `_redact`) except for the previously mentioned Turbo key exposure.  

**Recommendation:** Add a guard that disables debug output automatically when a secret variable is set, unless the user explicitly sets `OBL_DEBUG=2` after understanding the risk.

### 3.5 Error Handling & Exit Codes  

* Functions return the exit status of the underlying command (curl, jq, etc.).  
* `_call_curl` captures the HTTP status code via `-w '\n%{http_code}'` and treats any `>=400` as an error – appropriate.  
* The script never uses `set -e` (or `set -o errexit`). This is deliberate, since many functions need to continue after a command fails to emit a user‑friendly error. No hidden side‑effects observed.  

### 3.6 Bash‑3.2 Compatibility  

| Feature | Bash‑3.2 support | Comment |
|---------|-----------------|---------|
| Arrays (`OBL_MESSAGES=()`) | Supported | ✔ |
| `local` variables in functions | Supported | ✔ |
| `${var//search/replace}` (string replace) | Supported (since 2.0) | ✔ |
| `${!var}` indirect expansion | Supported (since 2.0) | ✔ |
| `${var:0:42}` substring extraction | Supported (since 2.0) | ✔ |
| Process substitution `< <(...)` | Supported (since 2.x) | ✔ |
| `[[ ... =~ regex ]]` | Supported (since 3.0) | ✔ |
| `read -r -d ''` (null‑delimiter) | Supported (since 2.0) | ✔ |
| `printf '%s' "$var"` – safe quoting | ✔ | |
| `[[ -n "${OBL_TURBO_KEY}" ]]` – parameter expansion with default | ✔ | |
| `[[ -z "$json_body" ]] && ! _is_valid_json "$json_body"` – uses function call inside `[[` (allowed) | ✔ | |

Overall the script **will run** on Bash 3.2 and later. The only minor risk is the **use of `[[ ... =~ $url_regex ]]`** – the regex engine changed in Bash 4.0 (new behavior for `\` escapes). The current regex is simple ASCII, so it works consistently.

---

## 4. Recommendations  

### 4.1 Protect the Turbo API Key  

1. **Avoid exposing the key on the command line**  
   ```bash
   # Instead of:
   curl_args+=( -H "Authorization: Bearer ${OBL_TURBO_KEY}" )
   # Use a temporary header file:
   tmp_hdr=$(mktemp) || exit 1
   printf 'Authorization: Bearer %s\n' "$OBL_TURBO_KEY" >"$tmp_hdr"
   curl_args+=( -H @"$tmp_hdr" )
   … 
   curl "${curl_args[@]}"
   rm -f "$tmp_hdr"
   ```
2. **Redact the key in all helper output** – extend `_redact` and `_debug` to also replace the header file path placeholder if it contains the key.  
3. **Do not export the key by default** – keep `export OBL_TURBO_KEY` optional (`-e` flag) and warn the user about the security trade‑off.  

### 4.2 Harden Path & Command Lookup  

* Resolve absolute paths for all external commands (`curl`, `jq`, `ollama`, `shuf`, `awk`, `column`, `compgen`) before use, and store them in read‑only variables.  
* Example at script start:
  ```bash
  readonly CURL=$(command -v curl)   || { echo "curl not found" >&2; exit 1; }
  readonly JQ=$(command -v jq)       || { echo "jq not found" >&2; exit 1; }
  # …etc.
  ```

### 4.3 Tighten Endpoint Validation  

Replace the current endpoint check with a whitelist regex that permits only the characters used by the Ollama API:

```bash
_is_valid_endpoint() {
  [[ "$1" =~ ^(/[a-zA-Z0-9/_-]+)+$ ]]   # starts with /, no spaces, no .., no backslashes
}
```

Call this function from `_call_curl` instead of the inline test.

### 4.4 Reduce Information Leakage in Help/Debug  

* When `OBL_DEBUG` ≥ 1, suppress printing of the full curl argument list if a secret header is present.  
* In `ollama_app_vars`, add `OBL_TURBO_KEY` to the redaction list:
  ```bash
  printf '%s\t%s\n' "OBL_TURBO_KEY" "$([ -n "$OBL_TURBO_KEY" ] && echo "[REDACTED]" || echo "unset")"
  ```

### 4.5 Validate Numeric Inputs  

* `OBL_TIMEOUT` can be set by the user; verify it is a positive integer before passing to curl:
  ```bash
  if ! [[ "$OBL_TIMEOUT" =~ ^[0-9]+$ ]]; then
    _error "Invalid OBL_TIMEOUT value: $OBL_TIMEOUT"
    OBL_TIMEOUT=300   # fallback
  fi
  ```

### 4.6 Defensive Programming for Future Bash Versions  

* Use `set -o pipefail` only if supported – the script already does a test; keep it.  
* Consider adding `set -u` (nounset) in a **debug mode** (e.g., when `OBL_DEBUG` ≥ 2) to catch typos without breaking normal operation.  

### 4.7 Documentation Improvements  

* Clearly state in the README that **Turbo mode leaks the API key via the process list** unless the alternative header‑file technique is applied.  
* List all required external programs with version hints.  
* Provide a “secure usage” checklist (disable debug, avoid exporting the key, use a dedicated user account).  

---

## 5. Conclusion  

The **Ollama Bash Lib** is a well‑structured, feature‑rich client library that adheres to Bash 3.2 compatibility and follows many good scripting practices (local variables, error checks, defensive quoting).  

The primary security gaps are related to **handling of the Turbo API key** (process‑list exposure) and **minor validation loopholes** (endpoint path, command lookup). By implementing the recommendations above—especially moving the Authorization header out of the command line and tightening input validation—the library can be hardened to meet the security expectations of production‑grade environments while retaining its current functionality.

--- 

*Prepared by: [Expert Security Professional]  
Date: 2025‑08‑23*
