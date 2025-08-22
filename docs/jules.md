# Jules's Notes

This file is for me, Jules, to keep notes on how to work with this repository.

## Lessons Learned

* The user provides iterative feedback. I should not assume that the initial instructions are final. I should be prepared for course corrections and follow-up requests.
* I must be very careful with `replace_with_git_merge_diff` and double-check my search strings to avoid getting stuck in loops.
* I should always read the source code of a function before writing documentation for it to avoid hallucinations.
* I need to pay close attention to the user's specific formatting requests for file names, heading titles, and content structure.

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
