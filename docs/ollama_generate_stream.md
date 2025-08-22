# ollama_generate_stream

Generate a completion and stream the output.

## Alias

`ogs`

## Usage

```bash
ollama_generate_stream -m <model> -p <prompt>
```

## Arguments

* `-m <model>`: The name of the model to use.
* `-p <prompt>`: The prompt to send to the model.

## Output

The generated text is streamed to `stdout`.

## Return

* `0`: Success
* `1`: Error
