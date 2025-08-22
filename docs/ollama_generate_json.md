# ollama_generate_json

Generate a completion, in JSON format.

## Alias

`ogj`

## Usage

```bash
ollama_generate_json -m <model> -p <prompt>
```

## Arguments

* `-m <model>`: The name of the model to use.
* `-p <prompt>`: The prompt to send to the model.

## Output

A JSON object containing the generated text and other metadata is sent to `stdout`.

## Return

* `0`: Success
* `1`: Error
