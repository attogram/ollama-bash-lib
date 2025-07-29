# ollama_generate_stream_json
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.0

## Demo

```bash
ollama_generate_stream_json "granite3.3:2b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.499631Z","response":"R","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.522682Z","response":"ab","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.545375Z","response":"bits","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.567796Z","response":" are","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.590138Z","response":" small","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.61238Z","response":" to","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.63471Z","response":" medium","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.656987Z","response":"-","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.679206Z","response":"sized","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.701584Z","response":" m","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.723983Z","response":"amm","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.746485Z","response":"als","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.768927Z","response":" known","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.79119Z","response":" for","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.813721Z","response":" their","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.83616Z","response":" long","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.858712Z","response":" e","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.881218Z","response":"ars","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.903713Z","response":" and","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.926235Z","response":" fl","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.948649Z","response":"uff","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.971173Z","response":"y","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:35.993701Z","response":" t","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.01628Z","response":"ails","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.039053Z","response":".","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.061579Z","response":" They","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.084206Z","response":" are","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.106821Z","response":" her","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.129415Z","response":"b","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.151929Z","response":"iv","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.174528Z","response":"ores","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.196998Z","response":",","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.219585Z","response":" primarily","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.242124Z","response":" consuming","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.264644Z","response":" gr","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.287182Z","response":"asses","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.309731Z","response":" and","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.332284Z","response":" leaves","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.35477Z","response":",","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.377292Z","response":" and","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.399787Z","response":" are","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.422269Z","response":" re","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.444769Z","response":"nown","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.467299Z","response":"ed","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.489864Z","response":" for","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.512344Z","response":" their","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.535131Z","response":" rapid","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.557876Z","response":" hop","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.580641Z","response":"ping","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.603446Z","response":" ability","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.626284Z","response":".","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.649133Z","response":"","done":true,"done_reason":"stop","context":[49152,2946,49153,39558,390,17071,2821,44,30468,225,36,34,36,38,32,203,4282,884,8080,278,659,30,18909,810,25697,32,2448,884,312,17247,19551,47330,32,0,203,49152,496,49153,8591,312,40810,328,225,36,4504,28842,0,203,49152,17594,49153,68,360,5960,884,5532,372,16538,31,41658,345,38169,3528,8967,436,3623,1946,484,4177,461,2022,2966,107,273,1535,32,11228,884,7791,84,387,6845,30,37897,44097,2914,2515,461,26243,30,461,884,316,2481,318,436,3623,26671,23592,7075,13609,32],"total_duration":2939272834,"load_duration":1456884459,"prompt_eval_count":51,"prompt_eval_duration":330024625,"eval_count":52,"eval_duration":1150457250}

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "granite3.3:2b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream_json: [granite3.3:2b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [granite3.3:2b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_safe_value: 14 bytes [granite3.3:2b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"granite3.3:2b","prompt":"Describe a rabbit in 2 short sentences"}]
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.753507Z","response":"R","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.776749Z","response":"ab","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.80171Z","response":"bits","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.827436Z","response":" are","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.852959Z","response":" small","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.878743Z","response":" m","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.904355Z","response":"amm","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.929913Z","response":"als","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.955978Z","response":" known","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:36.982133Z","response":" for","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.008364Z","response":" their","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.035113Z","response":" long","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.060941Z","response":" e","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.086805Z","response":"ars","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.113063Z","response":" and","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.139618Z","response":" fl","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.166417Z","response":"uff","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.193029Z","response":"y","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.219557Z","response":" t","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.246115Z","response":"ails","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.272258Z","response":",","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.298671Z","response":" often","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.325225Z","response":" character","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.351122Z","response":"ized","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.377074Z","response":" by","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.403229Z","response":" their","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.429482Z","response":" white","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.455761Z","response":" face","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.482045Z","response":" with","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.508149Z","response":" a","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.534265Z","response":" black","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.560474Z","response":" patch","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.586673Z","response":" around","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.612728Z","response":" the","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.638819Z","response":" eyes","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.664962Z","response":".","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.691443Z","response":" They","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.718358Z","response":" are","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.744086Z","response":" her","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.770585Z","response":"b","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.797112Z","response":"iv","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.823797Z","response":"ores","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.850839Z","response":",","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.877039Z","response":" primarily","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.903355Z","response":" feed","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.93026Z","response":"ing","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.956816Z","response":" on","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:37.983281Z","response":" gr","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.009291Z","response":"asses","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.03621Z","response":" and","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.062303Z","response":" leaves","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.088884Z","response":",","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.115504Z","response":" and","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.142137Z","response":" are","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.168769Z","response":" cele","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.195257Z","response":"br","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.221516Z","response":"ated","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.248165Z","response":" for","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.27545Z","response":" their","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.302504Z","response":" ability","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.329097Z","response":" to","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.356808Z","response":" bur","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.384488Z","response":"row","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.41214Z","response":" complex","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.439923Z","response":" bur","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.467394Z","response":"rows","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.494856Z","response":" for","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.521826Z","response":" s","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.548727Z","response":"hel","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.575232Z","response":"ter","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.601767Z","response":".","done":false}
{"model":"granite3.3:2b","created_at":"2025-07-29T22:25:38.628093Z","response":"","done":true,"done_reason":"stop","context":[49152,2946,49153,39558,390,17071,2821,44,30468,225,36,34,36,38,32,203,4282,884,8080,278,659,30,18909,810,25697,32,2448,884,312,17247,19551,47330,32,0,203,49152,496,49153,8591,312,40810,328,225,36,4504,28842,0,203,49152,17594,49153,68,360,5960,884,5532,345,38169,3528,8967,436,3623,1946,484,4177,461,2022,2966,107,273,1535,30,12270,5341,1191,810,3623,8400,8851,623,312,6176,7841,6835,322,31986,32,11228,884,7791,84,387,6845,30,37897,6985,299,544,2914,2515,461,26243,30,461,884,48278,839,733,436,3623,13609,372,23598,643,8640,23598,2138,436,309,2542,391,32],"total_duration":1913737250,"load_duration":15181792,"prompt_eval_count":51,"prompt_eval_duration":22907750,"eval_count":72,"eval_duration":1875049500}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0

[DEBUG] ollama_generate_stream_json: return: 0
```
