# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.21

## Demo

```bash
ollama_generate_json "deepseek-r1:8b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"deepseek-r1:8b","created_at":"2025-07-31T23:01:53.056089Z","response":"\u003cthink\u003e\nHmm, the user asked me to describe a rabbit in just two short sentences. That's straightforward but also quite brief - they probably want something concise and maybe even poetic or vivid.\n\nI think I'll focus on common characteristics of rabbits that are universally recognizable: their long ears and soft fur as physical features, and perhaps their gentle nature and burrowing habits as behavioral traits. This should give a complete picture in just two sentences while keeping it natural and flowing.\n\u003c/think\u003e\nA rabbit typically has long ears and soft fur, often with a twitching nose and quick, powerful hind legs built for hopping through fields or burrows.","done":true,"done_reason":"stop","context":[151669,74785,264,38724,304,220,17,2805,22870,151670,151667,198,80022,11,279,1196,4588,752,311,7512,264,38724,304,1101,1378,2805,22870,13,2938,594,30339,714,1083,5008,9814,481,807,4658,1366,2494,63594,323,7196,1496,75434,476,42020,382,40,1744,358,3278,5244,389,4185,17452,315,69144,429,525,60428,65252,25,862,1293,24230,323,8413,18241,438,6961,4419,11,323,8365,862,21700,6993,323,7795,24181,25785,438,35595,24055,13,1096,1265,2968,264,4583,6802,304,1101,1378,22870,1393,10282,432,5810,323,35512,624,151668,198,32,38724,11136,702,1293,24230,323,8413,18241,11,3545,448,264,59413,287,19142,323,3974,11,7988,47319,14201,5798,369,92238,1526,5043,476,7795,1811,13],"total_duration":11995646250,"load_duration":3537917917,"prompt_eval_count":10,"prompt_eval_duration":1055236000,"eval_count":127,"eval_duration":7400586209}
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "deepseek-r1:8b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_json: [deepseek-r1:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 15 bytes [deepseek-r1:8b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"deepseek-r1:8b","prompt":"Descri]
{"model":"deepseek-r1:8b","created_at":"2025-07-31T23:02:07.393597Z","response":"\u003cthink\u003e\nOkay, user wants me to describe a rabbit in just two short sentences. That's interesting - they're being very concise but probably want something vivid and representative of what makes a rabbit unique.\n\nHmm, I should focus on key characteristics that distinguish rabbits from other animals while keeping it brief. First sentence needs to cover the basics - size, ears, fur color. Second sentence can highlight movement or behavior traits since those are more memorable than static features.\n\nUser might be testing my ability to distill information efficiently, or perhaps they need this for a quick reference. The challenge is balancing simplicity with accuracy - not just saying \"small animal with long ears\" but capturing the essence in minimal words. \n\nI wonder if they'd prefer emphasizing domestic vs wild rabbits since those exist as different concepts under the same species name. But sticking to general description seems safer unless specified otherwise.\n\nThe hopping movement and fur color would be good visual elements, while the nose can add behavioral aspect. This covers both appearance and implied actions in just two sentences.\n\u003c/think\u003e\nIt's a small animal with long ears and soft fur, often gray or white. It hops around quickly on its hind legs using its short front paws.","done":true,"done_reason":"stop","context":[151669,74785,264,38724,304,220,17,2805,22870,151670,151667,198,32313,11,1196,6801,752,311,7512,264,38724,304,1101,1378,2805,22870,13,2938,594,7040,481,807,2299,1660,1602,63594,714,4658,1366,2494,42020,323,18239,315,1128,3643,264,38724,4911,382,80022,11,358,1265,5244,389,1376,17452,429,32037,69144,504,1008,9898,1393,10282,432,9814,13,5512,11652,3880,311,3421,279,31774,481,1379,11,24230,11,18241,1894,13,10440,11652,646,11167,7203,476,7709,24055,2474,1846,525,803,32496,1091,1099,4419,382,1474,2578,387,7497,847,5726,311,1582,483,1995,29720,11,476,8365,807,1184,419,369,264,3974,5785,13,576,8645,374,43363,38975,448,13403,481,537,1101,5488,330,9004,9864,448,1293,24230,1,714,39780,279,27491,304,17377,4244,13,4710,40,5775,421,807,4172,10702,80903,12728,6165,8380,69144,2474,1846,3000,438,2155,18940,1212,279,1852,9419,829,13,1988,36972,311,4586,4008,4977,29449,7241,5189,5937,382,785,92238,7203,323,18241,1894,1035,387,1661,9124,5424,11,1393,279,19142,646,912,35595,12893,13,1096,14521,2176,11094,323,6131,6168,304,1101,1378,22870,624,151668,198,2132,594,264,2613,9864,448,1293,24230,323,8413,18241,11,3545,17545,476,4158,13,1084,58118,2163,6157,389,1181,47319,14201,1667,1181,2805,4065,281,8635,13],"total_duration":14269465208,"load_duration":43967041,"prompt_eval_count":10,"prompt_eval_duration":64733375,"eval_count":241,"eval_duration":14160233292}[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

```
