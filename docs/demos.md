# Running Demos

This document provides instructions on how to run the demos for the Ollama Bash Lib.

## Running Individual Demos

Each demo has a corresponding shell script in the `demos/` directory. To run a demo, simply execute its script:

```bash
./demos/ollama_generate.sh
```

The output of the script will be displayed in your terminal. Most demos also have a corresponding `.md` file that shows a sample of the output.

## Running All Demos

To run all demos at once and save their output to markdown files, you can use the `run.demos.sh` script:

```bash
./demos/run.demos.sh
```

This will execute every `.sh` file in the `demos/` directory and save the output to a `.md` file with the same name.

## Heavy Demos

Some demos, such as the `review.*` demos, use very large context sizes. These demos may take a long time to run and consume a significant amount of resources.

*   `review.lib.md`
*   `review.lib-security.md`
*   `review.readme.md`
*   `review.funny.md`

It is recommended to run these demos on a machine with sufficient memory and a powerful CPU or GPU.

## Potential Issues

*   **Model Not Found:** Some demos may require specific models to be installed. If a model is not found, you will see an error message. You can use `ollama list` to see your installed models and `ollama pull <model_name>` to download new ones.
*   **Long Runtimes:** As mentioned above, some demos can take a long time to complete. Please be patient.
*   **Permissions:** Ensure that the demo scripts are executable. If you encounter a "Permission denied" error, you can make the scripts executable with the following command:
    ```bash
    chmod +x ./demos/*.sh
    ```
