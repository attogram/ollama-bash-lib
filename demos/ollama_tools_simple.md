# ollama_tools demo

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.5
## Demo with tools

Tools registered:
datetime	date

--- User Prompt ---
[
  {
    "role": "user",
    "content": "What is the current date and time?"
  }
]
-------------------
--- Model Response (first pass) ---
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-18T21:09:45.310418901Z",
  "message": {
    "role": "assistant",
    "content": "",
    "thinking": "We need to call the datetime function.",
    "tool_calls": [
      {
        "function": {
          "name": "datetime",
          "arguments": {}
        }
      }
    ]
  },
  "done": true,
  "total_duration": 491753380,
  "prompt_eval_count": 126,
  "eval_count": 27
}
-----------------------------------
Tool call detected. Running tools...
Running tool: datetime with args: {}
date: invalid date ‘{}’
Tool result: 
--- Messages with Tool Results ---
[
  {
    "role": "user",
    "content": "What is the current date and time?"
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
