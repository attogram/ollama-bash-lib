Ollama Bash Lib - Demo - ollama_ps, ollama_ps_json
ollama_bash_lib: ./../ollama_bash_lib.sh
ollama_lib_version: v0.38.0
ollama_installed: OK

ollama_ps

NAME            ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
codellama:7b    8fdf8f752f6e    6.9 GB    100% GPU     4096       4 minutes from now    

ollama_ps_json

{
  "models": [
    {
      "name": "codellama:7b",
      "model": "codellama:7b",
      "size": 6927104512,
      "digest": "8fdf8f752f6e80de33e82f381aba784c025982752cd1ae9377add66449d2225f",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": null,
        "parameter_size": "7B",
        "quantization_level": "Q4_0"
      },
      "expires_at": "2025-07-29T20:02:23.982961+02:00",
      "size_vram": 6927104512,
      "context_length": 4096
    }
  ]
}
