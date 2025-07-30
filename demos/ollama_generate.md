# ollama_generate

A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.1

## Demo

```bash
ollama_generate "qwen3:0.6b" "Describe a rabbit in 2 short sentences"
```
```
<think>
Okay, the user wants me to describe a rabbit in two short sentences. Let me start by thinking about the key features of a rabbit. They're cute and playful, right? So first sentence could mention their friendly nature. Maybe they like to play with toys. Second sentence should highlight their physical characteristics. Maybe their fluffy ears or their ability to navigate. I need to keep it concise but vivid. Let me check if I'm using the correct terms and if it's all in two sentences. Yeah, that should work. Alright, time to put it all together.
</think>

A rabbit is a cute and playful creature with fluffy ears and a curious mind. They enjoy exploring and playing with their surroundings, often chasing toys or exploring quiet spaces.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "qwen3:0.6b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate: [qwen3:0.6b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [qwen3:0.6b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 11 bytes [qwen3:0.6b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"qwen3:0.6b","prompt":"Describe a rabbit in 2 short sentences","stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 2167 bytes
[DEBUG] jq_sanitize: 2167 bytes [{"model":"qwen3:0.6b","created_at":"2025-07-30T10:42:26.729765Z","response":"\u003cthink\u003e
Okay, the user wants me to describe a rabbit in two short sentences. Let me start by thinking about the key features of a rabbit. They are mammals, so they have fur, a nose, and ears. Also, they're social animals, which is a good point to mention. I should include some characteristics like their behavior, maybe their ability to survive in different environments. Oh, and their role in ecosystems. Wait, but how to make it concise? Let me check the example response. They did mention their habitat, maybe the forest or a garden. Also, their adaptability. Let me make sure each sentence covers a different aspect without being too vague. Alright, I think that's it.
\u003c/think\u003e

A rabbit is a small, furry mammal with a bushy tail and round ears, known for its quick agility and social behavior. They thrive in open habitats like forests or gardens, often playing a role in maintaining local ecosystems.","done":true,"done_reason":"stop","context":[151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,151667,198,32313,11,279,1196,6801,752,311,7512,264,38724,304,1378,2805,22870,13,6771,752,1191,553,7274,911,279,1376,4419,315,264,38724,13,2379,525,55569,11,773,807,614,18241,11,264,19142,11,323,24230,13,7281,11,807,2299,3590,9898,11,892,374,264,1661,1459,311,6286,13,358,1265,2924,1045,17452,1075,862,7709,11,7196,862,5726,311,17697,304,2155,21737,13,8670,11,323,862,3476,304,60851,13,13824,11,714,1246,311,1281,432,63594,30,6771,752,1779,279,3110,2033,13,2379,1521,6286,862,38546,11,7196,279,13638,476,264,13551,13,7281,11,862,10515,2897,13,6771,752,1281,2704,1817,11652,14521,264,2155,12893,2041,1660,2238,39046,13,97593,11,358,1744,429,594,432,624,151668,271,32,38724,374,264,2613,11,74419,34941,278,448,264,29673,88,9787,323,4778,24230,11,3881,369,1181,3974,66641,323,3590,7709,13,2379,40872,304,1787,70599,1075,35558,476,35436,11,3545,5619,264,3476,304,20337,2205,60851,13],"total_duration":1854397000,"load_duration":50508542,"prompt_eval_count":16,"prompt_eval_duration":9730291,"eval_count":193,"eval_duration":1793184417}]
[DEBUG] jq_sanitized: return: 0
<think>
Okay, the user wants me to describe a rabbit in two short sentences. Let me start by thinking about the key features of a rabbit. They are mammals, so they have fur, a nose, and ears. Also, they're social animals, which is a good point to mention. I should include some characteristics like their behavior, maybe their ability to survive in different environments. Oh, and their role in ecosystems. Wait, but how to make it concise? Let me check the example response. They did mention their habitat, maybe the forest or a garden. Also, their adaptability. Let me make sure each sentence covers a different aspect without being too vague. Alright, I think that's it.
</think>

A rabbit is a small, furry mammal with a bushy tail and round ears, known for its quick agility and social behavior. They thrive in open habitats like forests or gardens, often playing a role in maintaining local ecosystems.
[DEBUG] ollama_generate_stream_json: return: 0
```
