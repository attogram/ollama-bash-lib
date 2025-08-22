# ollama_api_ping

Pings the Ollama API to check for availability.

## Alias

`oapi`

## Usage from Help Text
```
Usage: ollama_api_ping [-h] [-v]
```

## Description from Help Text
```
Ping the Ollama API to check for availability.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function sends a request to the root of the Ollama API to verify that it is running and accessible.
It is useful for health checks and ensuring connectivity before attempting to use other API functions.
This function relies on 'ollama_api_get' to make the request.
```

## Output

None.

## Return

* `0`: API is reachable.
* `1`: API is not reachable.
* `2`: Usage error.
