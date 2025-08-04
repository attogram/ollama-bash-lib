# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.1

## Demo

```bash
ollama_generate "qwen3:8b" "Describe a rabbit in 3 words"
```
```
<think>
Okay, the user wants me to describe a rabbit in three words. Let me think about the key characteristics of a rabbit. They're known for being fluffy, right? So "fluffy" could work. Then, they're usually gentle and quiet, so maybe "gentle" or "quiet." Wait, but the user might be looking for more vivid words. Let me consider other adjectives. "Timid" comes to mind because rabbits are often seen as shy. But maybe "playful" is better since they can be energetic. Alternatively, "nimble" for their quick movements. Hmm. Let me check common descriptors. "Soft" might also fit because of their fur. But I need three words that capture different aspects. Maybe "fluffy, gentle, quick"? Or "soft, timid, agile." Wait, the user might prefer more poetic terms. Let me think again. "Fluffy," "gentle," and "curious" could work. Or "soft," "timid," "nimble." I should pick the most commonly associated traits. "Fluffy," "gentle," and "playful" might be a good combination. Let me confirm if these words are accurate. Yes, rabbits are fluffy, gentle, and playful. That should cover it.
</think>

Fluffy, gentle, playful.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "qwen3:8b" "Describe a rabbit in 3 words"`
```
```
[DEBUG] ollama_generate: [qwen3:8b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: [qwen3:8b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "qwen3:8b",
  "prompt": "Desc]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 1859 bytes
<think>
Okay, the user wants me to describe a rabbit in three words. Let me think about the key characteristics of a rabbit. They're known for their soft fur, so maybe "soft-furred" is a good start. Then, they have long ears, so "long-eared" could work. Lastly, rabbits are often associated with being gentle or timid, so "gentle" might fit. Let me check if these words are concise and capture the essence. Alternatively, maybe "nimble" instead of gentle? Wait, the user might want more specific traits. Let me make sure each word is distinct and accurate. Soft-furred, long-eared, gentle. Yeah, that seems to cover appearance and temperament. I think that's a solid answer.
</think>

Soft-furred, long-eared, gentle.
[DEBUG] ollama_generate: return: 0
```
