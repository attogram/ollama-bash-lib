# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)
./../ollama_bash_lib.sh: line 700: return: : numeric argument required
ERROR: Ollama Not Installed

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.27


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Security Review – **Ollama Bash Lib**  

*Version: 0.42.27*  
*Author: Attogram Project*  

---

## 1. Executive Summary  

The **Ollama Bash Lib** provides a fairly comprehensive wrapper around the Ollama HTTP API.  From a security standpoint the script is **mostly well‑structured** and avoids obvious command‑injection pitfalls (user supplied data is passed to `curl` via `-d @-` and JSON is built with `jq`).  

Nevertheless, several **critical and medium‑severity issues** were identified that could lead to:

| Severity | Issue |
|----------|-------|
| **Critical** | Inverted logic in `_required` – missing dependencies are reported as present, possibly causing runtime failures or silent misuse of untrusted commands. |
| **High** | Sensitive data (API key, host URL, debug output) is stored in plain environment variables and may be leaked to child processes or logs. |
| **Medium** | Safe‑mode flag is off by default; when enabled the implementation of `_escape_control_characters` is **both inefficient and error‑prone** for large payloads. |
| **Medium** | No strict `set -euo pipefail`/`readonly` usage; global variables can be overwritten unintentionally. |
| **Medium** | Potential DoS via uncontrolled loops (`while IFS= read -r line; … < <(printf '%s' "$input" | od -An -tuC -v)`) which can blow up memory on very large inputs. |
| **Low** | Lack of input validation for several user‑controlled variables (`OLLAMA_HOST`, model names, prompts). |
| **Low** | Inconsistent handling of HTTP error codes (`curl -s` discards HTTP status and errors are only captured from the exit code). |

Below is a detailed analysis, followed by concrete remediation recommendations.

---

## 2. Threat Model  

| Asset | Potential Adversary | Attack Goal |
|-------|---------------------|-------------|
| **API key (`OLLAMA_LIB_TURBO_KEY`)** | Local user, malicious script, compromised process | Exfiltrate or misuse the key to issue privileged Ollama Cloud requests. |
| **Host URL (`OLLAMA_HOST`, `OLLAMA_LIB_API`)** | Local user, attacker with ability to set env vars | Redirect requests to a rogue server (man‑in‑the‑middle). |
| **User‑supplied prompts / model names** | Untrusted caller (e.g., a web front‑end) | Inject control characters that break JSON parsing or cause unexpected behavior in downstream services. |
| **Script binaries (`curl`, `jq`, `ollama`)** | Attacker with ability to modify the PATH | Force execution of malicious replacements. |
| **Debug output** | Anyone reading the console or log files | Leak internal state, API keys, or payload data. |

---

## 3. Detailed Findings  

### 3.1 Dependency Checks – `_required`  

```bash
_required() {
  command -v "$cmd" >/dev/null
  local command_error=$?
  if (( "$command_error" > 0 )) then
    return 0   # <- **BUG: returns success when command is *missing***
  fi
  return 1     # <- returns failure when command exists
}
```

*Impact*: Functions like `ollama_lib_about` or `ollama_app_installed` rely on `_required`. Because the logic is inverted, scripts may run with missing binaries or falsely abort when binaries are present, leading to undefined behaviour or privilege escalation if an attacker plants a malicious command earlier in `$PATH`.

*Remediation*:  
```bash
_required() {
  command -v "$1" >/dev/null 2>&1
  return $?   # 0 if present, non‑zero otherwise
}
```

### 3.2 Credential Exposure  

* `OLLAMA_LIB_TURBO_KEY` is exported directly into the environment (`export OLLAMA_LIB_TURBO_KEY="$api_key"`).  
* When `OLLAMA_LIB_DEBUG` is set, `_debug` prints the *length* of the key, but a future change could inadvertently log the full value.  
* Child processes (including `curl`) inherit the environment, potentially leaking the key via process listings (`ps e`) or logs of subprocesses.

*Remediation*:  
* Keep the key in a **restricted variable** (`declare -gr`) and avoid `export` unless required.  
* When passing the key to `curl`, use the `--header` flag **without** exporting the variable:  
  ```bash
  curl -H "Authorization: Bearer $OLLAMA_LIB_TURBO_KEY" …
  ```  
* Zero out the variable after use: `unset OLLAMA_LIB_TURBO_KEY` or `OLLAMA_LIB_TURBO_KEY=''`.

### 3.3 Safe‑Mode Control‑Character Escaping  

* Safe mode (`OLLAMA_LIB_SAFE_MODE`) is **disabled by default**. When enabled, `_escape_control_characters` reads the entire string through `od`, constructs a new string in a Bash variable, and finally prints it.  
* This approach is **O(n²)** for large inputs because Bash string concatenation creates a new copy each iteration. An attacker can craft a huge prompt (e.g., >10 MiB) to cause **excessive memory consumption** and potential denial‑of‑service.  

