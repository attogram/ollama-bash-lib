# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.14

## Demo

```bash
ollama_generate_json "qwen3:8b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"qwen3:8b","created_at":"2025-07-31T21:14:52.777794Z","response":"\u003cthink\u003e\nOkay, the user wants me to describe a rabbit in two short sentences. Let me start by thinking about the key characteristics of a rabbit. They're mammals, have long ears, and are known for their agility. Maybe mention their diet, like vegetables. Also, their behavior, such as hopping and being prey animals. I should keep each sentence concise. First sentence could focus on physical traits and behavior. Second sentence might talk about their diet and role in the ecosystem. Let me check if that's clear and within two sentences. Avoid any complex terms. Make sure it's easy to understand. Alright, that should work.\n\u003c/think\u003e\n\nA rabbit is a small, agile mammal known for its long ears, quick movements, and fluffy tail. It primarily feeds on vegetation, using its strong hind legs to hop swiftly through grassy fields.","done":true,"done_reason":"stop","context":[151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,151667,198,32313,11,279,1196,6801,752,311,7512,264,38724,304,1378,2805,22870,13,6771,752,1191,553,7274,911,279,1376,17452,315,264,38724,13,2379,2299,55569,11,614,1293,24230,11,323,525,3881,369,862,66641,13,10696,6286,862,9968,11,1075,23880,13,7281,11,862,7709,11,1741,438,92238,323,1660,36593,9898,13,358,1265,2506,1817,11652,63594,13,5512,11652,1410,5244,389,6961,24055,323,7709,13,10440,11652,2578,3061,911,862,9968,323,3476,304,279,24982,13,6771,752,1779,421,429,594,2797,323,2878,1378,22870,13,34006,894,6351,3793,13,7405,2704,432,594,4135,311,3535,13,97593,11,429,1265,975,624,151668,271,32,38724,374,264,2613,11,61465,34941,278,3881,369,1181,1293,24230,11,3974,19029,11,323,67561,9787,13,1084,15503,34396,389,53732,11,1667,1181,3746,47319,14201,311,7446,55551,1526,16359,88,5043,13],"total_duration":14951418333,"load_duration":3852592458,"prompt_eval_count":16,"prompt_eval_duration":370860333,"eval_count":171,"eval_duration":10726153500}
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
{"model":"qwen3:8b","created_at":"2025-07-31T21:15:03.95528Z","response":"\u003cthink\u003e\nOkay, the user wants me to describe a rabbit in two short sentences. Let me start by thinking about the key characteristics of a rabbit. They have soft fur, long ears, and they hop. Maybe mention their appearance first. Then, their behavior, like being gentle and nocturnal. Wait, are they nocturnal? I think some are more active at night, but not all. Maybe better to say \"often active at dusk or dawn\" to be accurate. Also, include something about their diet, like eating vegetables. Let me check the sentences for clarity and conciseness. First sentence: physical description. Second: behavior and habits. That should cover it.\n\u003c/think\u003e\n\nA rabbit is a small, fluffy mammal with long ears, a short tail, and delicate limbs adapted for hopping. It is known for its gentle nature, quick reflexes, and preference for quiet, vegetative habitats.","done":true,"done_reason":"stop","context":[151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,151667,198,32313,11,279,1196,6801,752,311,7512,264,38724,304,1378,2805,22870,13,6771,752,1191,553,7274,911,279,1376,17452,315,264,38724,13,2379,614,8413,18241,11,1293,24230,11,323,807,7446,13,10696,6286,862,11094,1156,13,5005,11,862,7709,11,1075,1660,21700,323,92001,62450,13,13824,11,525,807,92001,62450,30,358,1744,1045,525,803,4541,518,3729,11,714,537,678,13,10696,2664,311,1977,330,60817,4541,518,92885,476,38393,1,311,387,13382,13,7281,11,2924,2494,911,862,9968,11,1075,12182,23880,13,6771,752,1779,279,22870,369,31273,323,3529,23129,433,13,5512,11652,25,6961,4008,13,10440,25,7709,323,25785,13,2938,1265,3421,432,624,151668,271,32,38724,374,264,2613,11,67561,34941,278,448,1293,24230,11,264,2805,9787,11,323,35201,48595,29364,369,92238,13,1084,374,3881,369,1181,21700,6993,11,3974,32666,288,11,323,21933,369,11340,11,12997,1388,70599,13],"total_duration":11114769709,"load_duration":36694917,"prompt_eval_count":16,"prompt_eval_duration":62332250,"eval_count":185,"eval_duration":11015299250}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
