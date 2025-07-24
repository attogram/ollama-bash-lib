# Ollama Bash Lib

A Bash Library to interact with the [Ollama](https://github.com/ollama/ollama) application

Repo: https://github.com/attogram/ollama-bash-lib

## Usage

Include Ollama Bash Lib in your Bash script:

```
source ./ollama-bash-lib.sh
```
or
```
ollamaBashLib="path/to/ollama-bash-lib.sh"
if [ ! -f "$ollamaBashLib" ]; then
  echo "ERROR: Ollama Bash Lib Not Found: $ollamaBashLib"
  exit 1;
fi
source "$ollamaBashLib"
```

## Demos

See the **[demos](demos)** directory for demo scripts

```
./demos/demo.sh
```

## License

Ollama Bash Lib is licensed under the terms of the [MIT License](LICENSE).

