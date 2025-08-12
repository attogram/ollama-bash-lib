#!/usr/bin/env bats

load_lib() {
    load '../ollama_bash_lib.sh'
}

setup() {
    export PATH="tests/mocks:$PATH"
}

@test "oag: success" {
    load_lib
    run oag "/api/test"
    [ "$status" -eq 0 ]
}

@test "oapi: success" {
    load_lib
    run oapi
    [ "$status" -eq 0 ]
}

@test "oap: success" {
    load_lib
    run oap "/api/test" '{"key":"value"}'
    [ "$status" -eq 0 ]
}

@test "oai: success" {
    load_lib
    run oai
    [ "$status" -eq 1 ]
}

@test "oat: success" {
    load_lib
    run oat "on"
    [ "$status" -eq 0 ]
}

@test "oav: success" {
    load_lib
    run oav
    [ "$status" -eq 0 ]
}

@test "oave: success" {
    load_lib
    run oave
    [ "$status" -eq 0 ]
}

@test "oavj: success" {
    load_lib
    run oavj
    [ "$status" -eq 0 ]
}

@test "oavc: success" {
    load_lib
    run oavc
    [ "$status" -eq 0 ]
}

@test "oc: success" {
    load_lib
    ollama_messages_add "user" "hello"
    run oc "model"
    [ "$status" -eq 0 ]
}

@test "ocj: success" {
    load_lib
    ollama_messages_add "user" "hello"
    run ocj "model"
    [ "$status" -eq 0 ]
}

@test "ocs: success" {
    load_lib
    ollama_messages_add "user" "hello"
    run ocs "model"
    [ "$status" -eq 0 ]
}

@test "ocsj: success" {
    load_lib
    ollama_messages_add "user" "hello"
    run ocsj "model"
    [ "$status" -eq 0 ]
}

@test "oe: success" {
    load_lib
    run oe "task" "model"
    [ "$status" -eq 0 ]
}

@test "og: success" {
    load_lib
    run og "model" "prompt"
    [ "$status" -eq 0 ]
}

@test "ogj: success" {
    load_lib
    run ogj "model" "prompt"
    [ "$status" -eq 0 ]
}

@test "ogs: success" {
    load_lib
    run ogs "model" "prompt"
    [ "$status" -eq 0 ]
}

@test "ogsj: success" {
    load_lib
    run ogsj "model" "prompt"
    [ "$status" -eq 0 ]
}

@test "olab: success" {
    load_lib
    run olab
    [ "$status" -eq 0 ]
}

@test "olv: success" {
    load_lib
    run olv
    [ "$status" -eq 0 ]
}

@test "ol: success" {
    load_lib
    run ol
    [ "$status" -eq 0 ]
}

@test "ola: success" {
    load_lib
    run ola
    [ "$status" -eq 0 ]
}

@test "olj: success" {
    load_lib
    run olj
    [ "$status" -eq 0 ]
}

@test "om: success" {
    load_lib
    ollama_messages_add "user" "hello"
    run om
    [ "$status" -eq 0 ]
}

@test "oma: success" {
    load_lib
    run oma "user" "hello"
    [ "$status" -eq 0 ]
}

@test "omc: success" {
    load_lib
    run omc
    [ "$status" -eq 0 ]
}

@test "omco: success" {
    load_lib
    run omco
    [ "$status" -eq 0 ]
}

@test "omr: success" {
    load_lib
    run omr
    [ "$status" -eq 0 ]
}

@test "omu: success" {
    load_lib
    run omu "model"
    [ "$status" -eq 0 ]
}

@test "os: success" {
    load_lib
    run os "model"
    [ "$status" -eq 0 ]
}

@test "osj: success" {
    load_lib
    run osj "model"
    [ "$status" -eq 0 ]
}

@test "op: success" {
    load_lib
    run op
    [ "$status" -eq 0 ]
}

@test "opj: success" {
    load_lib
    run opj
    [ "$status" -eq 0 ]
}
