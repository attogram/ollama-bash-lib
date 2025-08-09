# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.44


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:20b" "$task\n\n$(cat "$file")"
```
# 📋 Security Review – *Ollama Bash Lib* (v0.42.44)

> Target Bash version: **≥ 3.2**  
> Target platform: any Unix‑like system with Bash, `curl`, `jq`, `ollama` (some checks omitted).

The library exposes a large surface that talks to an external HTTP API and, in certain modes, can evaluate arbitrary shell commands. Below you’ll find a systematic assessment of the implementation, followed by concrete recommendations.

---

## 1. Security Highlights

| Category | Summary | Severity | Remediation |
|----------|---------|----------|-------------|
| **Untrusted Data → eval** | `ollama_eval` (and alias `oe`) `eval`s a response from Ollama. The caller can specify the task, and the LLM may return any one‑liner. | ★★★★ (high) | • Remove `eval` or replace with `printf '%s\n' "$cmd"` + manual execution.<br>• If you *must* execute, use `bash -c "$cmd"` + sanitise known safe commands. |
| **Key Exposure** | `OLLAMA_LIB_TURBO_KEY` is *redacted* in `_debug`, but raw prints may leak it if the debug logic is bypassed or disabled. | ★★ | Keep the key only in a secret vault; never let it be written to disk. |
| **Command Injection** | Some arguments (model name, prompt, etc.) are sent to `curl` via `jq -c -n ...`. `jq` properly escapes JSON so injection is mitigated *provided* the environment that calls the library doesn’t tamper with `jq` itself. | ★ | Use `--arg` consistently and avoid shell interpolation on raw user input. |
| **Unvalidated Input to API** | Endpoints and JSON are built from caller’s arguments without validation beyond `jq`. If the caller passes a malformed prompt, the API may treat it as legitimate. | ★ | Validate request bodies against the Ollama schema when possible. |
| **Process Injection / DoS** | Unbounded output from the API is streamed directly to stdout; if an attacker has control over the LLM, they might produce very large payloads to exhaust disk I/O. | ★★ | Apply size limits; e.g. via `head` or custom logic. |
| **Sensitive Tools Non‑Existence Checks** | The library does *not* check for presence of required binaries (`curl`, `jq`, `ollama`). Failure will surface as runtime errors but can cause silent failure or leakage of errors. | ★ | Pre‑flight `_exists` on startup or before each critical call. |
| **Redirects & TLS** | `curl` is invoked with default TLS checks. An attacker controlling the API host (via `OLLAMA_HOST`) could perform a MITM. | ★★ | Enforce `--tlsv1.2` or stronger and validate server certs. |
| **Debug Logging** | `_debug` logs timestamps and content, including raw prompts. Even with redaction, large prompts could clutter logs. | ★ | Filter or truncate debug logs in production. |
| **Missing `set -euo pipefail`** | Library functions silently ignore errors in many places, e.g. ignoring the return value of a failed `jq`. | ★ | Use strict error handling or report failures back to caller. |

---

## 2. Functional & Bash‑3.2 Compatibility

| Feature | Bash 3.2 | Notes |
|---------|----------|-------|
| `${var:0:42}` (substring) | ✔ | Works since Bash 3.1 |
| Arrays and `${ARRAY[@]}` | ✔ | Available from Bash 3.0 |
| Process substitution `< <(...)` | ✔ | Available |
| `local` inside functions | ✔ | OK |
| `[[ … ]]` | ✔ | OK |
| `printf '%s\t%s\n'` | ✔ | OK |
| `read -r -s arg` | ✔ | OK |
| Arithmetic expansion `$((RANDOM % n))` | ✔ | ✔ (but needs `n > 0`) |

**Potential portability hiccups**

1. **`date '+%H:%M:%S:%N'`** – The `%N` (nanoseconds) field may not be supported on all OSes; the fallback path attempts it anyway.
2. **`printf '%s\n' "$result"`** – If `result` contains embedded null bytes the output will truncate; rare but possible.
3. **`column`** – Not required but used by `ollama_lib_about`; not available on all distributions. The code handles its absence gracefully.
4. **`process substitution`** inside `while ... < <(...)` – Requires Bash (which we do). POSIX‑sh shells would fail.

Overall, the script will run on any Bash 3.2+ system, but may behave unexpectedly if any of the external utilities are missing.

---

## 3. Detailed Issue Analysis

### 3.1 `ollama_eval` / `oe`

  *It uses `eval "$cmd"` to execute a one‑liner returned by the LLM.*

  - **Why problematic**: Anything that reaches the shell is executed with the **full privileges** of the caller, including `sudo` if invoked as root.  
  - **Risk surface**: Arbitrary code execution, privilege escalation, data loss.  
  - **Mitigation**:  
    * Completely remove `eval` and return the generated string to the caller.  
    * If mandatory, sanitize: run the command through `bash -xrc` pipe‑filtered, or whitelist a set of allowed commands.  
    * Add a runtime flag to disable `ollama_eval` in security‑critical contexts.

### 3.2 `OLLAMA_LIB_TURBO_KEY` Handling

  - The key is stored in memory and exported to `OLLAMA_LIB_API` when turbo mode is turned on.  
  - The debug routine attempts to redact it, but any accidental `echo $OLLAMA_LIB_TURBO_KEY` or script crash could leak it.  
  - **Fix**: Store the key in a file with restrictive permissions (`chmod 600`) or use a secret manager. In Bash scripts, `env` can be used to keep it unset after use.

### 3.3 Unvalidated Endpoint & Query

  ```bash
  _call_curl "GET" "$1"
  ```

  - `$1` originates from the caller; if the caller is trusted, this is fine.  
  - If the caller is an external user or LLM response, a crafted endpoint (`/../../../../var/run/tinydns`) could attempt a path traversal.  
  - **Mitigation**: Validate that `$1` starts with a single `/` and contains only allowed characters (`/`, `-`, `_`, `[0-9a-zA-Z]`).

### 3.4 External Utility Checks

  ```bash
  _exists "curl"
  ```

  - Some functions (e.g., `ollama_list`) directly invoke `ollama list` without a pre‑flight check.  
  - If the tool is missing, the script silently returns non‑zero, leading to confusion.  
  - **Fix**: Call `_exists` at script start, or wrap all calls with a guard.

### 3.5 Error Handling for `jq`

  - `_is_valid_json` will exit with 1 for a JSON with content `false` or `null`; the caller often treats this as a hard error.  
  - Subsequent `jq -r '.response'` might silently produce empty output if the JSON is `null`.  
  - **Recommendation**: Explicitly check for `null` and handle it gracefully.

### 3.6 Potential Log Exposure

  `_debug` logs raw user prompts and responses in the `ollama_eval` path, which may contain secrets or sensitive data.  
  - Turn off debug (`export OLLAMA_LIB_DEBUG=0`) or filter logs in production.

### 3.7 `ollama_app_turbo`

  - It sets `export OLLAMA_HOST="$host_api"`; this environment variable may also be used by other tools.  
  - If a rogue user writes a malicious `OLLAMA_HOST` into the environment before sourcing the library, the library could make requests to an attacker’s server.  
  - **Mitigation**: Validate `OLLAMA_HOST` against an allow‑list or use strict patterns.

---

## 4. Recommendations

| # | Change | Rationale | Implementation Tip |
|---|--------|-----------|--------------------|
| 1 | **Remove or sandbox `eval`** in `ollama_eval`. | Prevent arbitrary code execution. | Return the command to the caller; let the user decide, or run under `set -o nounset` + explicit command list. |
| 2 | **Sanitize all external inputs** that form part of a request or command. | Protect against injection or path exploitation. | Use regex checks: `/^[\/\-\w]+$/`, or canonicalize with `realpath`. |
| 3 | **Strict error handling**: set `set -euo pipefail` in all executable scripts, or explicitly check `if ! ...; then ...; fi`. | Avoid silently ignoring failures. | Add at the top of *any* script that calls this library or modify functions to propagate failure. |
| 4 | **Validate required binaries** (`curl`, `jq`, `ollama`, `column`). | Provide early, clear error messages. | At library init: `for cmd in curl jq ollama; do _exists "$cmd" || { _error "$cmd missing"; exit 1; }; done` |
| 5 | **Redact debug output** more aggressively or disable in production. | Reduce risk of leaking secrets. | `export OLLAMA_LIB_DEBUG=0` before including library. |
| 6 | **Use HTTPS by default** for external API calls. | Mitigate MITM. | Add `--proto '=https'` flag to `curl`, or enforce `OLLAMA_HOST` to start with `https://`. |
| 7 | **Limit response size** from `curl` (e.g., `--max-filesize`). | Avoid resource exhaustion. | In `_call_curl`, add `--max-filesize 10485760` (10 MiB) or similar. |
| 8 | **Store secret keys in secure storage** (e.g., `~/.config/ollama/api.key` with 600 perms). | Avoid memory exposure. | Create helper function `ollama_lib_read_key` that reads file with permissions check. |
| 9 | **Document environment expectations** (e.g., Bash 3.2+, `curl` 7.58+, `jq` 1.5+). | Prevent undocumented failures. | Update README or auto‑detect version and warn. |
|10 | **Add unit tests for edge cases** (empty prompt, invalid JSON, missing binary, etc.). | Ensure reliability. | Use `bats` or simple test harness. |

