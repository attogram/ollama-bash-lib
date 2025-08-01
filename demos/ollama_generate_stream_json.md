# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.0

## Demo

```bash
ollama_generate_stream_json "qwen3:8b" "Describe a rabbit in 2 short sentences"
```
```json
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:42.9872176Z","response":"\u003cthink\u003e","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:43.0572742Z","response":"\n","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:43.1259575Z","response":"Okay","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:43.194784Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:43.2636852Z","response":" the","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:43.3334552Z","response":" user","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:43.4020063Z","response":" wants","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:43.4696989Z","response":" me","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:43.5372369Z","response":" to","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:43.604626Z","response":" describe","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:43.6717287Z","response":" a","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:43.7394774Z","response":" rabbit","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:43.8073538Z","response":" in","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:43.8742968Z","response":" two","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:43.9416219Z","response":" short","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:44.0097464Z","response":" sentences","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:44.07811Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:44.1457371Z","response":" Let","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:44.2124389Z","response":" me","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:44.2802577Z","response":" start","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:44.3483416Z","response":" by","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:44.4148875Z","response":" thinking","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:44.4832641Z","response":" about","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:44.5498068Z","response":" the","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:44.6178133Z","response":" key","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:44.6850358Z","response":" characteristics","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:44.7519974Z","response":" of","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:44.8203804Z","response":" a","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:44.8873524Z","response":" rabbit","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:44.9542032Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:45.025312Z","response":" They","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:45.0995852Z","response":"'re","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:45.1723652Z","response":" mammals","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:45.2437449Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:45.3154926Z","response":" have","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:45.3881663Z","response":" long","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:45.460268Z","response":" ears","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:45.5319827Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:45.60379Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:45.6761631Z","response":" are","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:45.7493073Z","response":" known","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:45.8219218Z","response":" for","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:45.8975041Z","response":" their","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:45.9711066Z","response":" agility","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:46.0465449Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:46.1203597Z","response":" Maybe","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:46.1957499Z","response":" mention","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:46.2711357Z","response":" their","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:46.3457743Z","response":" diet","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:46.4219564Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:46.4960048Z","response":" like","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:46.5718415Z","response":" eating","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:46.6476623Z","response":" vegetables","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:46.7239076Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:46.7992854Z","response":" Also","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:46.8749042Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:46.9547493Z","response":" their","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:47.037407Z","response":" behavior","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:47.1175251Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:47.197016Z","response":" such","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:47.2768632Z","response":" as","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:47.3566046Z","response":" being","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:47.4381269Z","response":" social","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:47.5197005Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:47.6008168Z","response":" having","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:47.6806557Z","response":" a","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:47.7612665Z","response":" quick","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:47.8422728Z","response":" escape","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:47.9231518Z","response":" mechanism","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:48.0042131Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:48.0865349Z","response":" I","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:48.1684777Z","response":" need","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:48.2502515Z","response":" to","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:48.3309943Z","response":" keep","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:48.4110668Z","response":" each","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:48.4920856Z","response":" sentence","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:48.5717542Z","response":" concise","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:48.6522686Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:48.7339674Z","response":" First","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:48.8146607Z","response":" sentence","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:48.8953502Z","response":" could","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:48.9772118Z","response":" focus","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:49.0604354Z","response":" on","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:49.1437905Z","response":" physical","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:49.2272027Z","response":" traits","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:49.3100141Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:49.3918212Z","response":" behavior","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:49.4735359Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:49.5565603Z","response":" Second","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:49.6389212Z","response":" sentence","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:49.7196428Z","response":" might","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:49.8018774Z","response":" talk","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:49.8847506Z","response":" about","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:49.9672147Z","response":" their","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:50.0510684Z","response":" habitat","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:50.1344272Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:50.2166227Z","response":" diet","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:50.2986646Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:50.3806492Z","response":" Let","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:50.4629651Z","response":" me","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:50.546599Z","response":" check","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:50.6291922Z","response":" if","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:50.7112139Z","response":" that","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:50.7925978Z","response":"'s","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:50.8733595Z","response":" accurate","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:50.9543217Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:51.0359656Z","response":" Rab","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:51.1177211Z","response":"bits","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:51.2001052Z","response":" do","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:51.2815276Z","response":" live","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:51.3634877Z","response":" in","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:51.4457788Z","response":" bur","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:51.5265775Z","response":"rows","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:51.6079955Z","response":" or","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:51.690233Z","response":" war","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:51.7715868Z","response":"rens","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:51.8532299Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:51.9344503Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:52.014632Z","response":" they","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:52.0957295Z","response":" are","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:52.1779343Z","response":" herb","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:52.2599442Z","response":"iv","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:52.3410666Z","response":"ores","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:52.4226089Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:52.5034883Z","response":" Yeah","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:52.5849407Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:52.6673058Z","response":" that","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:52.7489187Z","response":" works","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:52.8336214Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:52.9174061Z","response":" Let","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:52.9998894Z","response":" me","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:53.0844157Z","response":" put","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:53.1675609Z","response":" it","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:53.2511689Z","response":" together","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:53.3351379Z","response":" clearly","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:53.4166532Z","response":".\n","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:53.5003563Z","response":"\u003c/think\u003e","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:53.5819298Z","response":"\n\n","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:53.6646739Z","response":"A","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:53.747079Z","response":" rabbit","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:53.8303539Z","response":" is","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:53.9137272Z","response":" a","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:53.9962021Z","response":" small","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:54.078108Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:54.1608442Z","response":" agile","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:54.24437Z","response":" mamm","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:54.3301396Z","response":"al","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:54.4130184Z","response":" known","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:54.4932461Z","response":" for","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:54.574593Z","response":" its","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:54.6572696Z","response":" long","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:54.740223Z","response":" ears","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:54.8221671Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:54.9054633Z","response":" quick","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:54.9892657Z","response":" movements","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:55.0747953Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:55.156041Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:55.2393641Z","response":" fluffy","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:55.3227489Z","response":" tail","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:55.4046086Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:55.4877415Z","response":" It","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:55.5681337Z","response":" typically","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:55.6485342Z","response":" inhab","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:55.7309793Z","response":"its","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:55.8124368Z","response":" grass","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:55.8939384Z","response":"y","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:55.9765551Z","response":" areas","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:56.0587859Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:56.1398501Z","response":" bur","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:56.223231Z","response":"rows","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:56.3054317Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:56.3870781Z","response":" or","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:56.469674Z","response":" forests","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:56.5530315Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:56.6348327Z","response":" feeding","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:56.7158103Z","response":" on","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:56.7968931Z","response":" vegetation","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:56.8786826Z","response":" like","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:56.9606363Z","response":" grass","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:57.0450043Z","response":"es","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:57.1268119Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:57.2087826Z","response":" vegetables","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:57.2903657Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:57.3718606Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:57.4542482Z","response":" clo","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:57.5352835Z","response":"ver","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:57.6188735Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:57.7008097Z","response":"","done":true,"done_reason":"stop","context":[151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,151667,198,32313,11,279,1196,6801,752,311,7512,264,38724,304,1378,2805,22870,13,6771,752,1191,553,7274,911,279,1376,17452,315,264,38724,13,2379,2299,55569,11,614,1293,24230,11,323,525,3881,369,862,66641,13,10696,6286,862,9968,11,1075,12182,23880,13,7281,11,862,7709,11,1741,438,1660,3590,323,3432,264,3974,12449,16953,13,358,1184,311,2506,1817,11652,63594,13,5512,11652,1410,5244,389,6961,24055,323,7709,13,10440,11652,2578,3061,911,862,38546,323,9968,13,6771,752,1779,421,429,594,13382,13,35724,11516,653,3887,304,7795,1811,476,4116,77340,11,323,807,525,38899,344,4589,13,21607,11,429,4278,13,6771,752,2182,432,3786,9355,624,151668,271,32,38724,374,264,2613,11,61465,34941,278,3881,369,1181,1293,24230,11,3974,19029,11,323,67561,9787,13,1084,11136,25252,1199,16359,88,5671,11,7795,1811,11,476,35558,11,24991,389,53732,1075,16359,288,11,23880,11,323,5292,423,13],"total_duration":15117045400,"load_duration":22157200,"prompt_eval_count":16,"prompt_eval_duration":379276900,"eval_count":188,"eval_duration":14715080100}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "qwen3:8b" "Describe a rabbit in 2 short sentences"
```
```json
[DEBUG] ollama_generate_stream_json: [qwen3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [qwen3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_clean: 9 bytes [qwen3:8b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"qwen3:8b","prompt":"Describe a r]
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:58.5962001Z","response":"\u003cthink\u003e","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:58.6767832Z","response":"\n","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:58.7591747Z","response":"Okay","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:58.8400415Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:58.9202249Z","response":" the","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:59.0016436Z","response":" user","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:59.0818432Z","response":" wants","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:59.1637132Z","response":" me","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:59.245176Z","response":" to","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:59.3265886Z","response":" describe","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:59.4081213Z","response":" a","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:59.4880116Z","response":" rabbit","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:59.5696459Z","response":" in","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:59.6503031Z","response":" two","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:59.7331822Z","response":" short","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:59.8131346Z","response":" sentences","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:59.8938943Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:43:59.9751247Z","response":" Let","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:00.0578865Z","response":" me","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:00.1391767Z","response":" start","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:00.2205269Z","response":" by","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:00.3012662Z","response":" thinking","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:00.3812216Z","response":" about","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:00.4611862Z","response":" the","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:00.5415706Z","response":" key","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:00.6226641Z","response":" characteristics","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:00.7033303Z","response":" of","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:00.7852992Z","response":" a","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:00.865404Z","response":" rabbit","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:00.9462942Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:01.0281459Z","response":" They","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:01.1074269Z","response":"'re","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:01.1900599Z","response":" mammals","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:01.2732976Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:01.3564023Z","response":" have","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:01.4384882Z","response":" long","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:01.5213744Z","response":" ears","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:01.6044467Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:01.6878385Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:01.7699823Z","response":" are","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:01.8528746Z","response":" known","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:01.9356817Z","response":" for","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:02.0185585Z","response":" their","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:02.1001839Z","response":" quick","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:02.1827861Z","response":" movements","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:02.2657745Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:02.3486571Z","response":" Maybe","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:02.4323036Z","response":" mention","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:02.5143224Z","response":" their","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:02.5979663Z","response":" fur","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:02.6805324Z","response":" color","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:02.762159Z","response":" variations","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:02.8448537Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:02.9284906Z","response":" Also","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:03.0100952Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:03.0903511Z","response":" they","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:03.1706809Z","response":"'re","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:03.2523918Z","response":" often","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:03.333262Z","response":" associated","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:03.4137095Z","response":" with","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:03.4954831Z","response":" being","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:03.5777952Z","response":" cute","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:03.6584226Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:03.7395349Z","response":" gentle","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:03.819789Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:03.9045417Z","response":" I","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:03.9862163Z","response":" should","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:04.0662529Z","response":" make","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:04.1477508Z","response":" sure","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:04.2295773Z","response":" each","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:04.3114393Z","response":" sentence","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:04.3935405Z","response":" is","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:04.4749279Z","response":" concise","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:04.5555381Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:04.6372703Z","response":" First","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:04.7184473Z","response":" sentence","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:04.8000425Z","response":" could","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:04.8803716Z","response":" focus","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:04.9608372Z","response":" on","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:05.0450277Z","response":" physical","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:05.1253994Z","response":" appearance","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:05.2069376Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:05.2908851Z","response":" behavior","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:05.3733622Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:05.4552992Z","response":" Second","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:05.5380555Z","response":" sentence","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:05.6208556Z","response":" might","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:05.7023818Z","response":" talk","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:05.7857398Z","response":" about","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:05.8677947Z","response":" their","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:05.9508266Z","response":" habitat","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:06.033634Z","response":" or","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:06.1167438Z","response":" habits","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:06.1983435Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:06.281555Z","response":" Let","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:06.3630408Z","response":" me","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:06.4445364Z","response":" check","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:06.5272836Z","response":" for","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:06.6106607Z","response":" clarity","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:06.6916927Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:06.7732857Z","response":" bre","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:06.8549387Z","response":"v","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:06.9364318Z","response":"ity","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:07.0182115Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:07.1008475Z","response":" Avoid","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:07.1833839Z","response":" any","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:07.2660763Z","response":" unnecessary","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:07.3506876Z","response":" words","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:07.4327898Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:07.5163034Z","response":" Maybe","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:07.5990259Z","response":" something","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:07.6826618Z","response":" like","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:07.7656219Z","response":":","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:07.8502563Z","response":" \"","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:07.933218Z","response":"A","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:08.0151458Z","response":" rabbit","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:08.0988895Z","response":" is","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:08.1818239Z","response":" a","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:08.265467Z","response":" small","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:08.3494517Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:08.4316704Z","response":" fluffy","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:08.5138558Z","response":" mamm","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:08.596265Z","response":"al","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:08.6786143Z","response":" with","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:08.7617196Z","response":" long","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:08.8445905Z","response":" ears","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:08.9273898Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:09.0094164Z","response":" quick","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:09.0911498Z","response":" movements","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:09.1720441Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:09.254433Z","response":" often","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:09.3371198Z","response":" found","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:09.418732Z","response":" hopping","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:09.5014326Z","response":" through","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:09.5829832Z","response":" fields","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:09.6643059Z","response":".\"","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:09.7468137Z","response":" Then","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:09.8293245Z","response":" the","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:09.9113445Z","response":" second","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:09.9948436Z","response":" sentence","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:10.0788303Z","response":" could","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:10.1624086Z","response":" be","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:10.2444072Z","response":" about","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:10.3281443Z","response":" their","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:10.4099151Z","response":" diet","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:10.4929238Z","response":" or","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:10.578427Z","response":" role","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:10.661629Z","response":" in","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:10.7441258Z","response":" the","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:10.8273183Z","response":" ecosystem","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:10.9103765Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:10.992305Z","response":" \"","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:11.0753359Z","response":"They","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:11.1576109Z","response":" are","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:11.2397147Z","response":" herb","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:11.3225345Z","response":"iv","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:11.4056734Z","response":"ores","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:11.486623Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:11.5693329Z","response":" feeding","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:11.6496987Z","response":" on","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:11.7321439Z","response":" grass","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:11.815295Z","response":"es","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:11.8967878Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:11.9802865Z","response":" vegetables","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:12.0646241Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:12.145878Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:12.2277302Z","response":" are","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:12.3090205Z","response":" known","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:12.3914914Z","response":" for","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:12.4727134Z","response":" their","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:12.5537974Z","response":" gentle","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:12.6352643Z","response":" nature","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:12.7161265Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:12.7983931Z","response":" alert","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:12.8808164Z","response":"ness","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:12.9621591Z","response":".\"","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:13.0467996Z","response":" Wait","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:13.1296412Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:13.2118394Z","response":" that","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:13.2929919Z","response":"'s","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:13.3754013Z","response":" two","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:13.4574185Z","response":" sentences","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:13.5399783Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:13.6221374Z","response":" Let","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:13.7039831Z","response":" me","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:13.7863456Z","response":" make","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:13.86772Z","response":" sure","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:13.9505505Z","response":" they","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:14.0345578Z","response":"'re","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:14.1171018Z","response":" both","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:14.1986091Z","response":" short","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:14.2810643Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:14.3628472Z","response":" cover","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:14.4453035Z","response":" different","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:14.5276248Z","response":" aspects","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:14.6086215Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:14.6910191Z","response":" Alternatively","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:14.7721982Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:14.8545667Z","response":" maybe","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:14.9364817Z","response":" mention","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:15.0182004Z","response":" their","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:15.1001595Z","response":" role","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:15.1828467Z","response":" in","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:15.2657683Z","response":" folklore","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:15.3493657Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:15.4328829Z","response":" Hmm","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:15.5141043Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:15.5971326Z","response":" the","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:15.6792801Z","response":" user","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:15.7629209Z","response":" might","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:15.8443971Z","response":" want","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:15.9278492Z","response":" a","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:16.0104295Z","response":" simple","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:16.0923475Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:16.1737375Z","response":" straightforward","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:16.2563267Z","response":" description","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:16.3377677Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:16.4206658Z","response":" Let","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:16.5032264Z","response":" me","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:16.5856864Z","response":" finalize","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:16.6679345Z","response":" the","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:16.7497652Z","response":" two","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:16.830925Z","response":" sentences","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:16.912464Z","response":".\n","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:16.9941334Z","response":"\u003c/think\u003e","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:17.077099Z","response":"\n\n","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:17.1617867Z","response":"A","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:17.2436447Z","response":" rabbit","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:17.3262128Z","response":" is","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:17.4074099Z","response":" a","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:17.488053Z","response":" small","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:17.5692655Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:17.6499936Z","response":" fluffy","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:17.730727Z","response":" mamm","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:17.8120002Z","response":"al","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:17.8919348Z","response":" with","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:17.9727747Z","response":" long","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:18.0575468Z","response":" ears","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:18.1385698Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:18.2196774Z","response":" quick","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:18.3017022Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:18.3831554Z","response":" graceful","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:18.465202Z","response":" movements","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:18.5466966Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:18.62927Z","response":" often","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:18.7102891Z","response":" seen","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:18.7928313Z","response":" hopping","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:18.8741711Z","response":" through","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:18.9558186Z","response":" fields","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:19.0421154Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:19.1230239Z","response":" It","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:19.2021969Z","response":" has","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:19.2784491Z","response":" a","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:19.3552986Z","response":" soft","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:19.4321197Z","response":",","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:19.5095426Z","response":" varied","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:19.5852376Z","response":" coat","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:19.6610331Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:19.7367632Z","response":" is","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:19.8116293Z","response":" known","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:19.8876852Z","response":" for","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:19.9633654Z","response":" its","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:20.0427759Z","response":" gentle","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:20.1216613Z","response":" nature","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:20.1974112Z","response":" and","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:20.2732153Z","response":" alert","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:20.3496647Z","response":"ness","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:20.4255555Z","response":".","done":false}
{"model":"qwen3:8b","created_at":"2025-08-01T21:44:20.5007275Z","response":"","done":true,"done_reason":"stop","context":[151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,151667,198,32313,11,279,1196,6801,752,311,7512,264,38724,304,1378,2805,22870,13,6771,752,1191,553,7274,911,279,1376,17452,315,264,38724,13,2379,2299,55569,11,614,1293,24230,11,323,525,3881,369,862,3974,19029,13,10696,6286,862,18241,1894,26244,13,7281,11,807,2299,3545,5815,448,1660,18838,323,21700,13,358,1265,1281,2704,1817,11652,374,63594,13,5512,11652,1410,5244,389,6961,11094,323,7709,13,10440,11652,2578,3061,911,862,38546,476,25785,13,6771,752,1779,369,31273,323,5282,85,487,13,34006,894,25165,4244,13,10696,2494,1075,25,330,32,38724,374,264,2613,11,67561,34941,278,448,1293,24230,323,3974,19029,11,3545,1730,92238,1526,5043,1189,5005,279,2086,11652,1410,387,911,862,9968,476,3476,304,279,24982,13,330,6865,525,38899,344,4589,11,24991,389,16359,288,323,23880,11,323,525,3881,369,862,21700,6993,323,5115,2090,1189,13824,11,429,594,1378,22870,13,6771,752,1281,2704,807,2299,2176,2805,323,3421,2155,13566,13,38478,11,7196,6286,862,3476,304,97869,13,88190,11,279,1196,2578,1366,264,4285,11,30339,4008,13,6771,752,54090,279,1378,22870,624,151668,271,32,38724,374,264,2613,11,67561,34941,278,448,1293,24230,323,3974,11,77362,19029,11,3545,3884,92238,1526,5043,13,1084,702,264,8413,11,27730,22875,323,374,3881,369,1181,21700,6993,323,5115,2090,13],"total_duration":22008719500,"load_duration":22882700,"prompt_eval_count":16,"prompt_eval_duration":80590900,"eval_count":269,"eval_duration":21905245900}
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream_json: return: 0
```
