# ollama_tools demo

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.2
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
  "model": "gpt-oss:120b",
  "created_at": "2025-08-17T19:24:59.527888869Z",
  "message": {
    "role": "assistant",
    "content": "",
    "thinking": "The user asks for current date and time. We have a function to get datetime. We'll call it.",
    "tool_calls": [
      {
        "function": {
          "name": "datetime",
          "arguments": {
            "": {}
          }
        }
      }
    ]
  },
  "done": true,
  "total_duration": 611858816,
  "prompt_eval_count": 126,
  "eval_count": 45
}
-----------------------------------
Tool call detected. Running tools...
Running tool: datetime with args: {
  "": {}
}
date: invalid date ‘{\n  "": {}\n}’
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
