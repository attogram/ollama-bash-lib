# Ollama Bash Lib

A Bash Library to interact with the Ollama application

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
## Demo / Tests

See [test](tests) directory for demos and tests

```
./tests/demo.sh
```

## License

Ollama Bash Lib is licensed under the terms of the [MIT License](LICENSE).

