# ollama_generate_stream
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.38.1

## Demo

```bash
ollama_generate_stream "llama3.2:1b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is a small, furry mammal with a distinctive long ears and a twitching nose, often seen hopping around on its hind legs. Rabbits have soft, thick fur that comes in various colors and patterns, including gray, white, black, and brown, making them one of the most recognizable animals in the world.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "llama3.2:1b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream: [llama3.2:1b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [llama3.2:1b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_safe_value: 12 bytes [llama3.2:1b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"llama3.2:1b","prompt":"Describe a rabbit in 2 short sentences"}]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] jq_sanitize: 95 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.095889Z","response":"A","done":false}]
A[DEBUG] jq_sanitize: 101 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.113259Z","response":" rabbit","done":false}]
 rabbit[DEBUG] jq_sanitize: 97 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.130911Z","response":" is","done":false}]
 is[DEBUG] jq_sanitize: 96 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.148157Z","response":" a","done":false}]
 a[DEBUG] jq_sanitize: 100 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.165649Z","response":" small","done":false}]
 small[DEBUG] jq_sanitize: 95 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.183846Z","response":",","done":false}]
,[DEBUG] jq_sanitize: 99 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.202653Z","response":" herb","done":false}]
 herb[DEBUG] jq_sanitize: 96 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.223198Z","response":"iv","done":false}]
iv[DEBUG] jq_sanitize: 99 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.242641Z","response":"orous","done":false}]
orous[DEBUG] jq_sanitize: 99 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.260354Z","response":" mamm","done":false}]
 mamm[DEBUG] jq_sanitize: 96 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.277611Z","response":"al","done":false}]
al[DEBUG] jq_sanitize: 99 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.294604Z","response":" with","done":false}]
 with[DEBUG] jq_sanitize: 96 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.311505Z","response":" a","done":false}]
 a[DEBUG] jq_sanitize: 102 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.328325Z","response":" compact","done":false}]
 compact[DEBUG] jq_sanitize: 99 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.345055Z","response":" body","done":false}]
 body[DEBUG] jq_sanitize: 95 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.361733Z","response":",","done":false}]
,[DEBUG] jq_sanitize: 99 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.378498Z","response":" long","done":false}]
 long[DEBUG] jq_sanitize: 99 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.395277Z","response":" ears","done":false}]
 ears[DEBUG] jq_sanitize: 95 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.412052Z","response":",","done":false}]
,[DEBUG] jq_sanitize: 98 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.428657Z","response":" and","done":false}]
 and[DEBUG] jq_sanitize: 99 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.445398Z","response":" soft","done":false}]
 soft[DEBUG] jq_sanitize: 95 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.462053Z","response":",","done":false}]
,[DEBUG] jq_sanitize: 101 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.478747Z","response":" fluffy","done":false}]
 fluffy[DEBUG] jq_sanitize: 98 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.495407Z","response":" fur","done":false}]
 fur[DEBUG] jq_sanitize: 99 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.512251Z","response":" that","done":false}]
 that[DEBUG] jq_sanitize: 100 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.528895Z","response":" comes","done":false}]
 comes[DEBUG] jq_sanitize: 97 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.545692Z","response":" in","done":false}]
 in[DEBUG] jq_sanitize: 102 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.562371Z","response":" various","done":false}]
 various[DEBUG] jq_sanitize: 101 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.579113Z","response":" colors","done":false}]
 colors[DEBUG] jq_sanitize: 98 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.596021Z","response":" and","done":false}]
 and[DEBUG] jq_sanitize: 103 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.612694Z","response":" patterns","done":false}]
 patterns[DEBUG] jq_sanitize: 95 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.629815Z","response":".","done":false}]
.[DEBUG] jq_sanitize: 98 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.646594Z","response":" Rab","done":false}]
 Rab[DEBUG] jq_sanitize: 98 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.663331Z","response":"bits","done":false}]
bits[DEBUG] jq_sanitize: 97 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.67999Z","response":" are","done":false}]
 are[DEBUG] jq_sanitize: 98 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.6968Z","response":" known","done":false}]
 known[DEBUG] jq_sanitize: 98 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.713661Z","response":" for","done":false}]
 for[DEBUG] jq_sanitize: 100 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.730474Z","response":" their","done":false}]
 their[DEBUG] jq_sanitize: 101 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.747224Z","response":" gentle","done":false}]
 gentle[DEBUG] jq_sanitize: 101 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.764034Z","response":" nature","done":false}]
 nature[DEBUG] jq_sanitize: 95 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.780837Z","response":",","done":false}]
,[DEBUG] jq_sanitize: 100 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.797573Z","response":" rapid","done":false}]
 rapid[DEBUG] jq_sanitize: 104 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.814353Z","response":" movements","done":false}]
 movements[DEBUG] jq_sanitize: 95 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.831441Z","response":",","done":false}]
,[DEBUG] jq_sanitize: 98 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.848533Z","response":" and","done":false}]
 and[DEBUG] jq_sanitize: 106 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.865206Z","response":" distinctive","done":false}]
 distinctive[DEBUG] jq_sanitize: 101 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.881934Z","response":" twitch","done":false}]
 twitch[DEBUG] jq_sanitize: 97 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.898599Z","response":"ing","done":false}]
ing[DEBUG] jq_sanitize: 100 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.915367Z","response":" noses","done":false}]
 noses[DEBUG] jq_sanitize: 97 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.932012Z","response":" as","done":false}]
 as[DEBUG] jq_sanitize: 98 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.94914Z","response":" they","done":false}]
 they[DEBUG] jq_sanitize: 98 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.969152Z","response":" nib","done":false}]
 nib[DEBUG] jq_sanitize: 97 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:37.986692Z","response":"ble","done":false}]
ble[DEBUG] jq_sanitize: 97 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:38.003669Z","response":" on","done":false}]
 on[DEBUG] jq_sanitize: 101 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:38.021026Z","response":" plants","done":false}]
 plants[DEBUG] jq_sanitize: 98 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:38.038814Z","response":" and","done":false}]
 and[DEBUG] jq_sanitize: 100 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:38.055984Z","response":" other","done":false}]
 other[DEBUG] jq_sanitize: 105 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:38.073113Z","response":" vegetation","done":false}]
 vegetation[DEBUG] jq_sanitize: 95 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:38.090022Z","response":".","done":false}]
.[DEBUG] jq_sanitize: 721 bytes [{"model":"llama3.2:1b","created_at":"2025-07-29T18:47:38.106825Z","response":"","done":true,"done_reason":"stop","context":[128006,9125,128007,271,38766,1303,33025,2696,25,6790,220,2366,18,271,128009,128006,882,128007,271,75885,264,39824,304,220,17,2875,23719,128009,128006,78191,128007,271,32,39824,374,264,2678,11,39999,344,20857,36041,278,449,264,17251,2547,11,1317,25212,11,323,8579,11,68661,18742,430,4131,304,5370,8146,323,12912,13,36824,11777,527,3967,369,872,22443,7138,11,11295,19567,11,323,35947,60513,287,97814,439,814,31385,901,389,11012,323,1023,54832,13],"total_duration":1099936416,"load_duration":66451375,"prompt_eval_count":33,"prompt_eval_duration":21159125,"eval_count":60,"eval_duration":1011789375}]

[DEBUG] ollama_generate_stream: return: 0
```
