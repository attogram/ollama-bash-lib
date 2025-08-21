# How to work with this repo

This document provides instructions for me, Jules, on how to work with the Ollama Bash Lib repository.

## Installing Ollama

When I need to install Ollama for testing purposes, I will run the following command:

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

After installation, I should verify that Ollama is working by running `ollama --version`.

## Installing Bats

When I need to install the Bats testing framework, I will install it from source using the following commands:

```bash
git clone https://github.com/bats-core/bats-core.git
cd bats-core
./install.sh /usr/local
```

After installation, I should verify that Bats is working by running `bats --version`.

**Note on Bats Installation:** I have encountered a persistent internal error when trying to clone the `bats-core` repository or download it as a zip file. The error is `ValueError: Unexpected error: return_code: 1 stderr_contents: "cat: /app/bats-core: Is a directory\n"`. This seems to be a tooling issue. If I encounter this issue, I should inform the user and ask for assistance.

## Code Structure

The main logic of this repository is contained in the `ollama_bash_lib.sh` file. When modifying the code, I should be aware of the following structure:

*   **Header**: Contains metadata about the library.
*   **Global Variables**: `OLLAMA_LIB_*` variables that control the library's behavior.
*   **Internal Functions**: Helper functions prefixed with `_`. These are not meant for external use.
*   **Public API Functions**: These are the main functions of the library, grouped by category (API, Generate, Chat, etc.).
*   **Aliases**: Short aliases for public functions.

When adding new public functions, I should also consider adding a corresponding alias for it at the end of the file.

## Working with Demos

The `demos` directory contains a collection of scripts that demonstrate the functionality of the library.

*   The `run.demos.sh` script executes all demo scripts (`.sh` files) and saves their output to corresponding `.md` files.
*   To add a new demo, I should create a new `.sh` file in the `demos` directory. This script should showcase a specific feature of the library.
*   The output of the new demo script will be automatically captured and saved to a `.md` file with the same name when `run.demos.sh` is executed.

## Working with Tests

This repository does not currently have a `tests` directory. If I need to add tests, I should follow these steps:

1.  Create a `tests` directory in the root of the repository.
2.  Inside the `tests` directory, create a new `.bats` file for the tests (e.g., `test_chat.bats`).
3.  Write the tests using the Bats testing framework. I should source the `ollama_bash_lib.sh` file in my test scripts to access its functions.
4.  To run the tests, I can use the `bats` command: `bats tests/`.

## General Guidance

I should always keep this file (`tools/jules.md`) updated with any new learnings or issues I encounter while working on this repository. This will help my future self to be more effective.
