# ollama_app_turbo

Enable or disable Turbo Mode.

## Alias

`oat`

## Usage from Help Text
```
Usage: ollama_app_turbo -m <on|off> [-e] [-h] [-v]
```

## Description from Help Text
```
Enable or disable Turbo Mode.

  -m <on|off> Enable or disable Turbo Mode.
  -e          Export the API key to the environment.
  -h          Show this help and exit.
  -v          Show version information and exit.

Turbo Mode configures the library to use the Ollama.com API, which may provide faster responses.
This requires an API key, which the function will prompt for if not already set.
Use 'off' to revert to using the local Ollama instance.
```

## Arguments
* `-m <on|off>`: Turn Turbo Mode "on" or "off".
* `-e`: Export the API key to the environment.

## Output
Prompts for an API key if one is not already set.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
