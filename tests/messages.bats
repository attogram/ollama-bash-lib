#!/usr/bin/env bats

load_lib() {
    load '../ollama_bash_lib.sh'
}

setup() {
    export PATH="tests/mocks:$PATH"
}

@test "ollama_messages: no messages" {
    load_lib
    run ollama_messages
    [ "$status" -eq 1 ]
}

@test "ollama_messages_add: success" {
    load_lib
    run ollama_messages_add "user" "hello"
    [ "$status" -eq 0 ]
}

@test "ollama_messages: with messages" {
    load_lib
    ollama_messages_add "user" "hello"
    run ollama_messages
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = '{"role":"user","content":"hello"}' ]
}

@test "ollama_messages_clear: success" {
    load_lib
    ollama_messages_add "user" "hello"
    run ollama_messages_clear
    [ "$status" -eq 0 ]
    run ollama_messages
    [ "$status" -eq 1 ]
}

@test "ollama_messages_count: success" {
    load_lib
    ollama_messages_add "user" "hello"
    ollama_messages_add "assistant" "hi"
    run ollama_messages_count
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "2" ]
}
