# Miscellaneous Dependencies

## Standard Tools

The following standard tools are expected to be present on your system:
* `awk`
* `sed`
* `tr`
* `grep`
* `wc`
* `od`
* `command`

These are typically pre-installed on most Linux, macOS, and WSL environments.

## Optional Tools

The following tools are optional and only required for specific functions:

* `shuf`: Used by `ollama_model_random`.
* `sort`: Used for sorting lists.
* `column`: Used for formatting the output of `ollama_lib_about`.

These tools are also commonly pre-installed. If they are not available, the corresponding functions may not work correctly.
