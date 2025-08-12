#!/usr/bin/env bats

load_lib() {
    load '../ollama_bash_lib.sh'
}

setup() {
    export PATH="tests/mocks:$PATH"
}

@test "ollama_chat_json: no messages" {
    load_lib
    run ollama_chat_json "model"
    [ "$status" -eq 1 ]
}

@test "ollama_chat_json: no model" {
    load_lib
    ollama_messages_add "user" "hello"
    run ollama_chat_json ""
    [ "$status" -eq 1 ]
}

@test "ollama_chat_json: success" {
    load_lib
    ollama_messages_add "user" "hello"
    run ollama_chat_json "model"
    [ "$status" -eq 0 ]
}

@test "ollama_chat: no model" {
    load_lib
    run ollama_chat ""
    [ "$status" -eq 1 ]
}

@test "ollama_chat: success" {
    load_lib
    ollama_messages_add "user" "hello"
    run ollama_chat "model"
    [ "$status" -eq 0 ]
}

@test "ollama_chat_stream: no model" {
    load_lib
    run ollama_chat_stream ""
    [ "$status" -eq 1 ]
}

@test "ollama_chat_stream: success" {
    load_lib
    ollama_messages_add "user" "hello"
    run ollama_chat_stream "model"
    [ "$status" -eq 0 ]
}

@test "ollama_chat_stream_json: no model" {
    load_lib
    run ollama_chat_stream_json ""
    [ "$status" -eq 1 ]
}

@test "ollama_chat_stream_json: success" {
    load_lib
    ollama_messages_add "user" "hello"
    run ollama_chat_stream_json "model"
    [ "$status" -eq 0 ]
}
