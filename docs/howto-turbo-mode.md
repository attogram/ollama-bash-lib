# How to use Ollama Turbo Mode

Signup and purchase a Turbo Mode subscription from https://ollama.com

Create an API key via https://ollama.com/settings/keys

Copy the key and keep it in a safe place!
You will only be shown the full key once.

Use command `ollama_app_turbo` to turn Turbo Mode on/off.
You will be prompted to enter your API key.
```
$ ollama_app_turbo -m on
Enter Ollama API Key (input hidden):
```

This will set and export `OBL_API` and `OLLAMA_HOST` to `https://ollama.com`,
and set `OBL_TURBO_KEY` to your key.

Note: `OBL_TURBO_KEY` is never exported.
You must decide yourself if you want to export it into your environment.
```
export OBL_KEY=my.super.secret.key
```

If the key is set, then `ollama_app_turbo -m on` will not prompt you again for the key.

To turn **off** Turbo Mode, simply use `ollama_app_turbo -m off`.
This will unset `OBL_TURBO_KEY`
and reset `OBL_API` and `OLLAMA_HOST` to `http://localhost:11434`

Use `ollama_lib_about` to view your current settings.
