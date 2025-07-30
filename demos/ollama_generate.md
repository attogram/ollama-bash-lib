# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.2

## Demo

```bash
ollama_generate "qwen3:14b" "Describe a rabbit in 2 short sentences"
```
```
<think>
Okay, the user wants me to describe a rabbit in two short sentences. Let me start by thinking about the key characteristics of a rabbit. They have soft fur, long ears, and a fluffy tail. Maybe mention their habitat, like grasslands or forests. Also, their behavior—timid, quick movements, maybe digging burrows.

Wait, the user said two sentences. Need to be concise. First sentence could cover physical appearance and habitat. Second sentence about behavior and traits. Let me check for clarity and brevity. Avoid unnecessary details. Make sure each sentence is a complete thought. Okay, that should work.
</think>

A rabbit is a small, furry mammal with long ears, a slender body, and a short, fluffy tail, often found in grasslands or forests. It moves quickly on soft paws, darting through underbrush to escape predators.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "qwen3:14b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate: [qwen3:14b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [qwen3:14b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_safe_value: 10 bytes [qwen3:14b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"qwen3:14b","prompt":"Describe a rabbit in 2 short sentences","stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 1915 bytes
[DEBUG] jq_sanitize: 1915 bytes [{"model":"qwen3:14b","created_at":"2025-07-30T17:45:44.557999Z","response":"\u003cthink\u003e
Okay, the user wants me to describe a rabbit in two short sentences. Let me start by thinking about the key features of a rabbit. They have soft fur, long ears, and a small body. Maybe mention their habitat, like grasslands or forests. Also, their behavior—timid, quick movements. Need to keep it concise. First sentence could focus on appearance and habitat. Second sentence on behavior and characteristics. Let me check if that covers it without being too wordy. Avoid any technical terms. Make sure it's engaging. Alright, that should work.
\u003c/think\u003e

A rabbit is a small, agile mammal with soft fur, long ears, and a slender body, often found in grasslands or forests. It moves quickly on short legs, relying on speed and burrowing to escape predators.","done":true,"done_reason":"stop","context":[151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,151667,198,32313,11,279,1196,6801,752,311,7512,264,38724,304,1378,2805,22870,13,6771,752,1191,553,7274,911,279,1376,4419,315,264,38724,13,2379,614,8413,18241,11,1293,24230,11,323,264,2613,2487,13,10696,6286,862,38546,11,1075,16359,8166,476,35558,13,7281,11,862,7709,2293,20091,307,11,3974,19029,13,14656,311,2506,432,63594,13,5512,11652,1410,5244,389,11094,323,38546,13,10440,11652,389,7709,323,17452,13,6771,752,1779,421,429,14521,432,2041,1660,2238,3409,88,13,34006,894,10916,3793,13,7405,2704,432,594,22570,13,97593,11,429,1265,975,624,151668,271,32,38724,374,264,2613,11,61465,34941,278,448,8413,18241,11,1293,24230,11,323,264,72242,2487,11,3545,1730,304,16359,8166,476,35558,13,1084,10797,6157,389,2805,14201,11,38561,389,4628,323,7795,24181,311,12449,55117,13],"total_duration":17890950667,"load_duration":64498542,"prompt_eval_count":16,"prompt_eval_duration":105983291,"eval_count":166,"eval_duration":17716969417}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen3:14b","created_at":"2025-07-30T17:45:44.557999Z","response":"\u003cthink\u003e
Okay, the user wants me to describe a rabbit in two short sentences. Let me start by thinking about the key features of a rabbit. They have soft fur, long ears, and a small body. Maybe mention their habitat, like grasslands or forests. Also, their behavior—timid, quick movements. Need to keep it concise. First sentence could focus on appearance and habitat. Second sentence on behavior and characteristics. Let me check if that covers it without being too wordy. Avoid any technical terms. Make sure it's engaging. Alright, that should work.
\u003c/think\u003e

A rabbit is a small, agile mammal with soft fur, long ears, and a slender body, often found in grasslands or forests. It moves quickly on short legs, relying on speed and burrowing to escape predators.","done":true,"done_reason":"stop","context":[151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,151667,198,32313,11,279,1196,6801,752,311,7512,264,38724,304,1378,2805,22870,13,6771,752,1191,553,7274,911,279,1376,4419,315,264,38724,13,2379,614,8413,18241,11,1293,24230,11,323,264,2613,2487,13,10696,6286,862,38546,11,1075,16359,8166,476,35558,13,7281,11,862,7709,2293,20091,307,11,3974,19029,13,14656,311,2506,432,63594,13,5512,11652,1410,5244,389,11094,323,38546,13,10440,11652,389,7709,323,17452,13,6771,752,1779,421,429,14521,432,2041,1660,2238,3409,88,13,34006,894,10916,3793,13,7405,2704,432,594,22570,13,97593,11,429,1265,975,624,151668,271,32,38724,374,264,2613,11,61465,34941,278,448,8413,18241,11,1293,24230,11,323,264,72242,2487,11,3545,1730,304,16359,8166,476,35558,13,1084,10797,6157,389,2805,14201,11,38561,389,4628,323,7795,24181,311,12449,55117,13],"total_duration":17890950667,"load_duration":64498542,"prompt_eval_count":16,"prompt_eval_duration":105983291,"eval_count":166,"eval_duration":17716969417}]
<think>
Okay, the user wants me to describe a rabbit in two short sentences. Let me start by thinking about the key features of a rabbit. They have soft fur, long ears, and a small body. Maybe mention their habitat, like grasslands or forests. Also, their behavior—timid, quick movements. Need to keep it concise. First sentence could focus on appearance and habitat. Second sentence on behavior and characteristics. Let me check if that covers it without being too wordy. Avoid any technical terms. Make sure it's engaging. Alright, that should work.
</think>

A rabbit is a small, agile mammal with soft fur, long ears, and a slender body, often found in grasslands or forests. It moves quickly on short legs, relying on speed and burrowing to escape predators.
[DEBUG] ollama_generate_stream_json: return: 0
```
