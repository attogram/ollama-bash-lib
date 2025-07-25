# Ollama Bash Lib

A Bash Library to interact with [Ollama](https://github.com/ollama/ollama)

Repo: https://github.com/attogram/ollama-bash-lib

## Usage

Include Ollama Bash Lib in your Bash script:

```bash
source ./ollama-bash-lib.sh
```
or
```bash
ollamaBashLib="path/to/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib Not Found: $ollamaBashLib"
  exit 1
fi
source "$ollamaBashLib"
```

## Demos

See the **[demos](demos)** directory for demo scripts.

* [demo.sh](demos/demo.sh) - Ollama Bash Lib variables and functions ([example](demos/demo.txt))
* [version.sh](demos/version.sh) - Ollama version ([example](demos/version.txt))
* [list.sh](demos/list.sh) - Ollama list ([example](demos/list.txt))
* [ps.sh](demos/ps.sh) - Ollama running processes ([example](demos/ps.txt))
* [show.sh](demos/show.sh) - Ollama show info for a random model ([example](demos/show.txt))
* [show.all.models.sh](demos/show.all.models.sh) - Show info for all models
* [generate.interactive.sh](demos/generate.interactive.sh) - Chat with a random model
* [generate.sh](demos/generate.sh) - Generate a completion from a random model, non-streaming ([example](demos/generate.txt))
* [generate.streaming.sh](demos/generate.streaming.sh) - Generate a completion from a random model, streaming ([example](demos/generate.streaming.txt))
* [code.review.sh](demos/code.review.sh) - Prompt a random model to do a code review of Ollama Bash Lib ([example](demos/code.review.txt))

## Functions

* ```ollamaIsInstalled```
  * Is Ollama installed on the local system?
  * Usage: ```if ollamaIsInstalled; then echo "Ollama Installed"; else echo "Ollama Not Installed"; fi```
  * Returns: 0/1 (yes/no)
* ```ollamaApiGet```
  * GET request to the Ollama API
  * Usage: ```ollamaApiGet "/api/command"```
* ```ollamaApiPost```
  * POST request to the Ollama API
  * Usage: ```ollamaApiPost "/api/command" "{ json content }"```
* ```ollamaClearModel```
  * Unload a model from memory (Clear context for a model)
  * Usage: ```ollamaClearModel "modelName"```
* ```ollamaGenerate```
  * Generate a completion, non-streaming
  * Usage: ```ollamaGenerate "modelName" "prompt"```
* ```ollamaGenerateStreaming```
  * Generate a completion, streaming
  * Usage: ```ollamaGenerateStreaming "modelName" "prompt"```
* ```ollamaGetRandomModel```
  * Get a random model
  * Returns: 1 model name
* ```ollamaList```
  * All available models, cli version
* ```ollamaListJson```
  * All available models, JSON version
* ```ollamaListArray```
  * All available models, Bash array version
  * Usage: ```models=($(ollamaListArray))```
  * Returns: space separated list of model names
* ```ollamaPs```
  * Running model processes, cli version
* ```ollamaPsJson```
  * Running model processes, JSON version
* ```ollamaShow```
  * Show model information, cli version
  * Usage: ```ollamaShow "modelName"```
* ```ollamaShowJson```
  * Show model information, JSON version
  * Usage: ```ollamaShowJson "modelName"```
* ```ollamaVersion```
  * Ollama application version, cli version
* ```ollamaVersionJson```
  * Ollama application version, JSON version

## License

Ollama Bash Lib is licensed under the terms of the [MIT License](LICENSE).
