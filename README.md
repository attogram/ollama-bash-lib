# Ollama Bash Lib

A Bash Library for [Ollama](https://github.com/ollama/ollama)

Run LLM prompts straight from your shell, and more

![Logo](docs/logos/logo.320x160.png)

[▶️ Get Started in 30 seconds](#quickstart) • [💬 Join Discord][discord-invite]

[![Release](https://img.shields.io/github/v/release/attogram/ollama-bash-lib?style=flat)](https://github.com/attogram/ollama-bash-lib/releases)
[![License](https://img.shields.io/github/license/attogram/ollama-bash-lib?style=flat)](./LICENSE)
![Bash ≥3.2](https://img.shields.io/badge/bash-%3E=3.2-blue?style=flat)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/t/attogram/ollama-bash-lib?style=flat)](https://github.com/attogram/ollama-bash-lib/commits/main/)
[![GitHub stars](https://img.shields.io/github/stars/attogram/ollama-bash-lib?style=flat)](https://github.com/attogram/ollama-bash-lib/stargazers)
[![GitHub watchers](https://img.shields.io/github/watchers/attogram/ollama-bash-lib?style=flat)](https://github.com/attogram/ollama-bash-lib/watchers)
[![Forks](https://img.shields.io/github/forks/attogram/ollama-bash-lib?style=flat)](https://github.com/attogram/ollama-bash-lib/forks)
[![Issues](https://img.shields.io/github/issues/attogram/ollama-bash-lib?style=flat)](https://github.com/attogram/ollama-bash-lib/issues)

[Quickstart](#quickstart) -
[Usage](#usage) -
[Demos](#demos) -
[Documentation](docs/README.md) -
[Functions](#functions) -
[License](#license) -
[More from the Attogram Project](#more-from-the-attogram-project) -
[Discord][discord-invite] -
[Repo](https://github.com/attogram/ollama-bash-lib) -
[Download](https://raw.githubusercontent.com/attogram/ollama-bash-lib/refs/heads/main/ollama_bash_lib.sh)

### Quickstart

```bash
git clone https://github.com/attogram/ollama-bash-lib.git
cd ollama-bash-lib
source ollama_bash_lib.sh

ollama_generate -m mistral:7b -p "Describe Bash in 3 words"
# Powerful, Flexible, Scripting.

# Tab completion to view available library functions
ollama_<TAB>

# ollama_api_get               ollama_generate_json         ollama_model_random
# ollama_api_ping              ollama_generate_stream       ollama_model_unload
# ollama_api_post              ollama_generate_stream_json  ollama_ps
# ollama_app_installed         ollama_lib_about             ollama_ps_json
# ollama_app_turbo             ollama_lib_version           ollama_show
# ollama_app_vars              ollama_list                  ollama_show_json
# ollama_app_version           ollama_list_array            ollama_thinking
# ollama_app_version_cli       ollama_list_json             
# ollama_app_version_json      ollama_messages              
# ollama_chat                  ollama_messages_add          
# ollama_chat_json             ollama_messages_clear        
# ollama_chat_stream           ollama_messages_count        
# ollama_chat_stream_json      ollama_messages_last         
# ollama_generate              ollama_messages_last_json
```

## Usage

Include in your shell or script:
```bash
source ./ollama_bash_lib.sh
```

Include in your script, with error checking:
```bash
ollama_bash_lib="path/to/ollama_bash_lib.sh"
if [[ ! -f "$ollama_bash_lib" ]]; then
  echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"
  exit 1
fi
source "$ollama_bash_lib"
```

## Documentation

For detailed information on how to use Ollama Bash Lib, including how-to guides, function references, and dependency information, please see the [documentation](docs/README.md).

## Demos

Here are a few of the most popular demos:

| Demo                                                         | About                                                                            |
|--------------------------------------------------------------|----------------------------------------------------------------------------------|
| [ollama_generate.md](demos/ollama_generate.md)               | Generate completion with `ollama_generate`                                       |
| [ollama_generate_json.md](demos/ollama_generate_json.md)     | Generate completion, json output with `ollama_generate_json`                     |
| [ollama_generate_stream.md](demos/ollama_generate_stream.md) | Generate completion, streaming with `ollama_generate_stream`                     |
| [ollama_chat.md](demos/ollama_chat.md)                       | Chat completion with `ollama_messages_add` and `ollama_chat`                     |
| [list.md](demos/list.md)                                     | Ollama model list with `ollama_list`, `ollama_list_array` and `ollama_list_json` |
| [show.md](demos/show.md)                                     | Model info with `ollama_show` and `ollama_show_json`                             |
| [prompt.all.models.md](demos/prompt.all.models.md)           | Send a prompt to all models                                                      |
| [prompts.model.md](demos/prompts.model.md)                   | Send many prompts to a model                                                     |
| [about.md](demos/about.md)                                   | Ollama Bash Lib info with `ollama_lib_about` and `ollama_lib_version`            |

See the **[full list of demos](demos/README.md)**.

### Review Demos

| Demo                                                   | About                                              |
|--------------------------------------------------------|----------------------------------------------------|
| [review.lib.md](demos/review.lib.md)                   | Code Review of `ollama_bash_lib.sh`                |
| [review.lib-security.md](demos/review.lib-security.md) | Security Review of `ollama_bash_lib.sh`            |
| [review.readme.md](demos/review.readme.md)             | Marketing Review of `README.md`                    |
| [review.funny.md](demos/review.funny.md)               | Humorous project descriptions based on `README.md` |

## Functions

The library provides a rich set of functions to interact with Ollama, including:

*   **Generate Functions:** `ollama_generate`, `ollama_generate_stream`
*   **Chat Functions:** `ollama_chat`, `ollama_messages_add`
*   **Model Functions:** `ollama_list`, `ollama_show`

For a full list of all functions and their detailed documentation, see the [Function Reference](docs/functions.md).

## License

Ollama Bash Lib is licensed under the terms of the [MIT License](LICENSE).

## More from the Attogram Project

| Project                                                     | About                                                                                                                                                                                           |
|-------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [**Attogram Project<br />Discord Channel**][discord-invite] | Join the **Attogram Project Discord Channel** for:<br />- Announcements<br />- Technical Support<br />- General Chat about Attogram Projects                                                    |
| [**Ollama Multirun**][ollama-multirun]                      | Run a prompt against all, or some, of your models running on Ollama.<br />- Creates web pages with the output, performance statistics and model info.<br />- All in a single Bash shell script. |
| [**Ollama Bash Lib**][ollama-bash-lib]                      | A Bash Library for Ollama                                                                                                                                                                       | 
| [**Ollama Bash Toolshed**][ollama-bash-toolshed]            | Chat with tool calling models.<br />- Sample tools included.<br />- Add new tools to your shed with ease.<br />- Runs on Ollama.<br />- All via Bash shell scripts.                             |
| [**LLM Council**][llm-council]                              | Start a chat room between all, or some, of your models running on Ollama.<br />- All in a single Bash shell script.                                                                             |
| [**Small Models**][small-models]                            | Comparison of small open source LLMs<br />- 8b parameters or less                                                                                                                               |
| [**AI Test Zone**][ai_test_zone]                            | AI Testing reports<br />- hosted on https://attogram.github.io/ai_test_zone/                                                                                                                    |

[discord-invite]: <https://discord.gg/BGQJCbYVBa> "Attogram Project Discord Channel"
[ollama-multirun]: <https://github.com/attogram/ollama-multirun> "Ollama Multirun"
[ollama-bash-toolshed]: <https://github.com/attogram/ollama-bash-toolshed> "Ollama Bash Toolshed"
[llm-council]: <https://github.com/attogram/llm-council> "LLM Council"
[ollama-bash-lib]: <https://github.com/attogram/ollama-bash-lib> "Ollama Bash Lib"
[small-models]: <https://github.com/attogram/small-models> "Small Models"
[ai_test_zone]: <https://github.com/attogram/ai_test_zone> "AI Test Zone"
