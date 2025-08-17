# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.0


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_thinking hide
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Security Review – Ollama Bash Library  
*Version examined: 0.45.0*  
*Target interpreter: Bash ≥ 3.2*  

---  

## 1. Overview  

The script provides a fairly complete client‑side library for interacting with the **Ollama** API.  It wraps `curl` and `jq`, builds JSON payloads, manages a message‑buffer, supports “Turbo Mode” (cloud API with a bearer token), and adds a high‑level “eval” helper that can automatically generate and execute Bash one‑liners.

From a security perspective the most sensitive parts are:

| Area | Why it matters |
|------|----------------|
| **Credential handling** – `OLLAMA_LIB_TURBO_KEY` (Bearer token) | Must not be leaked to other users/processes. |
| **Command execution** – `ollama_eval`, `ollama_tools_run`, and any wrapper that runs user‑supplied commands | Arbitrary code execution is possible if the caller can influence the inputs. |
| **Network interaction** – `curl` invocations | Man‑in‑the‑middle (MITM) and header injection attacks. |
| **Input validation** – JSON, URLs, model names, tool definitions | Improper validation can lead to injection or malformed requests. |
| **Debug / logging** – `_debug`, `_error`, `_redact` | Must not expose secrets. |

The review focuses on these vectors, identifies concrete issues, assigns a severity rating, and offers mitigations that preserve compatibility with Bash 3.2.

---

## 2. Threat Model  

| Actor | Capability | Goal |
|-------|------------|------|
| **Local user (non‑root)** | Can read process list, environment of processes owned by the same user; can execute the script. | Obtain the Turbo API key, execute arbitrary commands, or cause denial‑of‑service. |
| **Privileged attacker (root or sudo)** | Full system access. | Less relevant – the script already runs with the same privileges as the attacker. |
| **Remote attacker** | Controls the Ollama server (or a man‑in‑the‑middle on the network). | Exploit unvalidated input to cause command injection on the client, or steal the bearer token via network traces. |
| **Malicious downstream script** | Sources this library and supplies crafted arguments. | Force the library to run unintended commands or leak data. |

The most realistic risk is **local privilege escalation / data leakage** if the library is used in a multi‑user environment or if the Turbo token is set.  

---

## 3. Findings  

| # | Component | Issue | Severity* | Details |
|---|-----------|-------|-----------|---------|
| 1 | **Turbo‑Mode header** | The bearer token is passed to `curl` via `-H "Authorization: Bearer $OLLAMA_LIB_TURBO_KEY"`.  This appears in the command‑line arguments and is visible in the process list (`ps`, `/proc/<pid>/cmdline`). | **High** | Any local user can read the token while the request is in flight. |
| 2 | **`ollama_eval` – Dangerous *eval*** | The helper optionally runs the generated command **via `eval`** after a second‑level confirmation.  Even when “sandboxed” it runs `bash -r -c "$cmd"` which still interprets the string as code. | **Critical** | If a user is tricked into running `oe "task"` where the model is compromised (or the prompt is crafted), arbitrary code can be executed with the caller’s privileges. |
| 3 | **`ollama_tools_run` – Command execution** | Executes `"$command" "$tool_args_str"` where `$command` is supplied by the *tool‑add* API.  No validation is performed on `$command`. | **Medium** | An attacker that can add a tool (or manipulate the list) can run any binary that is present in `$PATH`. The arguments are passed as one JSON string; if the command interprets that string (e.g., `sh -c`), injection is possible. |
| 4 | **Debug output** | `_debug` prints the full argument string – only the *Turbo* key is redacted, other potentially secret values (e.g., other environment variables, JSON payloads containing private data) are printed unchanged. | **Low** | May expose internal data to the console or log files when debugging is enabled. |
| 5 | **URL validation** | `_is_valid_url` uses a permissive regex that accepts *any* scheme (`http`, `https`, `ftp`, `file`).  When a user supplies a custom `OLLAMA_HOST` the library will send the Authorization header even to `file://` URLs. | **Low** | Could be abused to cause the token to be written into a file if a local `file://` endpoint is crafted (depends on the server implementation). |
| 6 | **JSON concatenation for tools** | `tools_json='['$(IFS=,; echo "${OLLAMA_LIB_TOOLS_DEFINITION[*]}")']'` builds a JSON array by simple string concatenation.  If a tool definition itself contains a trailing comma or stray whitespace, the final JSON may become malformed, leading to API errors. | **Info** | Not a direct security issue but can cause denial‑of‑service. |
| 7 | **No TLS verification for custom hosts** | When the user sets `OLLAMA_HOST` to an HTTPS endpoint, the script does **not** pass `--cacert` or `--insecure`.  By default `curl` verifies the server cert, which is good; however the script does not expose a way to set custom CA or disable verification. | **Info** | May be a problem in environments with self‑signed certs. |
| 8 | **Potential race condition in `ollama_model_random`** | Uses `shuf`/`awk` to pick a random line from the model list, but the list may change between the two commands (`ollama list` → pipe → `shuf`). | **Info** | Not a security flaw, only a consistency issue. |
| 9 | **`set -o pipefail`** – good, but no `set -e` | The script relies on explicit error handling; however, if a new function is added without proper checks, errors could be ignored. | **Info** | Consistency / maintainability. |

\*Severity scale: **Critical** (remote code execution), **High** (credential leakage), **Medium** (privilege escalation), **Low** (information disclosure), **Info** (best‑practice observation).

---

## 4. Recommendations  

Below are concrete mitigations that maintain compatibility with Bash 3.2 and keep the public API unchanged.

### 4.1 Protect the Turbo API key  

