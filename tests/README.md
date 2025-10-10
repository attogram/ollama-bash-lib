# Ollama Bash Lib - Testing

This directory contains the test suite for the Ollama Bash Lib. The tests are written using the [Bats (Bash Automated Testing System)](https://github.com/bats-core/bats-core).

## Setting up the Test Environment

To run the tests, you will need to have Bats installed.

### Installing Bats

You can install Bats using your system's package manager.

**For Debian/Ubuntu:**
```bash
sudo apt-get update
sudo apt-get install -y bats
```

**For macOS (using Homebrew):**
```bash
brew install bats-core
```

For other systems, please refer to the [official Bats installation guide](https://github.com/bats-core/bats-core#installing-bats-from-source).

After installation, you can verify that Bats is installed correctly by running:
```bash
bats --version
```

## Running Tests

There are two primary modes for running the tests: **LOCAL (mock)** and **LIVE**.

### LOCAL (Mock) Mode (Default)

This mode uses mock data and does not require a running Ollama application. It is ideal for unit testing the library's core logic without external dependencies.

To run the entire test suite in LOCAL mode, navigate to the root of the repository and run:
```bash
bats tests/
```

### LIVE Mode

This mode runs tests against a live Ollama application. It is useful for integration testing and ensuring that the library interacts correctly with a real Ollama instance.

To run the entire test suite in LIVE mode, set the `OLLAMA_TEST_MODE` environment variable to `live`:
```bash
OLLAMA_TEST_MODE=live bats tests/
```

### Running a Specific Test File

You can also run a specific test file in either mode:

-   **LOCAL (mock) mode:**
    ```bash
    bats tests/some_test_file.bats
    ```

-   **LIVE mode:**
    ```bash
    OLLAMA_TEST_MODE=live bats tests/some_test_file.bats
    ```

## Creating New Tests

To create new tests, you should create a new file in the `tests` directory with a `.bats` extension. It is recommended to create a separate file for each function or group of related functions. For example, tests for the `ollama_generate` function should be in a file named `tests/ollama_generate.bats`.

### Test File Structure

A basic test file looks like this:

```bash
#!/usr/bin/env bats

# Load the Ollama Bash Lib
source ./ollama_bash_lib.sh

# A basic test case
@test "A descriptive name for your test" {
  # Run a command or function
  run some_function_to_test "with some arguments"

  # Add assertions to check the output
  [ "$status" -eq 0 ] # Check the exit status
  [ "$output" = "expected output" ] # Check the output string
}
```

### Writing Tests

-   **Load the Library:** Make sure to source the `ollama_bash_lib.sh` at the beginning of your test file so that you can call the library functions.
-   **Test Names:** Use descriptive names for your tests in the `@test` directive.
-   **`run` command:** Use the `run` command to execute the function you want to test. This captures the `status` and `output` of the command.
-   **Assertions:** Use assertions to check the results of your test. Bats provides special variables that you can use for assertions:
    -   `$status`: The exit status of the command.
    -   `$output`: The combined content of stdout and stderr from the command.
    -   `$lines`: An array containing each line of the output.

For more advanced testing techniques, please refer to the [official Bats documentation](https://bats-core.readthedocs.io/en/stable/).
