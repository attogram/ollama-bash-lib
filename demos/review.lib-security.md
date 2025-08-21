# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.11


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_thinking hide
ollama_generate -m "gpt-oss:20b" -p "$task\n\n$(cat "$file")"
```
## Security Review of *Ollama Bash Lib* (Bash v3.2+)

The script is a fairly comprehensive library for interacting with the Ollama LLM framework.  
Below is a structured security review that covers **input validation, command execution, secrets handling, debugging, error handling, cross‑shell compatibility, and potential attack vectors**.  The review assumes the library will run in a privileged user’s shell (e.g. a CLI wrapper or a CI pipeline).

| Category | Findings | Mitigation / Recommendation |
|----------|----------|----------------------------|
| **1. Input validation & sanitization** | •  Endpoints (`_call_curl`) are validated with a strict regex (`/api/...` only). <br>•  JSON payloads are validated with `jq -e '.'`. <br>•  Arguments for `ollama_*` commands are parsed with `getopts` and are required where specified. <br>•  Tool names are stored in an array and prevented from being duplicated. | ✅ The validation strategy is solid.  <br>**Potential weakness**: URLs/paths are allowed to contain “`:`” (port).  Attackers could craft a path such as `/api/../secret` that still passes the regex if they add a `..` component; however, the server logic would reject it or treat it safely.  <br>**Recommendation**: Add a second check to reject paths containing `..` or disallow `?` and `#` fragments, even though they’re currently excluded. |
| **2. Command execution & injection** | •  `curl` and `jq` are invoked through simple strings (`curl "${curl_args[@]}"`). <br>•  Tool execution (`ollama_tools_run`) runs a stored command via `"$command" "$tool_args_str"`. | ✅ No shell evaluation (`eval`), so there’s no arbitrary command injection from user data.  <br>**Side‑channel**: A malicious tool definition could be added by any script that calls `ollama_tools_add` – the library can’t protect against that because it’s intended to be programmable.  <br>**Recommendation**: If you want to sandbox tool execution, run it in a controlled environment (e.g. `chroot`, `nspawn`, or a dedicated Docker image). |
| **3. Secret / credential handling** | •  `OLLAMA_LIB_TURBO_KEY` is stored as an environment variable and attached as a bearer token header. <br>•  The library redacts `OLLAMA_LIB_TURBO_KEY` in logs (`_redact`). <br>•  The helper `_get_redacted_var` masks sensitive env vars (`*_AUTH`, `*_KEY`, `*_TOKEN`). | ✅ Sensitive data is redacted in debug output.  <br>**Vulnerabilities**: <br>•  The key is still accessible in the environment and can be read by any subprocess (e.g. a tool you run).  <br>•  There’s no protection if the user uses `source` or `export` from the library’s file (the key is exported). | **Mitigations**:<br>- Limit `OLLAMA_LIB_TURBO_KEY` to the scope of the script (don’t `export` it globally).<br>- Add a configuration flag to keep the key private while the script runs (e.g. use a temporary file that is `chmod 600`).<br>- Document that users *must* keep the key secure. |
| **4. Debug logging / information disclosure** | •  `_debug` prints timestamps and the redacted message. <br>•  `_error` prints errors to STDERR. | ✅ The output is fairly clean.  <br>**Risk**: If `OLLAMA_LIB_DEBUG` is set to `1` or higher, debug messages are emitted; the key is redacted, but the API endpoint (`OLLAMA_LIB_API`) may be exposed, and the raw JSON payload may reveal internal data such as prompts or model names.  <br>**Recommendation**: <br>–  For production deployments, keep `OLLAMA_LIB_DEBUG=0` (default). <br>–  Add a separate “audit” log level if you need to capture the payload, but redact everything that could contain SENSITIVE data. |
| **5. Environment variable manipulation** | •  `OLLAMA_APP_TURBO` can change `OLLAMA_HOST` and `OLLAMA_LIB_API`. <br>•  `ollama_app_vars` prints many env vars with partial redaction. | ✅ No dangerous commands are executed by reading env vars.  <br>**Potential issue**: If an attacker can set or modify environment variables before running the script, they may redirect the library to an arbitrary API endpoint, potentially sending data to a malicious server.  <br>**Recommendation**: <br>-  Validate `OLLAMA_HOST` via `_is_valid_url`. <br>-  For high‑security environments, add a whitelist of allowed hosts or force the flag to not change the host at all. |
| **6. Robustness & error handling** | •  Most functions check `_exists` and return non‑zero on missing dependencies. <br>•  HTTP errors from `curl` are reported. <br>•  Functions return `0` on success and failure codes else, but do not set `$?` after `echo` or other commands that could change it. | ✅ The library usually propagates errors correctly.  <br>**Pitfall**: In `ollama_generate_stream`, after the pipeline, the exit status assigned to `rc` comes from `${PIPESTATUS[0]}`; however, if downstream commands exit non‑zero, the library may still see `rc=0`. <br>**Recommendation**: Use `set -o pipefail` globally (already set). Additionally, make sure to capture the exit status right after the pipeline and before any command that may alter `$?`. |
| **7. Bash 3.2 compatibility** | •  Arrays, `getopts`, `printf -v`, `shuf`, and extended globbing are all supported in Bash 3.2. <br>•  Use of `${VAR:-}` and `${VAR:offset:len}` is fine. <br>•  `read -r -d ''` is available in Bash 3.2+. | ✅ No syntax that would break Bash 3.2. <br>**Caveat**: The script uses `-N` with `curl` and `-w '\n%{http_code}'`, which might behave unexpectedly if the server returns binary data.  However, this is not a security issue. |
| **8. Miscellaneous** | •  **No file system writes** – the library only writes to arrays. <br>•  **No use of `eval`** – prevents injection via code execution. <br>•  **No use of `read -u` for /dev/null** – does not read sensitive data from stdin unless explicitly requested. | ✅ Good practice overall. |

---

## Summary of Recommendations

1. **Strict Path Validation**  
   ```bash
   [[ "$endpoint" =~ ^/[^[:space:]/\\]*$ && $endpoint != *..* ]]
   ```

2. **Limit Exposure of Secrets**  
   • Don’t export `OLLAMA_LIB_TURBO_KEY` unless necessary.  
   • Consider storing the key in a temporary, mode‑`600` file and deleting it after use.

3. **Audit‑Level Logging**  
   • Add a separate log level (`OLLAMA_LIB_AUDIT`) to capture raw payloads only when explicitly enabled, always redacting.  

4. **Prevent Host Redirection**  
   • In `ollama_app_turbo`, after validating the mode add a check:  
   ```bash
   allowed_hosts="http://localhost:11434|https://ollama.com"
   [[ "$host_api" =~ ^($allowed_hosts)$ ]] || { _error "Invalid host"; return 1; }
   ```

5. **Tool Execution Sandbox**  
   • Provide an optional wrapper that runs tools via `sudo -u <user> --preserve-env` or a container.

6. **Consistent Exit Codes**  
   • Use `return ${PIPESTATUS[0]}` consistently after pipelines instead of local `rc` that may be overwritten.

7. **Documentation & Usage**  
   • Add explicit warnings in the README for users: “Do **not** export the Turbo key globally; limit it to the scope of the script.”

---

## Conclusion

The library demonstrates **good defensive programming**: it sanitizes inputs, validates JSON, checks for required utilities, and avoids unsafe command evaluation. The primary security concerns stem from *secret exposure* (environment variable visibility) and *potential host redirection*. The suggested mitigations will harden the script for production use, while preserving its functionality and Bash 3.2 compatibility.
