# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.1

## Demo

```bash
ollama_generate_stream_json "gemma3:1b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.541232Z","response":"A","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.555485Z","response":" fluffy","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.569925Z","response":" rabbit","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.58435Z","response":" with","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.598983Z","response":" twitch","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.613639Z","response":"ing","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.628456Z","response":" whiskers","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.643474Z","response":" and","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.658873Z","response":" large","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.674512Z","response":",","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.692519Z","response":" expressive","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.707123Z","response":" eyes","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.722474Z","response":",","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.73777Z","response":" it","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.752693Z","response":" hops","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.767342Z","response":" with","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.781911Z","response":" a","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.796224Z","response":" playful","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.81055Z","response":" and","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.824765Z","response":" gentle","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.839127Z","response":" energy","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.853297Z","response":".","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.867576Z","response":"  ","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.881875Z","response":"Its","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.896061Z","response":" coat","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.910197Z","response":" is","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.92459Z","response":" often","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.939123Z","response":" a","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.953419Z","response":" soft","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.967665Z","response":",","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.98185Z","response":" creamy","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:25.996231Z","response":" white","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.010704Z","response":" or","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.025132Z","response":" pale","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.049837Z","response":" brown","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.064318Z","response":",","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.078453Z","response":" adding","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.092627Z","response":" to","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.106982Z","response":" its","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.121251Z","response":" charming","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.135459Z","response":" appearance","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.149729Z","response":".","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.163982Z","response":"","done":true,"done_reason":"stop","context":[105,2364,107,82858,496,27973,528,236743,236778,2822,23974,106,107,105,4368,107,236776,50704,27973,607,97899,522,175253,532,2455,236764,73296,6114,236764,625,95539,607,496,60902,532,14617,2778,236761,138,34520,15674,563,3187,496,3538,236764,49981,2173,653,24327,8864,236764,8009,531,1061,32219,10086,236761],"total_duration":1769895375,"load_duration":1005649834,"prompt_eval_count":17,"prompt_eval_duration":138877584,"eval_count":43,"eval_duration":623658375}

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "gemma3:1b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream_json: [gemma3:1b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [gemma3:1b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_safe_value: 10 bytes [gemma3:1b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"gemma3:1b","prompt":"Describe a rabbit in 2 short sentences"}]
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.350476Z","response":"A","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.364732Z","response":" fluffy","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.379076Z","response":" rabbit","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.393599Z","response":" with","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.408007Z","response":" large","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.422696Z","response":",","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.437602Z","response":" expressive","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.452498Z","response":" eyes","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.467365Z","response":" hops","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.482537Z","response":" through","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.497937Z","response":" fields","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.513288Z","response":" of","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.528304Z","response":" wildflowers","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.542945Z","response":",","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.557571Z","response":" always","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.572012Z","response":" twitch","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.586346Z","response":"ing","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.611341Z","response":" its","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.625878Z","response":" nose","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.640154Z","response":".","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.654345Z","response":" It","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.668569Z","response":"'","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.682742Z","response":"s","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.696939Z","response":" a","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.711135Z","response":" gentle","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.725458Z","response":" and","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.739697Z","response":" whimsical","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.754029Z","response":" creature","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.768237Z","response":",","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.782761Z","response":" known","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.797224Z","response":" for","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.811514Z","response":" its","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.825807Z","response":" soft","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.840165Z","response":" fur","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.854473Z","response":" and","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.868705Z","response":" playful","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.88303Z","response":" demeanor","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.897318Z","response":".","done":false}
{"model":"gemma3:1b","created_at":"2025-07-30T16:08:26.911543Z","response":"","done":true,"done_reason":"stop","context":[105,2364,107,82858,496,27973,528,236743,236778,2822,23974,106,107,105,4368,107,236776,50704,27973,607,2455,236764,73296,6114,95539,1343,6192,529,120781,236764,2462,97899,522,1061,18410,236761,1030,236789,236751,496,14617,532,119541,33070,236764,3224,573,1061,3538,13969,532,60902,138323,236761],"total_duration":670805083,"load_duration":89979166,"prompt_eval_count":17,"prompt_eval_duration":18930958,"eval_count":39,"eval_duration":561459292}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

[DEBUG] ollama_generate_stream_json: return: 0
```
