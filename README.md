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
* ```ollamaHelp```
  * ollama cli help
* ```ollamaHelpRun```
  * ollama cli help for run command
* ```ollamaHelpShow```
  * ollama cli help for show command

## License

Ollama Bash Lib is licensed under the terms of the [MIT License](LICENSE).
