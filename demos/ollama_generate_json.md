# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.0

## Demo

```bash
ollama_generate_json "qwen3:8b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"qwen3:8b","created_at":"2025-08-01T21:36:07.4643433Z","response":"\u003cthink\u003e\nOkay, the user wants me to describe a rabbit in two short sentences. Let me start by thinking about the key characteristics of a rabbit. They're small mammals, right? So maybe mention their size and physical features. Also, their behavior—like being prey animals, so they're usually quick and have good hearing. Maybe include something about their fur and movement. Let me make sure each sentence is concise. First sentence could focus on appearance and movement. Second sentence on behavior and habitat. Let me check for clarity and conciseness. Avoid any unnecessary words. Make sure it's two sentences, not more. Alright, that should work.\n\u003c/think\u003e\n\nA rabbit is a small, agile mammal with long ears, a fluffy tail, and nimble legs adapted for quick escapes. It often hops through fields, relying on its keen senses to detect predators and thrive in diverse environments.","done":true,"done_reason":"stop","context":[151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,151667,198,32313,11,279,1196,6801,752,311,7512,264,38724,304,1378,2805,22870,13,6771,752,1191,553,7274,911,279,1376,17452,315,264,38724,13,2379,2299,2613,55569,11,1290,30,2055,7196,6286,862,1379,323,6961,4419,13,7281,11,862,7709,2293,4803,1660,36593,9898,11,773,807,2299,5990,3974,323,614,1661,10778,13,10696,2924,2494,911,862,18241,323,7203,13,6771,752,1281,2704,1817,11652,374,63594,13,5512,11652,1410,5244,389,11094,323,7203,13,10440,11652,389,7709,323,38546,13,6771,752,1779,369,31273,323,3529,23129,433,13,34006,894,25165,4244,13,7405,2704,432,594,1378,22870,11,537,803,13,97593,11,429,1265,975,624,151668,271,32,38724,374,264,2613,11,61465,34941,278,448,1293,24230,11,264,67561,9787,11,323,45692,891,14201,29364,369,3974,65109,13,1084,3545,58118,1526,5043,11,38561,389,1181,26891,37107,311,11140,55117,323,40872,304,16807,21737,13],"total_duration":15402015600,"load_duration":1855668700,"prompt_eval_count":16,"prompt_eval_duration":233184900,"eval_count":180,"eval_duration":13312620700}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "qwen3:8b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [qwen3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 9 bytes [qwen3:8b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"qwen3:8b","prompt":"Describe a r]
{"model":"qwen3:8b","created_at":"2025-08-01T21:36:21.8831814Z","response":"\u003cthink\u003e\nOkay, the user wants me to describe a rabbit in two short sentences. Let me start by thinking about the key characteristics of a rabbit. They have soft fur, long ears, and they hop. Maybe mention their color variations. Also, they're often seen in gardens. Wait, the user might be looking for something concise but vivid. Let me make sure each sentence covers different aspects. First sentence could focus on appearance and movement. Second sentence might talk about their habitat or behavior. Let me check for clarity and brevity. Avoid any unnecessary words. Yeah, that should work.\n\u003c/think\u003e\n\nA rabbit is a small, fluffy mammal with long ears and a quick, hopping gait, often found in gardens and fields. Its soft fur and gentle demeanor make it a symbol of innocence and agility in nature.","done":true,"done_reason":"stop","context":[151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,151667,198,32313,11,279,1196,6801,752,311,7512,264,38724,304,1378,2805,22870,13,6771,752,1191,553,7274,911,279,1376,17452,315,264,38724,13,2379,614,8413,18241,11,1293,24230,11,323,807,7446,13,10696,6286,862,1894,26244,13,7281,11,807,2299,3545,3884,304,35436,13,13824,11,279,1196,2578,387,3330,369,2494,63594,714,42020,13,6771,752,1281,2704,1817,11652,14521,2155,13566,13,5512,11652,1410,5244,389,11094,323,7203,13,10440,11652,2578,3061,911,862,38546,476,7709,13,6771,752,1779,369,31273,323,5282,85,487,13,34006,894,25165,4244,13,21607,11,429,1265,975,624,151668,271,32,38724,374,264,2613,11,67561,34941,278,448,1293,24230,323,264,3974,11,92238,342,1315,11,3545,1730,304,35436,323,5043,13,11445,8413,18241,323,21700,93015,1281,432,264,7735,315,56211,323,66641,304,6993,13],"total_duration":13634155800,"load_duration":20564400,"prompt_eval_count":16,"prompt_eval_duration":72999500,"eval_count":167,"eval_duration":13540591900}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
