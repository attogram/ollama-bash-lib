spawn ./interactive.chat.sh
# ollama_chat interactive
[6n
A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.24

```
ollama_chat with model: gemma3n:e4b

Press Control-C exit and view message history

>>> The secret word is RABBIT. Understand?

Yes, I understand! The secret word is **RABBIT**. 

Got it! 😊 

Is there anything you'd like me to do with that information? Do you want me to:

* **Remember it?** (I will!)
* **Use it in a sentence?**
* **Try to find words related to it?**
* **Something else?** 

Just let me know!

>>> 3 words describing Bash

Okay, here are 3 words to describe Bash:

1. **Powerful:** Bash is a very capable shell, able to automate complex tasks.
2. **Flexible:** It's highly customizable and adaptable to different needs.
3. **Ubiquitous:** Bash is widely available on Unix-like systems, making it a common tool.

>>> What is the secret word?

The secret word is **RABBIT**. 

I remember! 😊 

Why do you ask? Is there a game or something?

>>> 
```
Control-C shutdown

7 Messages:
```json
[
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. Understand?"}
{"role":"assistant","content":"Yes, I understand! The secret word is **RABBIT**. \n\nGot it! 😊 \n\nIs there anything you'd like me to do with that information? Do you want me to:\n\n* **Remember it?** (I will!)\n* **Use it in a sentence?**\n* **Try to find words related to it?**\n* **Something else?** \n\nJust let me know!"}
{"role":"user","content":"3 words describing Bash"}
{"role":"assistant","content":"Okay, here are 3 words to describe Bash:\n\n1. **Powerful:** Bash is a very capable shell, able to automate complex tasks.\n2. **Flexible:** It's highly customizable and adaptable to different needs.\n3. **Ubiquitous:** Bash is widely available on Unix-like systems, making it a common tool."}
{"role":"user","content":"What is the secret word?"}
{"role":"assistant","content":"The secret word is **RABBIT**. \n\nI remember! 😊 \n\nWhy do you ask? Is there a game or something?"}
]
```
