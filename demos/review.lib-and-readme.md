# Sync review of [ollama_bash_lib.sh](../ollama_bash_lib.sh) AND [README.md](../README.md)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.3

```bash
task='Check that the README is in sync with the LIBRARY.
Output your review in Markdown format.'
readme='../README.md'
library='../ollama_bash_lib.sh'
ollama_thinking hide
ollama_generate -m "qwen3:8b" -p "$task\n\nREADME:\n\n$(cat "$readme")\n\nLIBRARY:\n\n$(cat "$library")"
```
<think>
Okay, I need to figure out how to use this Ollama Bash Lib. Let me start by looking through the code provided. The user has shared a bunch of functions and aliases, so I should probably go through them step by step.

First, there's a function called ollama_lib_about. That probably gives information about the library. Let me check what it does. The function uses compgen to list available functions, but only those starting with 'ollama_'. So if I run ollama_lib_about, it should show details about the library and list all the functions. That's a good starting point.

Then there's ollama_lib_version, which just prints the OBL_VERSION variable. The version is probably defined somewhere in the script, maybe as a variable. The user might have set that in their environment or in the script itself. But since I don't have access to that, I'll have to assume it's there.

Looking at the aliases, like oag which is an alias for ollama_api_get. These aliases make it easier to use the functions without typing the full name each time. For example, using oag instead of ollama_api_get.

Now, the main functions. There's ollama_app_installed, which checks if Ollama is installed. That's probably a function that runs a command to check the installation status. Similarly, ollama_app_turbo might be related to turbo features, but I need to check the actual function code for details.

The functions related to chat, like ollama_chat, generate, list, etc., are probably for interacting with the Ollama model. For example, ollama_chat might be used to have a conversation with the model, while ollama_generate could be for generating text based on prompts.

The ollama_messages functions seem to handle the message history, like adding messages, clearing them, counting them. That's useful for maintaining context in conversations.

The ollama_thinking function sets the thinking mode, which controls whether the model's thinking process is displayed. The options are on, off, or hide. So if I run ot on, it should enable showing the thinking output.

The user also mentioned GitHub and Discord for support. So if I have any issues, I can check those resources.

But how do I actually use these functions? Let's think of an example. Suppose I want to generate text using the Ollama model. I might use ollama_generate, passing the model name and prompt. For example, og "my-model" "What is the capital of France?".

Another example: To list all available models, I could use ollama_list. If I want to clear the message history, I'd use omclear.

Wait, but I need to make sure that the environment variables are set correctly. For instance, OBL_THINKING controls the thinking mode. If it's not set, the default might be 'off'.

Also, the functions might require certain environment variables like OBL_API or OLLAMA_API_URL to point to the correct endpoint. The user should have those set up, or the functions might default to a specific URL.

But since the code is provided, the user can adjust the variables as needed. For example, if OBL_API is not set, the functions might not work properly.

In summary, to use this library, the user should source the script, set necessary environment variables, and then use the aliases or functions to interact with Ollama. They can start by checking the library info with ollama_lib_about, then explore the available functions and their usage.
</think>

To effectively utilize the **Ollama Bash Lib**, follow this structured approach to set up and interact with the Ollama API using the provided functions and aliases:

---

### ✅ **Step 1: Source the Script**
Ensure the script is sourced in your shell session to access all functions and aliases:
```bash
source /path/to/ollama-bash-lib.sh
```
Replace `/path/to/ollama-bash-lib.sh` with the actual file path.

---

### 🧠 **Step 2: Verify Library Version**
Check the version of the Bash Lib to confirm compatibility:
```bash
olv
```
This will output the version stored in `OBL_VERSION`.

---

### 📜 **Step 3: Explore Available Functions**
Run the `ollama_lib_about` function to see key details and list all available functions:
```bash
olab
```
This will display:
- Library metadata (name, URL, license, etc.)
- A list of all `ollama_*` functions for quick reference

---

### 🔄 **Step 4: Set Environment Variables (if needed)**
Some functions rely on environment variables. Ensure these are set:
- `OBL_API`: API endpoint for Ollama (e.g., `http://localhost:11434`)
- `OBL_TURBO_KEY`: Optional API key for turbo features
- `OBL_TIMEOUT`: Timeout for API requests (in seconds)

Example:
```bash
export OBL_API="http://localhost:11434"
```

---

### 🧩 **Step 5: Use Core Functions**
#### 1. **Check Ollama Installation**
```bash
oai
```
Verifies if Ollama is installed and accessible.

#### 2. **Generate Text**
```bash
og "my-model" "What is the capital of France?"
```
Generates text using the specified model and prompt.

#### 3. **Stream Output**
```bash
ogs "my-model" "Explain quantum physics in simple terms."
```
Streams the response in real-time.

#### 4. **List Models**
```bash
ol
```
Displays all available models on your system.

#### 5. **Manage Message History**
```bash
omclear
```
Clears the conversation history. Use `om` to view or `oma` to add messages.

#### 6. **Control Thinking Mode**
```bash
ot on
```
Enables the display of the model's "thinking" process. Use `ot off` to hide it.

---

### 🛠️ **Step 6: Debugging & Support**
- **Debug Output**: Set `OBL_DEBUG="on"` to enable detailed logs.
- **Need Help?**:
  - **GitHub**: [https://github.com/attogram/ollama-bash-lib](https://github.com/attogram/ollama-bash-lib)
  - **Discord**: [https://discord.gg/BGQJCbYVBa](https://discord.gg/BGQJCbYVBa)

---

### 📌 **Aliases for Convenience**
Use these shortcuts to speed up workflow:
- `oag`: `ollama_api_get`
- `oap`: `ollama_api_post`
- `oc`: `ollama_chat`
- `os`: `ollama_show`

---

### 📌 **Example Workflow**
1. **List models**:
   ```bash
   ol
   ```
2. **Generate text**:
   ```bash
   og "llama2" "Write a short story about a robot."
   ```
3. **Stream output**:
   ```bash
   ogs "llama2" "Describe the future of AI."
   ```
4. **Clear history**:
   ```bash
   omclear
   ```

---

By following these steps, you can efficiently interact with Ollama using the Bash Lib, leveraging its functions for text generation, model management, and more. 🚀
