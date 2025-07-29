# ollama_generate
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.0

## Demo

```bash
ollama_generate "qwen3:1.7b" "Describe a rabbit in 2 short sentences"
```
```
<think>
Okay, the user wants me to describe a rabbit in two short sentences. Let me start by thinking about the key characteristics of a rabbit. They are small mammals, usually brown or gray in color. They have long ears, which help them hear predators. Also, they are known for their speed and agility.

I need to make sure each sentence is concise. The first sentence could highlight their physical features, like their size, color, and ears. The second sentence might focus on their behavior, such as their speed and how they move. I should avoid any technical terms to keep it simple. Let me check if there's anything else important. Maybe their habitat or typical behavior? But the user didn't specify, so sticking to the main points should be enough. Alright, putting it together now.
</think>

A rabbit is a small, agile mammal with fluffy fur, large ears, and a quick, darting movement, often seen hopping across grassy fields. Its brown or gray coat blends seamlessly with its environment, helping it evade predators.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "qwen3:1.7b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate: [qwen3:1.7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [qwen3:1.7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 11 bytes [qwen3:1.7b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"qwen3:1.7b","prompt":"Describe a rabbit in 2 short sentences","stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 2206 bytes
[DEBUG] jq_sanitize: 2206 bytes [{"model":"qwen3:1.7b","created_at":"2025-07-29T22:25:18.650216Z","response":"\u003cthink\u003e
Okay, the user wants me to describe a rabbit in two short sentences. Let me start by thinking about the key characteristics of a rabbit. They are small mammals, usually brown or gray in color. They have large ears, which help them stay cool. Also, they are known for their speed and agility. Maybe mention their habitat, like grasslands or burrows. Oh, and they are prey animals, so they have a cautious nature. Let me make sure each sentence is concise. First sentence: Highlight their physical traits and habitat. Second sentence: Focus on their behavior and characteristics. Need to keep it simple and clear. Check for any errors. Yeah, that should work.
\u003c/think\u003e

A rabbit is a small, agile mammal with large ears and a brown or gray coat, often found in grasslands or burrows, and it moves swiftly to evade predators. Its keen sense of hearing and cautious nature reflect its role as prey in natural ecosystems.","done":true,"done_reason":"stop","context":[151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,151667,198,32313,11,279,1196,6801,752,311,7512,264,38724,304,1378,2805,22870,13,6771,752,1191,553,7274,911,279,1376,17452,315,264,38724,13,2379,525,2613,55569,11,5990,13876,476,17545,304,1894,13,2379,614,3460,24230,11,892,1492,1105,4717,7010,13,7281,11,807,525,3881,369,862,4628,323,66641,13,10696,6286,862,38546,11,1075,16359,8166,476,7795,1811,13,8670,11,323,807,525,36593,9898,11,773,807,614,264,45778,6993,13,6771,752,1281,2704,1817,11652,374,63594,13,5512,11652,25,55994,862,6961,24055,323,38546,13,10440,11652,25,25806,389,862,7709,323,17452,13,14656,311,2506,432,4285,323,2797,13,4248,369,894,5975,13,21607,11,429,1265,975,624,151668,271,32,38724,374,264,2613,11,61465,34941,278,448,3460,24230,323,264,13876,476,17545,22875,11,3545,1730,304,16359,8166,476,7795,1811,11,323,432,10797,55551,311,76653,55117,13,11445,26891,5530,315,10778,323,45778,6993,8708,1181,3476,438,36593,304,5810,60851,13],"total_duration":3429230916,"load_duration":27781333,"prompt_eval_count":16,"prompt_eval_duration":18770666,"eval_count":195,"eval_duration":3382242459}]
[DEBUG] jq_sanitized: return: 0
<think>
Okay, the user wants me to describe a rabbit in two short sentences. Let me start by thinking about the key characteristics of a rabbit. They are small mammals, usually brown or gray in color. They have large ears, which help them stay cool. Also, they are known for their speed and agility. Maybe mention their habitat, like grasslands or burrows. Oh, and they are prey animals, so they have a cautious nature. Let me make sure each sentence is concise. First sentence: Highlight their physical traits and habitat. Second sentence: Focus on their behavior and characteristics. Need to keep it simple and clear. Check for any errors. Yeah, that should work.
</think>

A rabbit is a small, agile mammal with large ears and a brown or gray coat, often found in grasslands or burrows, and it moves swiftly to evade predators. Its keen sense of hearing and cautious nature reflect its role as prey in natural ecosystems.
[DEBUG] ollama_generate_stream_json: return: 0
```
