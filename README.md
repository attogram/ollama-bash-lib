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
* [generate.sh](demos/generate.sh) - Generate a completion from a random model, non-streaming, TEXT output ([example](demos/generate.txt))
* [generate.json.sh](demos/generate.json.sh) - Generate a completion from a random model, non-streaming, JSON output ([example](demos/generate.json.txt))
* [generate.streaming.sh](demos/generate.streaming.sh) - Generate a completion from a random model, streaming, TEXT output ([example](demos/generate.streaming.txt))
* [generate.streaming.json.sh](demos/generate.streaming.json.sh) - Generate a completion from a random model, streaming, JSON output ([example](demos/generate.streaming.json.txt))
* [generate.interactive.sh](demos/generate.interactive.sh) - Chat with a random model
* [version.sh](demos/version.sh) - Ollama version ([example](demos/version.txt))
* [list.sh](demos/list.sh) - Ollama model list ([example](demos/list.txt))
* [ps.sh](demos/ps.sh) - Ollama running processes ([example](demos/ps.txt))
* [show.sh](demos/show.sh) - Ollama show info for a random model ([example](demos/show.txt))
* [show.all.models.sh](demos/show.all.models.sh) - Show info for all models
* [token.estimate.sh](demos/token.estimate.sh) - Estimated token count ([example](demos/token.estimate.txt))
* [review.lib.sh](demos/review.lib.sh) - Prompt a random model to do a code review of Ollama Bash Lib ([example](demos/review.lib.txt))
* [review.readme.sh](demos/review.readme.sh) - Prompt a random model to do a review of Ollama Bash README ([example](demos/review.readme.txt))

## Functions

### Api Functions:
* ```ollamaApiGet```
  * GET request to the Ollama API
  * Usage: ```ollamaApiGet "/api/command"```
* ```ollamaApiPost```
  * POST request to the Ollama API
  * Usage: ```ollamaApiPost "/api/command" "{ json content }"```

### Ollama Functions:
* ```ollamaIsInstalled```
  * Is Ollama installed on the local system?
  * Usage: ```if ollamaIsInstalled; then echo "Ollama Installed"; else echo "Ollama Not Installed"; fi```
  * Returns: 0/1 (yes/no)

### Generate Functions:
* ```ollamaGenerate```
  * Generate a completion, non-streaming, TEXT version
  * Usage: ```ollamaGenerate "modelName" "prompt"```
* ```ollamaGenerateJson```
  * Generate a completion, non-streaming, JSON version
  * Usage: ```ollamaGenerateJson "modelName" "prompt"```
* ```ollamaGenerateStreaming```
  * Generate a completion, streaming, TEXT version
  * Usage: ```ollamaGenerateStreaming "modelName" "prompt"```
* ```ollamaGenerateStreamingJson```
  * Generate a completion, streaming, JSON version
  * Usage: ```ollamaGenerateStreamingJson "modelName" "prompt"```
  
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
* ```ollamaBashLibAbout```
  * About Ollama Bash Lib, lists vars and functions
* ```tokenEstimate```
  * Estimated number of tokens in a string
  * Usage: ```tokenEstimate "string"```
  * Usage: verbose: ```tokenEstimate "string" 1```
  * Output: token estimate
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

## More AI from the Attogram Project

| Project             | Github Repo                                  | Description                                                                                                                                                                                 |
|---------------------|----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Multirun**        | [ollama-multirun][ollama-multirun]           | Run a prompt against all, or some, of your models running on Ollama.<br />Creates web pages with the output, performance statistics and model info.<br />All in a single Bash shell script. |
| **Toolshed**        | [ollama-bash-toolshed][ollama-bash-toolshed] | Chat with tool calling models.<br />Sample tools included.<br />Add new tools to your shed with ease.<br />Runs on Ollama.<br />All via Bash shell scripts.                                 |
| **LLM Council**     | [llm-council][llm-council]                   | Start a chat room between all, or some, of your models running on Ollama.<br />All in a single Bash shell script.                                                                           |
| **Ollama Bash Lib** | [ollama-bash-lib][ollama-bash-lib]           | A Bash Library to interact with Ollama                                                                                                                                                      | 
| **Small Models**    | [small-models][small-models]                 | Comparison of small open source LLMs (8b parameters or less)                                                                                                                                |
| **AI Test Zone**    | [ai_test_zone][ai_test_zone]                 | Test results hosted on https://attogram.github.io/ai_test_zone/                                                                                                                             |

[ollama-multirun]: <https://github.com/attogram/ollama-multirun> "Ollama Multirun"
[ollama-bash-toolshed]: <https://github.com/attogram/ollama-bash-toolshed> "Ollama Bash Toolshed"
[llm-council]: <https://github.com/attogram/llm-council> "LLM Council"
[ollama-bash-lib]: <https://github.com/attogram/ollama-bash-lib> "Ollama Bash Lib"
[small-models]: <https://github.com/attogram/small-models> "Small Models"
[ai_test_zone]: <https://github.com/attogram/ai_test_zone> "AI Test Zone"
