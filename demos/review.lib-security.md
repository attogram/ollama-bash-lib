# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.46


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:20b" "$task\n\n$(cat "$file")"
```
# Security Review – Ollama Bash Lib (v0.42.46)

The *Ollama Bash Lib* is a Bash library that exposes a wide range of helper functions for interacting with the Ollama LLM API.  
The review below analyses how the code handles security concerns such as input validation, command injection, exposure of sensitive data, and other common pitfalls in Bash scripting.  It also checks that the script runs correctly on **Bash v3.2+** (the minimum requirement).

> **TL;DR**  
> • All user‑supplied data that ultimately hits external commands is correctly escaped (via `jq`, array expansion, or `printf`).  
> • The only real risk is the `eval` / `ollama_eval` workflow – by design it can execute arbitrary code that is returned by the LLM.  
> • The library exposes a very small attack surface (no file writes, no privileged commands).  
> • Minor improvements are recommended: add a `set -eu -o pipefail`, better error handling on timeouts, and an explicit “skip eval” mode.

---

## 1. Bash‑3.2 Compatibility

| Feature | Bash 3.2‑supported? | Usage |
|---------|----------------------|-------|
| `local` | ✔ | All function‑locals are declared with `local`. |
| Arrays (`${array[@]}`) | ✔ | `OLLAMA_LIB_MESSAGES` and message‑array handling use this form. |
| Parameter default values (`${var:-default}`) | ✔ | Widely used. |
| Arithmetic evaluation (`(( … ))`) | ✔ | Uses basic arithmetic in a few places (e.g., `(( OLLAMA_LIB_DEBUG ))`). |
| `read -r -s` | ✔ | Reading API keys safely. |
| `printf`/`printf %s` and `%B` | ✔ | All output is done with `printf`. |
| `printf '%s\n'` vs. `printf '%s' "$var"` | ✔ | No unsupported format codes. |
| Process substitution `cat < <(printf …)` | ✔ | Used in `ollama_list_array`. Process substitution is fine in Bash 3.2. |
| Function definition syntax | ✔ | Regular `foo() { … }`. |

No syntax requires newer Bash releases. However, the script **does not** enable Bash strict mode (`set -eu -o pipefail`). Adding that is recommended for safety.

---

## 2. Sensitive Data Handling

| Item | Observation | Recommendation |
|------|-------------|----------------|
| `OLLAMA_LIB_TURBO_KEY` | Stored in an environment variable; redacted by `_redact` when printed by `_debug`. | OK. Ensure callers that set the key do *not* log the variable (e.g., avoid exporting the key when running scripts from shells that log `$BASH_COMMAND`). |
| URL (`OLLAMA_LIB_API`) | Can contain a host name and port; never includes a key. | No risk. |
| Header construction | `Authorization: Bearer ${OLLAMA_LIB_TURBO_KEY}` is passed as a single string. | OK – if key contains a space or newline it does not break the header, but it will produce an HTTP 400. No injection risk. |
| Debug mode | `_debug` prints command arguments (e.g., JSON body) after `_redact`. | In *Turbo* mode the JSON body may contain the API key if incorrectly included by the user; the library itself does not embed it. Still guard against accidental exposure. |
| `eval` usage | `ollama_eval` outputs a command and `eval`s it without further checks. | **Security hole** – the LLM can generate code that destroys data. This is intentional design (providing a “meta‑scripting” capability), but users must be aware. An explicit safety switch (`export OLLAMA_BASH_LIB_NO_EVAL=1`) could be added. |

---

## 3. Injection and Argument Escaping

### 3.1 Commands

* All external commands are invoked **via an argument array** (`curl_args`), *not* by shell concatenation.  
  * This pattern nullifies classic Bash injection attacks, because the values are treated literally by the executed binary.  
  * Even if a user supplies a malicious endpoint like `;/bin/rm -rf /`, it will be passed **as the sole argument** to `curl` (i.e. the URL).

### 3.2 JSON payloads

`jq` is used in the form:

```bash
jq -c -n --arg key "$value" '{key: $value}'
```

This guarantees escaping of all special characters, avoiding XXE or JSON injection problems.

### 3.3 System calls

* `read`, `printf`, `awk`, `sort`, and other utilities are called with input correctly quoted; no `eval` or shell expansion of user data into command lines occurs.

**Result:** The script is free from classic Bash command‑injection vulnerabilities.

---

## 4. Denial‑of‑Service / Resource Abuse

| Function | Issue | Mitigation |
|----------|-------|------------|
| `_call_curl` | No `--connect-timeout` or `--max-time` flags; a bad server could hang the library. | Add `--connect-timeout 10 --max-time 30` (or make configurable). |
| `ollama_list_array` | Uses a pipeline from `awk` → `sort`. The input never huge, but still. | Not a critical concern. |
| `ollama_ps`/`ollama_ps_json` | Call external processes; no timeout. | Same as above. |

---

## 5. Unhandled Errors / Fault Tolerance

* Several functions use `if ! cmd; then ...; return 1; fi`.  
  * Great for propagating errors.  
* However, some output from external commands is captured with `$(cmd)` without `set -o pipefail`; failures inside a pipeline may be lost (e.g., `awk | sort`).  
  * In Bash 3.2, pipelines silently discard non‑zero exit status of earlier commands unless `pipefail` is set.  
  * Add `set -o pipefail` to capture errors in pipelines.

---

## 6. Robustness in Older Bash Versions

| Feature | Comment |
|---------|---------|
| **`${array[@]}`** | Works in Bash 3.2 with no restrictions. |
| **`${var:-}`** | Works fine. |
| **`local`** | Binds to the shell function. |
| **Arithmetic (`(( … ))`)** | Ok. |
| **Command substitution** | No `$(` inside a string; safe. |
| **Process substitution** | `cat < <(...)` is supported. |
| **Brace expansions** (`${var#pattern}` etc.) | Not used. |

Hence the script will run unmodified on Bash 3.2.

---

## 7. Recommendations & Best Practices

| Area | Recommendation |
|------|----------------|
| **Strict mode** | Add `set -euo pipefail` at the very top (outside functions). |
| **Timeouts** | Harden `_call_curl` with `--max-time` and `--connect-timeout`. |
| **Eval safety** | Add optional environment flag to skip `eval` or to only allow simple commands (e.g., `[[ $cmd =~ ^[[:alnum:]/._-]+$ ]]`). |
| **Logging** | Avoid printing unredacted `OLLAMA_LIB_API` in production logs if the host host includes a key; consider trimming sensitive host components. |
| **Input validation** | For public APIs exposed in other scripts, validate model names (`_is_valid_model`) before sending requests. |
| **Resource limits** | Consider limiting the size of the `OLLAMA_LIB_MESSAGES` array or using a temporary file for large chats. |
| **Shellcheck** | Run `shellcheck` on the script and update any flagged items. |
| **Unit tests** | Add a test harness that mocks the `curl`, `jq`, and `ollama` commands. |

---

## 8. Summary of Findings

| Issue | Severity | Fixed? | Notes |
|-------|----------|--------|-------|
| **Command injection via `_call_curl`** | None | ✔ | Array usage avoids injection. |
| **Code injection via `eval`** | High (depending on use) | ❌ (feature) | Document the risk; add optional safety toggle. |
| **Timeout / DoS** | Low | ❌ (can be mitigated) | Add curl timeout. |
| **Missing strict mode** | Low | ❌ | Recommend `set -euo pipefail`. |
| **Potential exposure of OLLAMA_TURBO_KEY** | Low | ✔ | Redacted in logs; no accidental echo unless user explicitly prints it. |
| **Compatibility issues** | None | ✔ | Works on Bash 3.2+. |

---

### Final Verdict

> **The library is sound from an injection‑perspective, uses safe Bash practices, and is compatible with Bash 3.2+.**  
> The only explicit security risk is the intentional execution of remote‑generated shell code via `eval`; this is a feature, but users should be fully aware.  
> Minor hardening (timeouts, strict mode, optional eval gating) will strengthen the code base further.
