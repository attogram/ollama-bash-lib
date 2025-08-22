# ollama_api_get

Performs a GET request to the Ollama API.

## Alias

`oag`

## Usage
```
Usage: ollama_api_get [-P <path>] [-h] [-v]
```

## Description
```
GET request to the Ollama API.

  -P <path>   API path to send the GET request to (optional).
  -h          Show this help and exit.
  -v          Show version information and exit.

This is a fundamental function used by many other functions in this library to communicate with the Ollama API, such as 'ollama_list_json' and 'ollama_api_ping'.
It relies on the '_call_curl' function to perform the actual HTTP request.
```

## Arguments

* `-P <path>`: The API endpoint to query.

## Output

The result of the API call is sent to `stdout`.

## Return

* `0`: API call was successful.
* `1`: API call failed.
* `2`: Usage error.