| Fix | Description |
|-----|-------------|
| **Pass token via an environment variable** instead of a command‑line header. Use `curl --header "Authorization: Bearer $OLLAMA_LIB_TURBO_KEY"` **after** unsetting the variable from the environment of child processes that do not need it, e.g. `env -i curl …` or `curl -H "Authorization: Bearer $OLLAMA_LIB_TURBO_KEY"` with the token stored in a *file descriptor* (`exec 3< <(printf '%s' "$OLLAMA_LIB_TURBO_KEY")`). |
| **Sanitize before logging** – ensure `_redact` removes the token from any debug output, not just the first occurrence. Update `_redact` to replace all occurrences of the token and any other variables ending with `_KEY`, `_TOKEN`, `_SECRET`. |
| **Clear the variable after use** – `unset OLLAMA_LIB_TURBO_KEY` right after the curl call (or use a subshell). |

### 4.2 Eliminate or harden `ollama_eval`  

| Fix | Description |
|-----|-------------|
| **Remove the `eval` fallback** altogether. If the “sandboxed eval” (`env -i … bash -r -c "$cmd"`) is required, keep it but **do not offer the plain `eval` path**. |
| **Whitelist allowed commands** – before prompting the user, parse the generated command with `bash -n` and then compare the first token against an allow‑list (e.g., only `cat`, `grep`, `awk`, `sed`). |
| **Add a `--no-eval` flag** that disables the dangerous path, and make it the default. |
| **Document the risk** clearly in the usage string and README. |

### 4.3 Harden `ollama_tools_run`

| Fix | Description |
|-----|-------------|
| **Validate `$command`** – ensure it is a simple pathname (`[[ "$command" =~ ^[[:alnum:]_/.-]+$ ]]`) and that it exists (`command -v "$command"`). |
| **Pass arguments safely** – instead of a single JSON string argument, parse the JSON into an array (`mapfile -t args < <(jq -r '.[]' <<<"$tool_args_str")`) and invoke `"$command" "${args[@]}"`. This prevents a tool that internally invokes a shell from interpreting the whole JSON as a script. |
| **Run tools in a restricted environment** – e.g., `env -i PATH="/usr/bin:/bin" "$command" "${args[@]}"`. |

### 4.4 Reduce debug leakage  

* Extend `_redact` to scrub **any** environment variable that matches `*KEY*`, `*TOKEN*`, `*SECRET*`, and also strip out JSON fields named `api_key`, `access_token`, etc. |
* When `OLLAMA_LIB_DEBUG` is set to `2` (verbose), write debug information to a file with restricted permissions (`chmod 600`) instead of standard error.

### 4.5 Tighten URL validation  

* Accept only `http` or `https` schemes (reject `ftp`, `file`).  
* Verify that the host part contains no spaces or control characters.  

```bash
_is_valid_url() {
  local url_regex='^https?://[[:alnum:].:-]+(:[0-9]+)?(/.*)?$'
  [[ $1 =~ $url_regex ]]
}
```

### 4.6 Safer JSON array construction  

* Use `jq` to build the tools array rather than manual string concatenation:

```bash
tools_json=$(printf '%s\n' "${OLLAMA_LIB_TOOLS_DEFINITION[@]}" \
          | jq -s '.')
```

This guarantees proper escaping.

### 4.7 Optional TLS/CA handling  

Add an environment variable `OLLAMA_LIB_CACERT` that, if set, is passed to `curl` (`--cacert "$OLLAMA_LIB_CACERT"`). This enables usage with self‑signed certificates without disabling verification.

### 4.8 General robustness  

* Add `set -euo pipefail` at the top (Bash 3.2 supports `-u` and `-e`).  
* In every function, explicitly `local` all variables to avoid accidental global leakage.  
* When using `read -r -s` for the Turbo key, redirect input from `/dev/tty` to avoid accidental capture from a pipe.

---

## 5. Compatibility with Bash 3.2  

All suggested changes use only POSIX‑compatible features that exist in Bash 3.2:

| Feature | Availability in Bash 3.2 |
|---------|--------------------------|
| Indexed arrays (`arr=()`, `${arr[@]}`) | ✅ |
| `local` variables in functions | ✅ |
| `[[ … =~ … ]]` regex matching | ✅ |
| `printf '%s'` for safe quoting | ✅ |
| `command -v` | ✅ |
| `read -r -s` | ✅ |
| `mapfile` (used in tool argument parsing) – *not* available in 3.2. Instead use a while‑read loop, which is already present elsewhere. |
| `[[ -v var ]]` – not used, so we are safe. |

If `mapfile` is required (see recommendation 4.3), replace it with a simple loop:

```bash
args=()
while IFS= read -r arg; do
  args+=("$arg")
done < <(jq -r '.[]' <<<"$tool_args_str")
```

All other suggestions (environment sanitisation, tighter regexes, file‑descriptor tricks) work in Bash 3.2.

---

## 6. Conclusion  

The **Ollama Bash Lib** is a well‑structured wrapper, but it contains several security‑relevant weaknesses:

* **Credential exposure** via curl command‑line arguments.  
* **Potential arbitrary code execution** through the `ollama_eval` helper and unrestricted tool execution.  
* **Insufficient redaction** of secrets in debug output.  

Addressing the high‑severity items (credential handling and eval) eliminates the most serious attack surfaces.  The additional mitigations (hardening URL validation, safer JSON construction, better logging, and optional TLS config) improve overall resilience without breaking compatibility with Bash 3.2.

Implementing the recommendations will make the library safe for use in multi‑user environments and reduce the risk of accidental or malicious code execution.
