# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.5


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:20b" "$task\n\n$(cat "$file")"
```
## 🎯 Security Review  
> *Target:* Bash library for interacting with Ollama (Bash v3.2 +).  
> *Scope:* All public functions, internal helpers, user‑exposed aliases, and the “eval” path that actually runs user‑supplied output.

> **Goal:** Identify “security‑by‑design” risks, surface‑level attack vectors, and provide concrete mitigations that keep the library safe for production or hobby use.

---

### 1. Threat Model Overview  

| Actor | Goal | Likely Attack |
|-------|------|----------------|
| **Unauthenticated user** | Use the library in a script or shell that may be exposed to others (e.g. CI/CD, shared hosts). | Accidentally expose secrets or allow malicious command execution. |
| **Compromised machine** | Hijack the library to exfiltrate data or send commands to the Ollama API. | Use `OLLAMA_HOST`/`OLLAMA_LIB_TURBO_KEY` to point to an attacker’s server. |
| **Malicious Ollama API server** | Return crafted responses that exploit downstream parsing. | Malformed JSON, arbitrary scripts in `response` fields. |
| **Untrusted `eval`** | Execute arbitrary shell code. | The library *intentionally* has `eval`, but its checks are weak. |

> **Assumption** – The script runs in a trusted Bash environment (not a web shell).  
> **Limitations** – No network‑level or OS‑level hardening beyond basic input hygiene.

---

### 2. Secrets & Sensitive Data

| Concern | Current State | Recommendations |
|---------|---------------|-----------------|
| **API Key Exposure** (Turbo Mode) | Stored in a *unexported* Bash variable (`OLLAMA_LIB_TURBO_KEY`). | **Good** – not visible to child processes, but: <br>• Document that the key resides only in memory. <br>• For added safety, set the variable with `declare -r` / `readonly` once the key is populated. |
| **Logging of Secrets** | `_debug`/`_error` route the message through `_redact` so the API key never prints. | **Good**. Verify that *every* error path goes through `_redact`. Add a unit test that feeds a string with the key and ensure it is replaced. |
| **HTTP(S) Transport** | Uses `curl` with default SSL verification. | **Good** – but consider a **hard‑coded** CA bundle or allow a custom `--cacert` flag to avoid man‑in‑the‑middle attacks. |
| **Untrusted Host** | `OLLAMA_HOST` can be overridden by the caller. | Add optional **whitelisting**: e.g. `[[ "$OLLAMA_HOST" =~ ^https://(?:api\.ollama\.com|localhost(:[0-9]+)?$ ]]` or provide a flag to enforce `http://localhost:11434`. |

---

### 3. Input Validation & Sanitization

| Function | Validation | Issues | Fixes |
|----------|------------|--------|-------|
| `_is_valid_model` | Regex `^[a-zA-Z0-9._:-]+$` | Prevents obvious injection but does not guard against *trailing slashes* or **null bytes** (unlikely in Bash). | Add an explicit `[[ -n "$model" ]]` and `|| return 1` early. |
| `ollama_generate_json` | Uses `jq -c -n` with `--arg`. | **Good** – `jq` escapes quotes. | Ensure `jq` exists before use; otherwise, abort early. |
| `ollama_msg_add` | `jq -c -n` again. | Same as above. |
| **`ollama_app_turbo`** | Reads API key via `read -r -s`. | Accepts any string; no length limit. | Add a max length check (`[[ ${#api_key} -le 1024 ]]`) and trim whitespace. |
| **`ollama_eval`** | `cmd="$(ollama_generate "$model" "$prompt")"` – arbitrary output. | **High risk** – attacker could seed the model with a prompt that returns a malicious one‑liner. | Use **sandboxing** (e.g. `chroot`, `nsenter`, or `docker run`), or at the very least: <br>• Verify `cmd` is on the whitelist of “benign commands” derived from a safe subset of globs.<br>• Don’t use `eval`; use `printf '%q\n'` + `bash -c` with strict mode. |

> 👉 **The `eval` path is the only intentional “dangerous” feature.**  
> Document it as *developer‑only*, and recommend developers restrict usage to trusted contexts.

---

### 4. Command Injection & Process‑Table Exposure

| Vector | Why it matters | Existing protection | Suggested improvement |
|--------|---------------|---------------------|-----------------------|
| `curl` **headers** | `Authorization: Bearer ${OLLAMA_LIB_TURBO_KEY}` contains the key. | Key is not exported; only the shell variable. | Add `declare -r OLLAMA_LIB_TURBO_KEY` after assignment to enforce immutability. |
| **Shell injection** via `jq` payloads | Model or prompt may contain control characters that change JSON structure. | `jq` escapes everything as JSON strings. | Enforce `--arg` + `-c` – already done. |
| **Process list** | If the user sets `OLLAMA_HOST` to `http://example.com`, requests will leak. | No check. | Add a host format validator; optionally provide a `--allow-host` list. |
| **`eval "$cmd"`** | Executes any shell code. | Minimal sanity checks; only a regex for a handful of dangerous words. | Replace with `bash -c` and `set -o pipefail -o errexit -o nounset -o xtrace`; reject if not in a known whitelist; or run in a *restricted* Bash (`bwrap` or `chroot`). |

---

### 5. Error Handling & Robustness

| Problem | Impact | Mitigation |
|---------|--------|------------|
| **No `set -e`/`set -u`** | Silent failures when commands return non‑zero but script keeps running. | Add at top: `set -euo pipefail`. |
| **`_exists`** | Calls that rely on `curl`/`jq` may not abort if `jq` missing. | `if ! _exists 'jq'; then _error …; return 1; fi`. |
| **Unquoted variable expansions inside regex** | Potential word splitting (rare). | Always quote expansions: `[[ "$var" =~ $regex ]]`. |
| **Resource exhaustion** | Large models or many messages might blow up memory. | Limit `OLLAMA_LIB_MESSAGES` size or stream cleanup. |
| **Race conditions** | The library writes to `OLLAMA_HOST` exported variable; multiple instances could interfere. | Prefix `export OLLAMA_HOST` only if it wasn’t set externally; or run each instance in a subshell. |

---

### 6. Dependency & Environment Assumptions

| Dependency | Current Check | Suggestion |
|------------|---------------|------------|
| `curl` | `_exists` in `_call_curl` | Add a global dependency check at startup (`_exists curl || { _error; exit 1; }`). |
| `jq` | `_is_valid_json` uses it. | Global check similarly. |
| `shuf` | Optional: fallback to `awk`. | Keep but log a warning when using fallback (less uniform). |
| Bash version | Script begins with `#!/usr/bin/env bash`; relies on Bash 3.2+. | Add a version guard: `if [[ ${BASH_VERSINFO[0]} -lt 3 ]]; then _error ...; exit 1; fi`. |

---

### 7. Recommendations (High‑to‑Low Priority)

| # | Recommendation | Rationale |
|---|----------------|------------|
| **1** | **Wrap the entire library in `set -euo pipefail`.** Makes it fail fast and protects against unset variables. |
| **2** | **Declare secrets as readonly** (`readonly OLLAMA_LIB_TURBO_KEY`). Prevent accidental re‑assignment. |
| **3** | **Add host validation** before sending requests. Reject anything outside `http://localhost:11434` or the official cloud domain. |
| **4** | **Replace `eval "$cmd"` with a sandboxed execution** e.g. `bash -c "$cmd"` with strict mode and a safe working directory. |
| **5** | **Whitelist allowed commands** for the `eval` path (or require explicit flag to enable). |
| **6** | **Sanitize all external input** – e.g., trim whitespace on `OLLAMA_HOST`, `OLLAMA_LIB_TURBO_KEY`. |
| **7** | **Check all dependencies** at script load time (`curl`, `jq`, optionally `bwrap`). |
| **8** | **Document the security assumptions** clearly in README.md (especially the “eval” feature). |
| **9** | **Add unit tests** that cover: <br>• secrets redaction <br>• invalid model names <br>• dangerous command detection <br>• remote host hijacking attempts. |
| **10** | **Consider adding a `--dry-run` flag** to `ollama_eval` that only prints the command without executing. |

---

### 8. Sample Patch (Illustrative)

```bash
#!/usr/bin/env bash
set -euo pipefail
if (( BASH_VERSINFO[0] < 3 )); then
    printf >&2 'ERROR: Bash 3.2 or higher required.\n'
    exit 1
fi

# ---------- Dependency check ----------
for dep in curl jq; do
    if ! command -v "$dep" >/dev/null 2>&1; then
        printf >&2 'ERROR: %s is required but not found.\n' "$dep"
        exit 1
    fi
done

# ---------- Secured Turbo key ----------
ollama_app_turbo() {
    ...
    if [[ -z "$OLLAMA_LIB_TURBO_KEY" ]]; then
        read -r -s -p "Enter Ollama API Key: " api_key; printf '\n'
        [[ ${#api_key} -le 1024 ]] || { printf >&2 'ERROR: API key too long\n'; return 1; }
        printf -v OLLAMA_LIB_TURBO_KEY '%q' "$api_key"
        readonly OLLAMA_LIB_TURBO_KEY
    fi
    ...
}

# ---------- Safe eval ----------
ollama_eval() {
    ...
    if ! _exists 'bwrap' ; then
        _error "Sandbox needed (bwrap not found)."
        return 1
    fi
    # run in a temporary, read‑only chroot-like environment
    eval "$cmd" 2>/dev/null || return $?
}
```

> *Note:* The example shows only the high‑level changes. A full patch would also introduce host whitelist and command‑whitelist logic.

---

## 9. Conclusions

* **Mostly Safe** – The library performs good redaction, validates inputs, and uses trusted tools (`jq`, `curl`).  
* **The Biggest Risk** – The `ollama_eval` path that executes user‑generated shell code.  In most cases the caller must trust the source; otherwise it’s best to remove or heavily sandbox this function.  
* **Minor Issues** – Some unvalidated environment variables, missing `set -e`, and the lack of strict error handling on dependency checks.

---

### 📌 Quick‑Start Checklist for Safe Deployment

1. **Deploy only in a controlled environment** (local dev, CI job, or dedicated VM).  
2. **Run the script with `-o errexit -o nounset -o pipefail`.**  
3. **Whitelist `OLLAMA_HOST`** to either `http://localhost:11434` or the official cloud domain.  
4. **Never expose `OLLAMA_LIB_TURBO_KEY` to the shell environment** – keep it readonly inside the script.  
5. **Use the non‑eval interface (`ollama_generate*`, `ollama_chat*`) for everything else.**  
6. **Review code before running `ollama_eval`.** Treat it as an *admin* command.

With these adjustments, the library should remain robust against accidental secret leakage, command injection, and basic misuse. Happy coding!
