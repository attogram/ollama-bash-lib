# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.0

## Demo

```bash
ollama_generate "deepseek-r1:8b" "Describe a rabbit in 2 short sentences"
```
```
<think>
Okay, the user wants me to describe a rabbit in just two short sentences. It's an interestingly concise request - they're looking for something brief but evocative.

I think I'll focus on capturing both physical appearance and behavior aspects since those are the most defining characteristics of rabbits that would help paint a clear picture. For the first sentence, I could emphasize their small size, long ears and fluffy tail to immediately create an image. And for the second sentence, mentioning how they typically move with quick hops or bounces might give movement and life to the description.

The user seems to want something simple and concise - maybe they're looking for a quick reference or just enjoy minimalist descriptions. I'll make sure my response is accessible while still being somewhat poetic and vivid.
</think>
A rabbit often has long ears twitching alertly, a fluffy tail that can be thumped in excitement, and paws ending in small white pads, giving it an overall appearance of softness.

They typically move with quick hops or bounces, capturing their agile nature.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "deepseek-r1:8b" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [deepseek-r1:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [deepseek-r1:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 15 bytes [deepseek-r1:8b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"deepseek-r1:8b","prompt":"Descri]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 3021 bytes
[DEBUG] json_sanitize: 3021 bytes [{"model":"deepseek-r1:8b","created_at":"20]
[DEBUG] json_sanitize: sanitized: 3021 bytes [[{"model":"deepseek-r1:8b","created_at":"20]]
<think>
Okay, user asked to describe a rabbit in just two short sentences. That's a pretty concise request! 

Hmm, they probably want something quick and visual - maybe for a story prompt or a school project? The wording suggests they value brevity but still want key characteristics captured. I should focus on the most iconic rabbit traits.

First sentence needs to establish the basic appearance - long ears are essential! But also need to mention how it moves since that's super bunny-like. Second sentence could cover size and color variety, plus maybe a quick behavioral note about being prey animals.

Wait, is this for children or adults? The neutral tone suggests general audience but not too young. Should avoid childish simplification while keeping it vivid... "nimble feet" sounds more mature than "hopping legs" but still clear.

Better include both wild and domesticated possibilities since user didn't specify. And the long ears thing is universal enough to work without needing examples. 

*checks mental image of rabbits* Yep, these two sentences cover: distinctive features (ears/movement), physical attributes (size/color), and implied nature (quietness). Feels complete but not overwhelming.
</think>
A rabbit typically has long ears and nimble feet for quick movement. They often have a soft grey or white coat and possess a quiet, gentle demeanor.
[DEBUG] ollama_generate: return: 0
```
