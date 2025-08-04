# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.1

## Demo

```bash
ollama_generate "deepseek-r1:8b" "Describe a rabbit in 3 words"
```
```
<think>
Hmm, the user wants me to describe a rabbit in just three words. That's pretty concise! They're probably looking for something poetic or memorable rather than a detailed description.

I should think about what makes rabbits special - their soft appearance, long ears and tails, and hopping movement are all iconic traits. I could go with "soft," "fluffy," and "hopping" to capture their physical characteristics. Or maybe focus on the animal's personality like "gentle," "timid," and "curious."

I think both approaches would work well - either focusing purely on physical attributes or incorporating some behavioral aspects. The user might be trying to create a quick mental image of a rabbit, so I should give them something that paints a vivid picture in three simple words.

"Fluffy little creature" feels descriptive while including "hopping" adds movement and personality. This combination creates an immediate visualization - the first word suggests texture, the second emphasizes small size, and the third highlights their distinctive motion.
</think>
Okay, here are two options for describing a rabbit in 3 words:

1.  **Fluffy, gentle, hopping:** (Focuses on appearance, demeanor, and movement)
2.  **Soft, big-eared, timid:** (Focuses more on physical traits and personality)
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "deepseek-r1:8b" "Describe a rabbit in 3 words"`
```
```
[DEBUG] ollama_generate: [deepseek-r1:8b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: [deepseek-r1:8b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "deepseek-r1:8b",
  "prompt":]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 2795 bytes
<think>
Hmm, the user asked me to describe a rabbit in just three words. That's interesting because rabbits are complex creatures with lots of traits.

I need to think about what makes a rabbit stand out most clearly and concisely to someone who might not know much about them. The query seems simple but could be an icebreaker or creative exercise, maybe testing if I can capture something universal.

Rabbits have several defining characteristics: they're small, furry animals with long ears that are often associated with softness and speed. But in three words only, I need to pick the most iconic ones. "Small," "soft" and "fast" come to mind as a good balance - these cover size, texture and movement without being too specific.

The user might be looking for something fun or relatable, perhaps wanting to spark imagination or get a quick mental image of a rabbit. It's possible they're curious about animals in general or just exploring creative constraints with me.

I should choose words that are accessible and evocative - not technical terms like "herbivore" but everyday language that brings up vivid imagery for most people. This keeps the response inclusive and engaging, especially if it's meant to be playful.
</think>
Small, soft, fast
[DEBUG] ollama_generate: return: 0
```
