#!/usr/bin/env bash

if [ "$OLLAMA_TEST_MODE" == "mock" ]; then
  _call_curl() {
    local method="$1"
    local endpoint="$2"
    local json_body="$3"

    if [[ "$method" != "GET" && "$method" != "POST" ]]; then
      echo "{\"error\":\"mock error: invalid method: $method\"}"
      return 1
    fi

    if [[ "$method" == "POST" && -z "$json_body" ]]; then
      echo "{\"error\":\"mock error: missing json body for post request\"}"
      return 1
    fi

    case "$endpoint" in
      "/api/tags")
        echo '{"models":[{"name":"mock-model:latest","modified_at":"2023-11-20T15:07:52.871123-08:00","size":123456789,"digest":"abcdef1234567890"}]}'
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
          echo '{"model":"mock-model:latest","created_at":"2023-11-20T15:07:52.871123-08:00","response":"This is a mock response.","done":true}'
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
          echo '{"model":"mock-model:latest","created_at":"2023-11-20T15:07:52.871123-08:00","message":{"role":"assistant","content":"This is a mock chat response."},"done":true}'
        fi
        ;;
      "/api/show")
        echo '{"modelfile":"FROM mock-model:latest\n","parameters":"stop [INST]\nstop [/INST]\nstop <<SYS>>\nstop <</SYS>>\n","template":"[INST] {{ .Prompt }} [/INST] "}'
        ;;
      "/api/ps")
        echo '{"models":[{"name":"mock-model:latest","size":123456789,"size_vram":123456789,"expires_at":"2023-11-20T18:07:52.871123-08:00"}]}'
        ;;
      "")
        echo "Ollama is running"
        ;;
      *)
        echo "{\"error\":\"mock error: endpoint not found: $endpoint\"}"
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
