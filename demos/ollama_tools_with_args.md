# ollama_tools with args demo

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.2
## Demo with search tool

Tools registered:
search	query=$(echo "$1" | jq -r .query); echo "Searching for: $query"

--- User Prompt ---
[
  {
    "role": "user",
    "content": "Search for 'ollama bash lib'"
  }
]
-------------------
--- Model Response (first pass) ---
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-17T19:25:02.496238619Z",
  "message": {
    "role": "assistant",
    "content": "",
    "thinking": "The user wants to search for 'ollama bash lib'. We need to use the search tool.",
    "tool_calls": [
      {
        "function": {
          "name": "search",
          "arguments": {
            "query": "ollama bash lib"
          }
        }
      }
    ]
  },
  "done": true,
  "total_duration": 663777647,
  "prompt_eval_count": 129,
  "eval_count": 50
}
-----------------------------------
Tool call detected. Running tools...
Running tool: search with args: {
  "query": "ollama bash lib"
}
./../ollama_bash_lib.sh: line 967: query=$(echo "$1" | jq -r .query); echo "Searching for: $query": command not found
Tool result: 
--- Messages with Tool Results ---
[
  {
    "role": "user",
    "content": "Search for 'ollama bash lib'"
  },
  {
    "role": "tool",
    "content": "",
    "tool_call_id": "null"
  }
]
----------------------------------
[ERROR] _call_curl: HTTP error 502: {"error": "upstream error"}
[ERROR] ollama_api_post: curl error: 1
[ERROR] ollama_chat_json: ollama_api_post failed
--- Final Model Response ---
----------------------------
