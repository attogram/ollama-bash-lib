# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.4

## Demo

```bash
ollama_generate "deepseek-r1:8b" "Describe a rabbit in 2 short sentences"
```
```
<think>
First, the user asked me to describe a rabbit in just two short sentences. That means I need to be concise and capture the essence of what makes a rabbit unique without overwhelming them with details.<br>
I should focus on key features that are instantly recognizable: their long ears for hearing and alertness, soft fur which is iconic, and their general appearance like being small and fluffy.<br>
Beyond the surface request, they might be seeking something simple yet engaging—perhaps to spark curiosity or use this in a quick educational context. <br>
Deeper down, people often want connections to nature or animals; rabbits symbolize innocence and playfulness, so highlighting that could address an unspoken need for comfort or light-heartedness.<br>
Finally, I'll structure my response with two sentences: one on physical traits and another on behavior, keeping it vivid and fun to match the query's brevity.
</think>
A rabbit is known for its long ears swiveling alertly atop a soft, fluffy body. These small mammals typically have twitching noses and powerful hind legs built for quick bursts of speed.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "deepseek-r1:8b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate: [deepseek-r1:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [deepseek-r1:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 15 bytes [deepseek-r1:8b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"deepseek-r1:8b","prompt":"Descri]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 2074 bytes
[DEBUG] jq_sanitize: 2074 bytes [{"model":"deepseek-r1:8b","created_at":"20]
[DEBUG] jq_sanitize: sanitized: 2074 bytes [[{"model":"deepseek-r1:8b","created_at":"20]]
<think>
The user asked to describe a rabbit in two very short sentences, so they're looking for something concise and to the point. Probably not a detailed essay but a quick summary that captures the essence of what makes a rabbit unique.

I need to focus on key characteristics: rabbits are small, furry mammals known for their long ears and tail, and they hop as a primary mode of movement. That should cover most aspects in just two sentences without overwhelming details.

Deeper down, the user might be seeking simplicity or clarity—perhaps testing my ability to summarize effectively, or wanting something easy to remember for teaching kids or writing a story. I'll ensure my response is accurate and engaging while keeping it brief.
</think>
A rabbit is a small, furry mammal typically known for its long ears and short tail. It primarily moves by hopping on its strong hind legs.
[DEBUG] ollama_generate_stream_json: return: 0
```
