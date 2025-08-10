# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.1


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Security Review – **Ollama Bash Library**  
*Version 0.43.1 – Bash ≥ 3.2*  

---

## 1. Executive Summary  

The library implements a fairly comprehensive wrapper around the Ollama HTTP API using `curl` and `jq`. Overall the code is well‑structured, makes good use of functions, and respects Bash 3.2 compatibility.  

However, several security‑relevant issues have been identified:

| Severity | Issue |
|----------|-------|
| **Critical** | Un‑restricted `eval` of AI‑generated command in `ollama_eval`. |
| **High** | Potential leakage of the Turbo API key via `ollama_lib_about` and environment variables. |
| **Medium** | Incomplete input validation for API endpoints and model names – path traversal / injection possible if a caller supplies malicious strings. |
| **Medium** | Use of Bash regular‑expression word‑boundary `\b` (unsupported in Bash 3.2) makes the “dangerous‑command” filter ineffective. |
| **Low** | No `set -euo pipefail` / strict mode – unexpected failures may be ignored. |
| **Low** | Missing checks for the presence of `jq` (used throughout). |
| **Low** | Inconsistent exit‑status handling for functions that pipe through external commands (`curl`, `jq`). |

The remainder of the code follows reasonable safe‑coding practices (proper quoting, use of `--arg` for jq, no command‑substitution with uncontrolled data, etc.).

---

## 2. Threat Model  

| Asset | Potential Attacker | Goal |
|-------|--------------------|------|
| **API key (`OLLAMA_LIB_TURBO_KEY`)** | Any local user who can read the process environment or call `ollama_lib_about`. | Exfiltrate the key to use the Ollama Cloud service. |
| **System shell** | Malicious or compromised model output. | Execute arbitrary commands with the privileges of the user running the script. |
| **API endpoint** | An attacker controlling the script’s arguments. | Inject path components (`../../etc/passwd`) or malicious query strings into the HTTP request. |
| **Log output** | Anyone with read access to stderr/stdout. | Harvest the key from debug logs if `OLLAMA_LIB_DEBUG` is enabled. |

---

## 3. Detailed Findings  

### 3.1. Code Execution (`eval`) – **Critical**  

`ollama_eval()` builds a command string (`cmd`) from the LLM output and then runs:

```bash
eval "$cmd"
```

* The command is **not** sanitized beyond a simple regex that tries to detect dangerous tokens.  
* Bash’s `[[ … =~ … ]]` does **not** support `\b` word‑boundary, so the regex never matches on many platforms (including Bash 3.2).  
* Even if the regex worked, the list of “dangerous” words is incomplete (e.g., `chmod`, `chown`, `sed`, `awk`, `printf`, redirections like `> /etc/shadow`).  
* An attacker who can influence the generated prompt (or simply runs the function with a malicious model) can cause arbitrary code execution.

### 3.2. Secret Exposure – **High**  

* `ollama_lib_about` prints the length of `OLLAMA_LIB_TURBO_KEY` (`(${#OLLAMA_LIB_TURBO_KEY} characters)`).  
* The key is also exported into the environment (`export OLLAMA_LIB_API="$host_api"` and `export OLLAMA_HOST="$host_api"`). Environment variables are visible to any child process and can be read via `/proc/<pid>/environ`.  
* Debug logging (`_debug`) writes the *redacted* string, but the redaction only replaces the exact value of `$OLLAMA_LIB_TURBO_KEY`. If the key appears in another context (e.g., URL‑encoded), it will be printed in clear text.

### 3.3. Input Validation – **Medium**  

* **Model names**: `_is_valid_model` checks only a simple regex `^[a-zA-Z0-9._:-]+$`. This permits `..` sequences that could be used for path traversal in commands that later treat the model name as a filesystem path (e.g., `ollama show "$1"`).  
* **API endpoints**: Functions `_call_curl` and the higher‑level wrappers accept any string as the second argument (`endpoint`). If a caller passes something like `"/api/../etc/passwd"` the resulting URL could be malformed or malicious. No sanitisation is performed.  
* **JSON payloads**: The library builds JSON with `jq --arg`, which is safe, but any function that directly concatenates strings (e.g., `ollama_generate` when manually constructing prompts) could produce malformed JSON that later leads to unexpected behaviours.

### 3.4. Regular‑Expression Word Boundary – **Medium**  

```bash
local danger_regex="\b(${dangerous[*]})\b"
```

* Bash’s built‑in regex engine does **not** understand `\b`. The pattern is treated as a literal `\b`, thus the filter never triggers.  
* Result: the “dangerous‑command” detector is effectively disabled.

### 3.5. Error‑Handling & Strict Mode – **Low**  

* The script never enables `set -euo pipefail`. Consequently, failures in pipelines (e.g., `printf … | curl …`) can be ignored, and unset variables may be used accidentally.  
* Functions such as `_call_curl` return the raw `curl` status, but callers sometimes ignore it (`ollama_list_json` simply runs `_call_curl` and returns 0 irrespective of the HTTP payload).  

### 3.6. Dependency Checks – **Low**  

* `_call_curl` verifies the presence of `curl`.  
* Many functions rely on `jq` but do **not** call `_exists "jq"` before using it. If `jq` is missing, the script aborts with a cryptic “command not found” rather than a graceful error.

### 3.7. Bash‑3.2 Compatibility – **Low**  

* All syntax used (`local`, arrays, `${var:offset:length}`, arithmetic `(( ))`) is supported in Bash 3.2.  
* The only potential compatibility issue is the use of `declare -A` (associative arrays) – not present here.  
* However, the `[[ … =~ … ]]` regex engine in Bash 3.2 is *not* PCRE; it lacks `\b`, which is already a functional problem.

