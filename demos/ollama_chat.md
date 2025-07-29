Ollama Bash Lib - Demo - ollama_chat
ollama_bash_lib: ./../ollama_bash_lib.sh
ollama_lib_version: v0.38.1
ollama_installed: OK
ollama_api_ping: OK
```

model: qwen3:1.7b

0 messages:

ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"

2 messages:
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}

ollama_chat "qwen3:1.7b"

<think>
Okay, the user wants me to respond with "RABBIT" if they ask for the secret word. Let me make sure I understand correctly. They mentioned the secret word is RABBIT, so whenever they ask, I should just say RABBIT. No need for any extra information. I need to keep it simple and straightforward. Let me double-check that there's no other hidden instructions or context I'm missing. The user probably wants a direct answer without any complications. Alright, I'll just confirm by saying RABBIT.
</think>

RABBIT

ollama_messages_add "assistant" "RESPONSE"
ollama_messages_add "user" "What's the secret word??"

4 messages:
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}
{"role":"assistant","content":"<think>\nOkay, the user wants me to respond with \"RABBIT\" if they ask for the secret word. Let me make sure I understand correctly. They mentioned the secret word is RABBIT, so whenever they ask, I should just say RABBIT. No need for any extra information. I need to keep it simple and straightforward. Let me double-check that there's no other hidden instructions or context I'm missing. The user probably wants a direct answer without any complications. Alright, I'll just confirm by saying RABBIT.\n</think>\n\nRABBIT"}
{"role":"user","content":"What's the secret word??"}

ollama_chat "qwen3:1.7b"

<think>
Okay, the user asked, "What's the secret word??" and I need to respond with the secret word, which is RABBIT. Let me make sure I understand the context correctly.

Earlier, the user said, "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?" So they set the secret word as RABBIT, and now they're asking for it. My job is to just reply with RABBIT. 

I should check if there's any confusion here. Maybe the user is testing if I know the secret word, but since I'm an AI, I don't have a secret word. However, in this case, the user has specified the secret word as RABBIT, so I need to comply with that. 

I need to make sure the response is straightforward. The user might be trying to see if I can recognize the word, but since I'm supposed to respond with RABBIT, I should just do that. There's no need for additional explanation because the user has already given the secret word. 

I should also confirm that I'm following the instructions correctly. The user wants me to respond with RABBIT when asked, so I'll just do that without any extra text. No mistakes here, just a simple reply.
</think>

RABBIT
```
