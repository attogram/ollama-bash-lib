# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.10

## Demo

```bash
ollama_generate_stream_json "smollm2:1.7b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.374723Z","response":"A","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.398789Z","response":" bunny","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.422956Z","response":" rabbit","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.44737Z","response":" is","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.471418Z","response":" typically","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.495428Z","response":" a","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.518989Z","response":" small","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.543491Z","response":" mammal","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.566983Z","response":" with","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.590565Z","response":" long","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.614245Z","response":" ears","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.637766Z","response":" and","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.661521Z","response":" fur","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.68509Z","response":",","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.708472Z","response":" often","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.732272Z","response":" found","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.755775Z","response":" hopping","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.779452Z","response":" through","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.802913Z","response":" fields","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.827025Z","response":" or","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.850734Z","response":" forests","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.874177Z","response":".","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.897669Z","response":" It","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.921338Z","response":" has","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.945247Z","response":" sharp","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.968746Z","response":" teeth","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:32.9922Z","response":" for","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.015703Z","response":" eating","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.039784Z","response":" plants","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.063393Z","response":" and","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.087298Z","response":" can","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.111309Z","response":" be","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.13515Z","response":" seen","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.158899Z","response":" nib","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.182947Z","response":"bling","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.207712Z","response":" on","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.234579Z","response":" leaves","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.261701Z","response":" or","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.285746Z","response":" carrots","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.309457Z","response":" in","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.333353Z","response":" many","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.357099Z","response":" places","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.380557Z","response":" where","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.404602Z","response":" there","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.428501Z","response":" are","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.452503Z","response":" green","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.476229Z","response":" spaces","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.500195Z","response":".","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.52386Z","response":"","done":true,"done_reason":"stop","context":[1,9690,198,2683,359,253,5356,5646,11173,3365,3511,308,34519,28,7018,411,407,19712,8182,198,1,4093,198,37964,253,16024,281,216,34,1890,8545,2,198,1,520,9531,198,49,41172,16024,314,3431,253,1165,24366,351,986,10006,284,9462,28,1129,983,40808,738,3705,355,6495,30,657,553,7858,4077,327,3801,2109,284,416,325,2269,40703,14967,335,3711,355,18648,281,800,3373,837,665,359,2654,5600,30],"total_duration":3054817500,"load_duration":1660085084,"prompt_eval_count":37,"prompt_eval_duration":242929750,"eval_count":49,"eval_duration":1150011083}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "smollm2:1.7b" "Describe a rabbit in 2 short sentences"
```
```json
[DEBUG] ollama_generate_stream_json: [smollm2:1.7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [smollm2:1.7b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_clean: 13 bytes [smollm2:1.7b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"smollm2:1.7b","prompt":"Describe]
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.66416Z","response":"Rab","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.690677Z","response":"bits","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.71745Z","response":" are","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.742948Z","response":" small","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.768404Z","response":" mammals","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.795522Z","response":" with","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.822274Z","response":" large","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.848902Z","response":" ears","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.87544Z","response":" and","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.902528Z","response":" sharp","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.92932Z","response":" teeth","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.95655Z","response":".","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:33.982911Z","response":" They","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.00923Z","response":" have","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.036151Z","response":" furry","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.063317Z","response":" bodies","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.090505Z","response":" and","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.117205Z","response":" long","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.143863Z","response":" legs","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.170836Z","response":" that","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.196967Z","response":" allow","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.223158Z","response":" them","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.249433Z","response":" to","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.275998Z","response":" hop","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.301547Z","response":" quickly","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.326779Z","response":" through","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.352795Z","response":" their","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.380254Z","response":" natural","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.406803Z","response":" habitat","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.433324Z","response":" of","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.459602Z","response":" forests","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.48637Z","response":" and","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.513365Z","response":" fields","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.539438Z","response":".","done":false}
{"model":"smollm2:1.7b","created_at":"2025-07-31T18:33:34.565063Z","response":"","done":true,"done_reason":"stop","context":[1,9690,198,2683,359,253,5356,5646,11173,3365,3511,308,34519,28,7018,411,407,19712,8182,198,1,4093,198,37964,253,16024,281,216,34,1890,8545,2,198,1,520,9531,198,34750,9229,359,1165,10793,351,1507,10006,284,7858,4077,30,1069,457,31036,4135,284,986,7225,338,1167,601,288,4432,3112,738,480,1782,5981,282,6495,284,3705,30],"total_duration":952949792,"load_duration":26385709,"prompt_eval_count":37,"prompt_eval_duration":24408875,"eval_count":35,"eval_duration":901402791}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream_json: return: 0
```
