### AGENT INSTRUCTIONS

This document provides instructions for agents working on the Ollama Bash Lib repository.

#### Introduction

The Ollama Bash Lib is a Bash library for interacting with the Ollama API. It provides a set of functions to generate completions, manage models, and handle chat sessions directly from the shell.

#### Codebase Overview

-   `ollama_bash_lib.sh`: This is the main library file containing all the core functions. It is designed to be sourced into other bash scripts.
-   `tests/`: This directory contains the test suite for the library, written using Bats (Bash Automated Testing System).
-   `demos/`: This directory contains example scripts demonstrating how to use the library's functions.
-   `docs/`: This directory contains detailed documentation for the library.

---

This guide will help you with the test setup for the Ollama Bash Lib.

#### Testing Modes

There are two modes for running the tests:

1.  **LIVE Mode**: This mode connects to a live, running Ollama application. Use this for integration testing and to ensure the library works with a real Ollama instance.
2.  **LOCAL (Mock) Mode**: This mode uses mock data and does not require a running Ollama application. It is ideal for unit testing and ensuring the core logic of the library is working correctly without external dependencies.

#### Running Tests

To run the tests, use the `bats` command. You can specify the test mode by setting the `OLLAMA_TEST_MODE` environment variable.

-   **To run in LOCAL (mock) mode:**
    ```bash
    bats tests/
    ```
    *(This is the default mode)*

-   **To run in LIVE mode:**
    ```bash
    OLLAMA_TEST_MODE=live bats tests/
    ```

#### Mock Data

The mock data is located in `tests/test_helper.bash`. This file contains a `_call_curl` function that intercepts API calls and returns mock responses when `OLLAMA_TEST_MODE` is set to `mock`.

When adding new tests that require mock data, you can add new conditions to the `case` statement in the `_call_curl` function to handle different endpoints and request bodies.

#### Adding New Tests

When creating new tests, please follow these guidelines:

-   Create a new `.bats` file in the `tests` directory for each function or group of related functions.
-   Ensure your tests can run in both `LIVE` and `LOCAL` modes whenever possible.
-   If a test requires mock data, add it to `tests/test_helper.bash`.

By following these instructions, you can help maintain a robust and reliable test suite for the Ollama Bash Lib.