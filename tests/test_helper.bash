#!/usr/bin/env bash

if [ "$OLLAMA_TEST_MODE" != "live" ]; then
  ollama_app_installed() {
    return 0
  }

  ollama() {
    case "$1" in
      list)
        printf "NAME\tID\tSIZE\tMODIFIED\n"
        printf "mock-model:latest\tabcdef123\t1.2GB\t1 week ago\n"
        ;;
      ps)
        # to test unload, ps needs to show a model is loaded first
        if [[ -f "/tmp/ollama_mock_model_loaded" ]]; then
            printf "NAME\tID\tSIZE\tVRAM\tEXPIRES\n"
            printf "phi3\tphi3id\t1.2GB\t1.2GB\t5 minutes\n"
        else
            printf "NAME\tID\tSIZE\tVRAM\tEXPIRES\n"
        fi
        ;;
      show)
        if [[ "$2" == "-m" && "$3" == "phi3" ]]; then
           touch /tmp/ollama_mock_model_loaded
           printf "FROM %s\n" "$3"
           printf "parameters ...\n"
        else
           echo "Error: flag --model is required" >&2
           return 1
        fi
        ;;
      --version)
        printf "ollama version is 0.1.42\n"
        ;;
      *)
        # Fallback for other commands if needed
        return 1
        ;;
    esac
    return 0
  }
  export -f ollama

  _call_curl() {
    local method="$1"
    local endpoint="$2"
    local json_body="$3"

    if [[ "$method" != "GET" && "$method" != "POST" ]]; then
      printf '%s' "{\"error\":\"mock error: invalid method: $method\"}"
      return 1
    fi

    if [[ "$method" == "POST" && -z "$json_body" ]]; then
      printf '%s' "{\"error\":\"mock error: missing json body for post request\"}"
      return 1
    fi

    if [[ "$method" == "POST" && -n "$json_body" ]]; then
      if ! echo "$json_body" | jq -e . >/dev/null 2>&1; then
        printf '%s' "{\"error\":\"mock error: invalid json body\"}"
        return 1
      fi
    fi

    case "$endpoint" in
      "/api/tags")
        printf '%s' '{"models":[{"name":"mock-model:latest","modified_at":"2023-11-20T15:07:52.871123-08:00","size":123456789,"digest":"abcdef1234567890"}]}'
        ;;
      "/api/generate")
        if [[ $(echo "$json_body" | jq -r '.stream') == "true" ]]; then
          local prompt_content
          prompt_content=$(echo "$json_body" | jq -r '.prompt')
          if [[ "$prompt_content" == "generate a list of three fruits, each on a new line." ]]; then
            _mock_ollama_generate_stream_multiline
          else
            _mock_ollama_generate_stream
          fi
        else
          # Special case for unload model
          if [[ $(echo "$json_body" | jq -r '.keep_alive') == "0" ]]; then
              rm -f /tmp/ollama_mock_model_loaded
              printf '%s' '{"status":"success"}'
          else
              printf '%s' '{"model":"mock-model:latest","created_at":"2023-11-20T15:07:52.871123-08:00","response":"This is a mock response.","done":true}'
          fi
        fi
        ;;
      "/api/chat")
        if [[ $(echo "$json_body" | jq -r '.stream') == "true" ]]; then
          # Check for a specific prompt to decide which mock to use
          local prompt_content
          prompt_content=$(echo "$json_body" | jq -r '.messages[-1].content')
          if [[ "$prompt_content" == "generate a list of three fruits, each on a new line." ]]; then
            _mock_ollama_chat_stream_multiline
          else
            _mock_ollama_chat_stream
          fi
        else
          printf '%s' '{"model":"mock-model:latest","created_at":"2023-11-20T15:07:52.871123-08:00","message":{"role":"assistant","content":"This is a mock chat response."},"done":true}'
        fi
        ;;
      "/api/show")
        printf '%s' '{"modelfile":"FROM mock-model:latest\n","parameters":"stop [INST]\nstop [/INST]\nstop <<SYS>>\nstop <</SYS>>\n","template":"[INST] {{ .Prompt }} [/INST] "}'
        ;;
      "/api/ps")
        printf '%s' '{"models":[{"name":"mock-model:latest","size":123456789,"size_vram":123456789,"expires_at":"2023-11-20T18:07:52.871123-08:00"}]}'
        ;;
      "/api/version")
        printf '%s' '{"version":"0.1.42"}'
        ;;
      "")
        printf '%s' "Ollama is running"
        ;;
      *)
        printf '%s' "{\"error\":\"mock error: endpoint not found: $endpoint\"}"
        return 1
        ;;
    esac
  }

  _mock_ollama_generate_stream() {
    echo '{"model":"mock-model:latest","created_at":"2023-11-20T15:07:52.871123-08:00","response":"This is a mock streaming response.","done":true}'
  }

  _mock_ollama_generate_stream_multiline() {
    echo '{"model":"mock-model:latest","created_at":"2023-11-20T15:07:52.871123-08:00","response":"Apple\n","done":false}'
    echo '{"model":"mock-model:latest","created_at":"2023-11-20T15:07:52.871123-08:00","response":"Banana\n","done":false}'
    echo '{"model":"mock-model:latest","created_at":"2023-11-20T15:07:52.871123-08:00","response":"Cherry","done":false}'
    echo '{"model":"mock-model:latest","created_at":"2023-11-20T15:07:52.871123-08:00","response":"","done":true}'
  }

  _mock_ollama_chat_stream() {
    echo '{"model":"mock-model:latest","created_at":"2023-11-20T15:07:52.871123-08:00","message":{"role":"assistant","content":"This is a mock streaming chat response."},"done":true}'
  }

  _mock_ollama_chat_stream_multiline() {
    echo '{"model":"mock-model:latest","created_at":"2023-11-20T15:07:52.871123-08:00","message":{"role":"assistant","content":"Apple\n"},"done":false}'
    echo '{"model":"mock-model:latest","created_at":"2023-11-20T15:07:52.871123-08:00","message":{"role":"assistant","content":"Banana\n"},"done":false}'
    echo '{"model":"mock-model:latest","created_at":"2023-11-20T15:07:52.871123-08:00","message":{"role":"assistant","content":"Cherry"},"done":false}'
    echo '{"model":"mock-model:latest","created_at":"2023-11-20T15:07:52.871123-08:00","message":null,"done":true}'
  }
fi