---

## 4. Recommendations  

Below are concrete mitigations grouped by severity.

### 4.1. Eliminate `eval` / Sandbox Generation  

**Recommendation:** Replace `eval "$cmd"` with a **restricted execution** model:

* Print the generated command and require the user to copy‑paste it manually, **or**
* Execute the command in a subshell with reduced privileges (e.g., using `sudo -u nobody` or a container).  

**Example refactor:**

```bash
# Replace:
eval "$cmd"

# With:
printf "\n--- Generated command (review before running) ---\n%s\n--- End ---\n" "$cmd"
printf "Run the command now? (y/N) "
read -r answer
if [[ $answer =~ ^[Yy]$ ]]; then
    # Run in a restricted environment
    bash -c "$cmd"   # still risky, but at least not using eval
fi
```

If `eval` must stay, **strictly whitelist** allowed characters:

```bash
if [[ $cmd =~ ^[[:alnum:]_./\ -]+$ ]]; then
    eval "$cmd"
else
    _error "Generated command contains unsafe characters."
fi
```

### 4.2. Harden Dangerous‑Token Detection  

* Use Bash’s `[[ … =~ … ]]` without `\b` and expand the dangerous list.  
* Build the regex with word‑boundary equivalents (`(^|[[:space:];|])`).

```bash
local IFS='|'
local danger_regex='(^|[[:space:];|])('"${dangerous[*]}"')([[:space:];|]|$)'
if [[ $cmd =~ $danger_regex ]]; then
    _error "Command contains prohibited token: ${BASH_REMATCH[2]}"
    return 1
fi
```

### 4.3. Prevent Secret Leakage  

* **Never** expose the key length or the key itself in any output.  
* Keep the key **out of the environment**; store it only in a shell variable that is *not* exported.  

```bash
# Remove export
# export OLLAMA_LIB_API="$host_api"
OLLAMA_LIB_API="$host_api"   # keep as ordinary variable
```

* In `ollama_lib_about`, remove the line that prints the key length.  

* Ensure debug logging redacts the key even when it appears in other contexts (URL‑encoded, JSON). A more robust approach is to replace any occurrence of the key *regardless of surrounding characters*:

```bash
_redact() {
    local msg="$1"
    if [[ -n $OLLAMA_LIB_TURBO_KEY ]]; then
        msg=${msg//"$OLLAMA_LIB_TURBO_KEY"/'[REDACTED]'}
        # also redact URL‑encoded version
        local enc_key
        enc_key=$(printf '%s' "$OLLAMA_LIB_TURBO_KEY" | jq -s -R -r @uri)
        msg=${msg//"$enc_key"/'[REDACTED]'}
    fi
    printf '%s' "$msg"
}
```

### 4.4. Validate & Sanitize API Endpoints & Model Names  

* **Endpoint sanitisation** – reject characters other than alphanumerics, `/`, `-`, `_`, and `.`.  

```bash
_is_valid_endpoint() {
    [[ $1 =~ ^/[-_/a-zA-Z0-9]+$ ]]
}
```

* Use this check in `_call_curl` before concatenating the URL.

* For model names, forbid `..` and leading `-` which could be interpreted as options by the `ollama` CLI.

```bash
_is_valid_model() {
    local model="${1:-}"
    if [[ -z $model ]]; then
        model=$(ollama_model_random) || return 1
    fi
    [[ $model =~ ^[a-zA-Z0-9._:-]+$ ]] || return 1
    [[ $model != *..* ]] || return 1   # block path traversal
    printf '%s' "$model"
}
```

### 4.5. Enable Strict Bash Mode  

At the top of the script, add:

```bash
set -euo pipefail
IFS=$'\n\t'   # sensible IFS
```

* Wrap external commands that may fail in `|| { _error "..."; return $?; }` to keep a meaningful exit status.

### 4.6. Verify `jq` Availability Early  

Add a **library‑initialisation** function that checks required external tools:

```bash
_ensure_dependencies() {
    for cmd in curl jq; do
        if ! _exists "$cmd"; then
            _error "Required command not found: $cmd"
            return 1
        fi
    done
}
_ensure_dependencies || exit 1
```

### 4.7. Miscellaneous Improvements  

| Area | Suggestion |
|------|------------|
| **Logging** | Write debug logs to a dedicated file (e.g., `$HOME/.ollama_lib/debug.log`) when `OLLAMA_LIB_DEBUG=1` instead of noisy `stderr`. |
| **HTTP errors** | Use `curl --fail-with-body` (available in newer curl) to capture error payloads for better diagnostics. |
| **Random model selection** | Use `shuf -n1` if available, otherwise keep the current `$RANDOM%${#models[@]}` but guard against empty `$models`. |
| **Function documentation** | Add `# Requires: jq` tags consistently, and include a note about the unsafe `eval`. |
| **Version detection** | Provide a runtime check that the Bash version is ≥ 3.2 and exit with a friendly message otherwise. |

---

## 5. Conclusion  

The **Ollama Bash Library** is a functional and fairly secure wrapper when used by trusted users. The principal risk lies in the `ollama_eval` function, which executes AI‑generated code without sufficient sanitisation, and in the inadvertent exposure of the Turbo API key. By applying the mitigations above—especially removing or sandboxing `eval`, tightening input validation, and protecting secrets—the library can be hardened to a level appropriate for production or shared‑host environments.

--- 

*Prepared by: [Your Name], Security Engineer*  
*Date: 2025‑08‑10*  
