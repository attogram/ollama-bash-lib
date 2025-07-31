# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.14

## Demo

```bash
ollama_generate "deepseek-r1:1.5b" "Describe a rabbit in 2 short sentences"
```
```
<think>
Alright, the user wants me to describe a rabbit in two short sentences. Let me start by thinking about what makes a rabbit so unique. Rabbits are known for being social and live in herds, so those should be key points.

I should mention their physical appearance—long ears, soft fur, sleek coat—and then add something about their behavior like burrowing or hopping. Maybe also include why they're adaptable to different environments. 

Putting that together, I can structure the first sentence around their social nature and body features, and the second one on their adaptability and behaviors.
</think>

A一群 rabbits live together in a group called a herds, sharing food, hiding from predators, and building strong bonds with each other. They're social animals who burrow deep into earth to survive.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "deepseek-r1:1.5b" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [deepseek-r1:1.5b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [deepseek-r1:1.5b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 17 bytes [deepseek-r1:1.5b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"deepseek-r1:1.5b","prompt":"Desc]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 2899 bytes
[DEBUG] json_sanitize: 2899 bytes [{"model":"deepseek-r1:1.5b","created_at":"]
[DEBUG] json_sanitize: sanitized: 2899 bytes [[{"model":"deepseek-r1:1.5b","created_at":"]]
<think>
Okay, so I need to describe a rabbit in two short sentences. Let me think about what defines a rabbit. R abit is a small, round creature with four legs and an upper part that's usually smooth or slightly angular, depending on the type. They're often associated with rabbits being slow, liveable pets, and sometimes used as symbols of simplicity.

I should make sure to include key aspects: size, shape, behavior, and maybe some characteristics like fur color or presence of fur. Also, considering they can be found in various environments, including gardens, pens, and even more secluded areas. It's also important that rabbits are often kept for companionship but not necessarily as pets. They might live alone but are usually social.

Now, thinking about the sentences. The first sentence should set the scene—perhaps mentioning how small they are and their characteristics like smooth upper part with four legs. The second sentence could focus on their behavior or presence in specific places, maybe using alliteration for effect.

Let me try to put that together: "A little dwarf rabbit, sleek with rounded eyes, walks gently along a grassy path." That sounds good. It covers size, movement, and place.
</think>

A little dwarf rabbit, sleek with rounded eyes, walks gently along a grassy path.
[DEBUG] ollama_generate: return: 0
```
