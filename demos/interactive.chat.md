spawn ./interactive.chat.sh
# ollama_chat interactive

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.21

```
ollama_chat with model: qwen3:8b

Press Control-C exit and view message history

>>> The secret word is RABBIT. Understand?

3 words describing Bash
<think>
Okay, the user said the secret word is RABBIT and asked if I understand. Let me think about how to respond. Since the user provided a secret word, maybe they want me to acknowledge it or use it in some way. But I need to make sure I'm not revealing any secrets or violating any rules. The user might be testing if I remember the secret word, so I should confirm that I understand it. However, I should also keep the response friendly and open-ended in case there's more to the conversation. Let me check if there's any specific context I'm missing. No, it seems straightforward. I'll respond by confirming the secret word and offer further assistance if needed.
</think>

Yes, I understand the secret word is **RABBIT**. Let me know if you need help with anything! ð

>>> 
What is the secret word?
^C
```
Control-C shutdown

4 Messages:
```json
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. Understand?"}
{"role":"assistant","content":"<think>\nOkay, the user said the secret word is RABBIT and asked if I understand. Let me think about how to respond. Since the user provided a secret word, maybe they want me to acknowledge it or use it in some way. But I need to make sure I'm not revealing any secrets or violating any rules. The user might be testing if I remember the secret word, so I should confirm that I understand it. However, I should also keep the response friendly and open-ended in case there's more to the conversation. Let me check if there's any specific context I'm missing. No, it seems straightforward. I'll respond by confirming the secret word and offer further assistance if needed.\n</think>\n\nYes, I understand the secret word is **RABBIT**. Let me know if you need help with anything! ð"}
{"role":"user","content":"3 words describing Bash"}
```
