#!/usr/bin/env bats

load_lib() {
    load '../ollama_bash_lib.sh'
}

setup() {
    export PATH="tests/mocks:$PATH"
}

@test "_call_curl: method not found" {
    load_lib
    run _call_curl
    [ "$status" -eq 1 ]
    [ "${lines[0]}" = "[ERROR] _call_curl: Method Not Found. Usage: _call_curl \"GET|POST\" \"/api/path\" \"{ optional json content }\"" ]
}

@test "_redact: redact" {
    load_lib
    OLLAMA_LIB_TURBO_KEY="secret"
    run _redact "this is a secret"
    [ "$status" -eq 0 ]
    [ "$output" = "this is a [REDACTED]" ]
}

@test "_exists: command exists" {
    load_lib
    run _exists "echo"
    [ "$status" -eq 0 ]
}

@test "_exists: command does not exist" {
    load_lib
    run _exists "nonexistentcommand"
    [ "$status" -eq 1 ]
}

@test "_call_curl: GET" {
    load_lib
    run _call_curl "GET" "/api/test"
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "curl -s -N -f -H Content-Type: application/json -X GET http://localhost:11434/api/test" ]
}

@test "_call_curl: POST" {
    load_lib
    run _call_curl "POST" "/api/test" '{"key":"value"}'
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "curl -s -N -f -H Content-Type: application/json -X POST http://localhost:11434/api/test -d @-" ]
}

@test "ollama_api_get: success" {
    load_lib
    run ollama_api_get "/api/test"
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "curl -s -N -f -H Content-Type: application/json -X GET http://localhost:11434/api/test" ]
}

@test "ollama_api_post: success" {
    load_lib
    run ollama_api_post "/api/test" '{"key":"value"}'
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "curl -s -N -f -H Content-Type: application/json -X POST http://localhost:11434/api/test -d @-" ]
}

@test "ollama_api_ping: success" {
    load_lib
    run ollama_api_ping
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "curl -s -N -f -H Content-Type: application/json -X GET http://localhost:11434" ]
}
