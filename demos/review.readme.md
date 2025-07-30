# Review of project [README.md](../README.md)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.5

## Review


```bash
prompt="Act as an expert Technical Marketer.
Do a full review of this project README:

$(cat "../README.md")"
ollama_generate "llava-llama3:8b" "$prompt"
```
```
This is a Bash library to interact with Ollama, which provides chat and model completion services in addition to other useful utilities for using Ollama.

The library includes several functions for generating and consuming Ollama API calls. There's `ollama_api_` prefix for the following functions:

* `get`: GET request to the Ollama API
* `post`: POST request to the Ollama API
* `put`: PUT request to the Ollama API

Also, there are some functions that provides information about the installed version of Ollama and internal utility functions.

The library also includes a test zone for comparing open-source LLMs with less than 8 parameters. This can be accessed at `https://attogram.github.io/ai_test_zone`.

Lastly, this repository has additional repositories to explore more AI from the Attogram Project such as Multirun, Toolshed, and LLM Council.
```

## Review Debug


```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "llava-llama3:8b" "$prompt"
```
```
[DEBUG] ollama_generate: [llava-llama3:8b] [Act as an expert Technical Marketer.
Do a ]
[DEBUG] ollama_generate_json: [llava-llama3:8b] [Act as an expert Technical Marketer.
Do a ]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 16 bytes [llava-llama3:8b]
[DEBUG] json_safe_value: 18012 bytes [Act as an expert Technical Marketer.
Do a ]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"llava-llama3:8b","prompt":"Act a]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 19660 bytes
[DEBUG] jq_sanitize: 19660 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] jq_sanitize: sanitized: 19660 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
This is a full review of the Ollama Bash Lib project.

The Ollama Bash Lib is a collection of useful functions for interacting with the Ollama chatbot library in Bash shell scripts. It provides a variety of ways to interact with Ollama, including generating responses, chatting, and managing models.

The project is well-documented with demos and examples that showcase its features and capabilities. The code is clean and well-organized, making it easy for users to understand how the functions work and how they can be used in their own projects.

The library is distributed under a MIT license, which means that it can be used for both commercial and non-commercial purposes, as long as the copyright holder's terms of use are respected. This makes it accessible to developers of all sizes and skill levels.

One notable feature of this project is its integration with other popular AI tools, such as Multirun, Toolshed, LLM Council, Small Models, and more. This allows users to take full advantage of the features of Ollama while also benefiting from a wider range of AI capabilities.

In conclusion, the Ollama Bash Lib project is a valuable resource for developers working with Ollama in Bash shell scripts. It provides a wide range of useful functions that can be used to interact with Ollama and other popular AI tools, making it an essential addition to any developer's toolkit.
[DEBUG] ollama_generate_stream_json: return: 0
```
