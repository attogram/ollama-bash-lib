# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.18

## Demo

```bash
ollama_generate "deepseek-r1:8b" "Describe a rabbit in 2 short sentences"
```
```
<think>
The user asked for a description of a rabbit in just two short sentences, which means they want something concise and to the point. I need to provide a brief overview that highlights key features without going into too much detail.

From what I know about rabbits, they're small mammals with long ears, soft fur, and are often seen as cute or gentle creatures. This description should be neutral and appealing since many people find them adorable, but it shouldn't assume any specific context unless asked.

I'll keep the response simple: mention their size, appearance, and behavior to cover the essentials in a fun way.
</think>
A small rabbit typically has long ears and soft fur that can range from white to brown. It usually hops around on four legs and may be found nibbling on plants or vegetables for food.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "deepseek-r1:8b" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [deepseek-r1:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [deepseek-r1:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "deepseek-r1:8b",
  "prompt":]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 2708 bytes
[DEBUG] json_sanitize: 2708 bytes [{"model":"deepseek-r1:8b","created_at":"20]
[DEBUG] json_sanitize: sanitized: 2708 bytes [[{"model":"deepseek-r1:8b","created_at":"20]]
<think>
Okay, the user wants me to describe a rabbit in just two short sentences. Let me think about what makes rabbits distinctive enough for this concise description while still being accurate and engaging.

I should focus on key physical features that define rabbits - their long ears are definitely important as they're one of their most recognizable traits. Then I need something else, perhaps their body shape or movement patterns would work well too. 

For the first sentence about appearance, I'll mention those long ears along with some other distinguishing characteristics like whiskers and fur color to give a vivid picture. The second sentence could focus on how they move since that's another iconic rabbit trait - their hopping gait is unmistakable.

This seems like something simple enough for an AI assistant to handle. Since the user didn't specify any particular type of rabbit, I'll keep it general but accurate. A two-sentence format works well here and allows me to be creative with vivid imagery while staying concise.
</think>
A rabbit typically has long ears, whiskers, and a soft fur coat in colors like white or brown. It moves on its hind legs through quick hops, sometimes called a 'gallop'.
[DEBUG] ollama_generate: return: 0
```