---

## 5. Sample Improved `ollama_eval`

```bash
ollama_eval() {
  local task="${1:?Task required}"
  local model="${2:-$(ollama_model_random)}"

  # Build prompt
  local prompt="Write a bash one‑liner that will carry out the following task:
$task
Your answer must be ONLY a valid shell command. No comments or markdown."
  local cmd
  cmd=$(ollama_generate "$model" "$prompt")

  [[ -z $cmd ]] && { _error "generation failed"; return 1; }

  printf 'Command:\n\n%s\n\nRun command (y/N)? ' "$cmd"
  read -r reply
  [[ ${reply,,} != y ]] && return 0   # User declined

  # SAFETY: run under a subshell with restricted PATH
  (
    export PATH="/usr/bin:/bin"          # Adjust to safe path if needed
    bash -c "$cmd"
  )
  printf 'Command exit status: %d\n' $?   # return the command exit status
}
```

> *Notice*: No `eval`. The command is executed with a **limited PATH** and no extra credentials.  
> *Caveat*: Still allows arbitrary commands; consider further whitelisting.

---

## 6. Concluding Assessment

| Aspect | Status | Confidence |
|--------|--------|------------|
| **General security hygiene** | **Moderate** – missing `eval` mitigations, key handling, and defensive coding. | Medium |
| **Bash 3.2 compatibility** | **Good** – script uses only features available from Bash 3.2+. | High |
| **Operational resilience** | **Needs improvement** – missing tool checks, silent failures. | Medium |
| **Exposure surface** | **Potential** – untrusted prompts can produce dangerous code. | High (if `eval` remains) |

> **Recommendation**: Revise the handling of `ollama_eval`, tighten input validation, add pre‑flight binary checks, and enforce strict error handling. Once those changes are in place, the library will be robust enough for production use on Bash 3.2+ hosts.
