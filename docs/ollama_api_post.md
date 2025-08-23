# ollama_api_post

Performs a POST request to the Ollama API.

## Alias

`oap`

## Usage
```
Usage: ollama_api_post -P <path> -d <data> [-h] [-v]
```

## Description
```
POST request to the Ollama API.

  -P <path>   API path to send the POST request to.
  -d <data>   JSON content to send in the request body.
  -h          Show this help and exit.
  -v          Show version information and exit.

This is a core function for sending data to the Ollama API, used by functions like 'ollama_generate_json', 'ollama_chat_json', and 'ollama_show_json'.
It relies on the '_call_curl' function to perform the actual HTTP request.
```

## Arguments

* `-P <path>`: The API endpoint to query.
* `-d <data>`: The JSON data to send with the request.

## Output

The result of the API call is sent to `stdout`.

## Return

* `0`: API call was successful.
* `1`: API call failed.
* `2`: Usage error.