*Remediation*:  
* Replace the Bash‑based parser with a **native tool** (`jq -R` or `python -c`), e.g.:  
  ```bash
  _escape_control_characters() {
      jq -Rs . <<<"$1"
  }
  ```  
* Ensure the function always runs in safe mode when dealing with data that may originate from untrusted sources (e.g., prompts passed to `ollama_generate`).  

### 3.4 Input Validation  

* Functions such as `ollama_generate`, `ollama_model_unload`, and `ollama_chat` accept **any string** for model names and prompts.  
* While JSON quoting is handled by `jq`, the model name later appears in URLs (`/api/...`) **without URL‑encoding**.  
* Path‑traversal style inputs like `../../etc/passwd` could be passed to the API, which may or may not sanitize it, leading to unintended behavior.

*Remediation*:  
* Validate model names against a whitelist (e.g., `[[ $model =~ ^[a-z0-9._-]+$ ]]`).  
* URL‑encode dynamic path components (`printf '%s' "$model" | jq -sRr @uri`).  

### 3.5 HTTP Error Handling  

* `_call_curl` uses `curl -s` (silent) but **does not include `--fail`**. A non‑2xx response still returns exit code `0`, causing the caller to believe the request succeeded.  
* Errors are only captured via the curl exit status, not the HTTP status code.

*Remediation*:  
```bash
curl_args+=(
    --fail      # cause non‑2xx to be treated as error
    --show-error
)
```  
* Additionally, capture the HTTP status: `curl -w '%{http_code}'` and verify it.

### 3.6 Global Variable Mutability  

All configuration variables (`OLLAMA_LIB_…`) are **plain globals**. A malicious script sourcing this library could overwrite them (e.g., `OLLAMA_LIB_API="http://evil"`).  

*Remediation*:  
* Declare constants as **readonly** after initialisation:  
  ```bash
  readonly OLLAMA_LIB_NAME
  readonly OLLAMA_LIB_VERSION
  ```  
* Provide a **setup** function that validates and seals the configuration before any API calls.

### 3.7 Lack of Strict Shell Options  

The script does **not** enable:

```bash
set -euo pipefail
```

* Without `-u`, undefined variables are silently treated as empty, possibly causing unwanted API calls.  
* Without `-e`, failures in pipelines may be ignored.  
* Without `-o pipefail`, only the exit status of the **last** command in a pipeline is examined.

*Remediation*: Add the options at the top of the script (or inside a wrapper) to enforce robust error handling.

### 3.8 Potential Resource Exhaustion  

* The `ollama_list_array` function reads the entire output of `ollama list` into an array, then expands it with `"${models[@]}"`. If the user has a massive number of models, this could overflow the argument list limit.  

*Remediation*: Stream directly to the caller or impose a sensible limit (`head -n 1000`).

### 3.9 Insecure Defaults for Debugging  

* Debug output is gated by `OLLAMA_LIB_DEBUG`, but the variable is never initialised to `0`. If a user runs the script with `set -x` or with an environment variable inadvertently set, **sensitive data** could be printed.  

*Remediation*: Initialise explicitly (`OLLAMA_LIB_DEBUG=${OLLAMA_LIB_DEBUG:-0}`) and avoid printing any user‑provided data unless absolutely necessary.

---

## 4. Recommendations – Actionable Checklist  

| # | Recommendation | Priority |
|---|----------------|----------|
| 1 | Fix `_required` logic (return success only when command exists). | **Critical** |
| 2 | Do **not** export the Turbo API key; keep it local and zero it after use. | **High** |
| 3 | Replace `_escape_control_characters` with a streaming native utility (`jq -Rs .` or `python -c`). | **High** |
| 4 | Add **input validation** for model names and other path components. | **Medium** |
| 5 | Use `curl --fail` and capture HTTP status codes to detect API errors. | **Medium** |
| 6 | Mark immutable configuration variables as `readonly` after initialisation. | **Medium** |
| 7 | Enable strict shell options (`set -euo pipefail`) at the start of the script. | **Medium** |
| 8 | Limit the size of data processed in loops (e.g., read line‑by‑line with `head`/`tail` safeguards). | **Medium** |
| 9 | Ensure debug output never prints full secrets; scrub or mask them. | **Low** |
|10 | Document the required version of Bash (≥4.4) to guarantee associative‑array behaviour. | **Low** |

---

## 5. Conclusion  

The **Ollama Bash Lib** is a functional and reasonably well‑organized wrapper for the Ollama API. From a security perspective, the library is **usable** but contains several flaws that could be exploited in a hostile environment, especially when the script is sourced by other applications or run with elevated privileges.  

Addressing the **critical dependency‑check bug**, **protecting the Turbo API key**, and **hardening the safe‑mode escaping** are the most urgent steps. The remaining recommendations improve resilience, reduce attack surface, and align the library with modern secure‑coding best practices for Bash scripts. Implementing them will make the library significantly safer for production and open‑source consumption.
