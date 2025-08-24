# Jules's Notes

This file is for me, Jules, to keep notes on how to work with this repository.

## Lessons Learned

* The user provides iterative feedback. I should not assume that the initial instructions are final. I should be prepared for course corrections and follow-up requests.
* I must be very careful with `replace_with_git_merge_diff` and double-check my search strings to avoid getting stuck in loops.
* I should always read the source code of a function before writing documentation for it to avoid hallucinations.
* I need to pay close attention to the user's specific formatting requests for file names, heading titles, and content structure.
* The `ls` command in this environment may not show all files. Use `ls -aF` to get a complete and accurate listing of directory contents.
* New shell scripts must be made executable with `chmod +x` before they can be run by other scripts.
* The `demos/run.demos.sh` script is the standard way to generate the markdown documentation for the demos.

## Testing

### Setting up Bats

I have set up the Bats testing framework for this project. Here are the steps I took:

1.  **Checked for Bats:** I first checked if Bats was installed by running `bats --version`. The command failed, indicating that Bats was not installed.
2.  **Installed Bats:** I installed Bats using the command `sudo apt-get update && sudo apt-get install -y bats`.
3.  **Verified Installation:** After the installation, I ran `bats --version` again and confirmed that it was installed correctly.
4.  **Created a Test File:** I created a simple test file at `tests/basic.bats` to ensure that the testing framework was working.
5.  **Ran the Test:** I ran the test using the command `bats tests/basic.bats` and it passed.

This process confirms that the testing environment is now set up and ready for use.

### Comprehensive Test Suite

I have created a comprehensive test suite for the library, covering all public and internal functions. The process involved:

1.  **Identifying all functions:** I listed all functions from `ollama_bash_lib.sh` to ensure complete coverage.
2.  **Creating individual test files:** I created separate `.bats` files for each function or group of related functions in the `tests/` directory.
3.  **Writing test cases:** I wrote multiple test cases for each function, covering:
    *   Positive scenarios (correct usage and expected output).
    *   Negative scenarios (error handling, invalid input).
    *   Edge cases.
4.  **Debugging and Fixing:** I encountered and fixed several issues during the testing process, including:
    *   Incorrect assumptions about function behavior (e.g., `_is_valid_json`).
    *   Bugs in the library code (e.g., `ollama_model_unload`).
    *   Subshell issues in Bats tests that prevented state changes from being persisted.
5.  **Ensuring all tests pass:** I ran the entire test suite and ensured that all 53 tests passed successfully.

This comprehensive test suite will help to ensure the quality and stability of the library going forward.

## Documentation and Demo Structure

I have created a new documentation and demo structure. Here is how to keep it up-to-date:

*   **`docs/` directory**: This is the main directory for all documentation.
    *   **`docs/README.md`**: This is the main index for the documentation. It should be updated whenever a new documentation file is added. It should contain a brief, one-line description for each link.
    *   **`docs/functions.md`**: This file contains the summary tables of all functions. The function names in this file should link to their individual documentation files.
    *   **`docs/ollama_*.md`**: Each of these files contains the detailed documentation for a single `ollama_*` function. The content should be consistent with the function's help text in `ollama_bash_lib.sh`.
    *   **`docs/howto-*.md`**: These files contain guides for common tasks.
    *   **`docs/dependency-*.md`**: These files document the dependencies of the library.
*   **`demos/` directory**: This directory contains demo scripts.
    *   **`demos/README.md`**: This file contains a full list of all demos. It should be updated when a new demo is added.
*   **`README.md` (main)**: The main `README.md` should only contain a brief overview of the project, a curated list of top demos, and a summary of major function categories, with links to the detailed documentation in the `docs/` directory.
