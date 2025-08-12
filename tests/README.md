# Ollama Bash Lib Tests

This directory contains the tests for the Ollama Bash Lib. The tests are written using [Bats-core](https://github.com/bats-core/bats-core).

## Installation

To run the tests, you need to install Bats-core. You can install it using one of the following methods:

### Homebrew (macOS)

```bash
brew install bats-core
```

### npm

```bash
npm install -g bats
```

### From source

```bash
git clone https://github.com/bats-core/bats-core.git
cd bats-core
./install.sh /usr/local
```

## Running the tests

The tests can be run in two modes: **live** and **static**.

### Live Mode

In live mode, the tests will interact with a running Ollama instance and make real API calls. To run the tests in live mode, you need to have Ollama installed and running.

To run the tests in live mode, simply run the following command from the root of the repository:

```bash
bats tests
```

### Static Mode

In static mode, the tests will use mock scripts for `curl` and `ollama` to simulate the behavior of the real commands. This allows you to run the tests without having Ollama installed or an internet connection.

To run the tests in static mode, you need to set the `PATH` environment variable to include the `tests/mocks` directory before the system's `PATH`.

```bash
export PATH="$(pwd)/tests/mocks:$PATH"
bats tests
```
