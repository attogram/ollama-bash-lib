# ollama_generate_stream_json

Generate a completion, in JSON format, and stream the output.

## Alias

`ogsj`

## Usage

```bash
ollama_generate_stream_json -m <model> -p <prompt>
```

## Arguments

* `-m <model>`: The name of the model to use.
* `-p <prompt>`: The prompt to send to the model.

## Output

A stream of JSON objects containing the generated text and other metadata is sent to `stdout`.

## Return

* `0`: Success
* `1`: Error
