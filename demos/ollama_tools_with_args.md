# ollama_tools with args demo

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.3
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
  "created_at": "2025-08-18T20:56:43.228957185Z",
  "message": {
    "role": "assistant",
    "content": "",
    "thinking": "The user wants to search for 'ollama bash lib'. Use the search function.",
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
  "total_duration": 621045148,
  "prompt_eval_count": 129,
  "eval_count": 47
}
-----------------------------------
Tool call detected. Running tools...
Running tool: search with args: {
  "query": "ollama bash lib"
}
./../ollama_bash_lib.sh: line 965: query=$(echo "$1" | jq -r .query); echo "Searching for: $query": command not found
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
