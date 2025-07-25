# Ollama Bash Lib

A Bash Library to interact with [Ollama](https://github.com/ollama/ollama)

Repo: https://github.com/attogram/ollama-bash-lib

## Usage

Include the Ollama Bash Lib:
```bash
source ./ollama-bash-lib.sh
```

Include in your script, with error checking:
```bash
ollamaBashLib="path/to/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib Not Found: $ollamaBashLib"
  exit 1
fi
source "$ollamaBashLib"
```

## Demos

See the **[demos](demos)** directory for demo scripts:

* [about.sh](demos/about.sh) - Ollama Bash Lib variables and functions ([example](demos/about.txt))
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

### Api Functions:
* ```ollamaApiGet```
  * GET request to the Ollama API
  * Usage: ```ollamaApiGet "/api/command"```
* ```ollamaApiPost```
  * POST request to the Ollama API
  * Usage: ```ollamaApiPost "/api/command" "{ json content }"```

### Generate Functions:
* ```ollamaGenerate```
  * Generate a completion, non-streaming
  * Usage: ```ollamaGenerate "modelName" "prompt"```
* ```ollamaGenerateStreaming```
  * Generate a completion, streaming
  * Usage: ```ollamaGenerateStreaming "modelName" "prompt"```

### Model Functions:
* ```ollamaGetRandomModel```
  * Get a random model
  * Returns: 1 model name
* ```ollamaClearModel```
  * Unload a model from memory (Clear context for a model)
  * Usage: ```ollamaClearModel "modelName"```

### List Functions:
* ```ollamaList```
  * All available models, cli version
* ```ollamaListJson```
  * All available models, JSON version
* ```ollamaListArray```
  * All available models, Bash array version
  * Usage: ```models=($(ollamaListArray))```
  * Returns: space separated list of model names

### Process Functions:
* ```ollamaPs```
  * Running model processes, cli version
* ```ollamaPsJson```
  * Running model processes, JSON version

### Show Functions:
* ```ollamaShow```
  * Show model information, cli version
  * Usage: ```ollamaShow "modelName"```
* ```ollamaShowJson```
  * Show model information, JSON version
  * Usage: ```ollamaShowJson "modelName"```

### Version Functions:
* ```ollamaVersion```
  * Ollama application version, TEXT version
* ```ollamaVersionJson```
  * Ollama application version, JSON version
* ```ollamaVersionCli```
  * Ollama application version, CLI version

### Utility Functions:
* ```ollamaIsInstalled```
  * Is Ollama installed on the local system?
  * Usage: ```if ollamaIsInstalled; then echo "Ollama Installed"; else echo "Ollama Not Installed"; fi```
  * Returns: 0/1 (yes/no)
* ```ollamaBashLibAbout```
  * About Ollama Bash Lib
* ```safeJson```
  * Escape a string for use as a JSON value
  * Usage: ```safeJson "string"```
* ```debug```
  * Debug message to stderr

## Requirements

* ```bash``` - v3 or higher, or equivalent
* ```ollama```
* ```curl```
* ```jq```
* ```awk```
* ```command```

## License

Ollama Bash Lib is licensed under the terms of the [MIT License](LICENSE).
