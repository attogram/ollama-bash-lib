# ollama_api_post

Performs a POST request to the Ollama API.

## Alias

`oap`

## Usage

```bash
ollama_api_post "/api/path" "{ \"json\": \"content\" }"
```

## Arguments

* `"/api/path"`: The API endpoint to query.
* `"{ \"json\": \"content\" }"`: The JSON data to send with the request.

## Output

The result of the API call is sent to `stdout`.

## Return

* `0`: API call was successful.
* `1`: API call failed.
