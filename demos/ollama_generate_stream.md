# ollama_generate_stream

A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.1

## Demo

```bash
ollama_generate_stream "qwen3:4b" "Describe a rabbit in 2 short sentences"
```
```
<think>Okay, the user wants me to describe a rabbit in two short sentences. Let me start by recalling the key features of a rabbit. They have long ears, fluffy fur, and are usually soft and cute. I should mention their size, maybe their habitat, and their behavior. Also, I need to keep each sentence concise.First sentence: Maybe start with physical characteristics. "A rabbit is a small, soft-furred mammal with long ears and a twitching nose, often found in grassy areas." That covers appearance and habitat.Second sentence: Focus on behavior and maybe their diet. "It is known for its quick movements, gentle nature, and preference for eating plants and vegetables." That includes movement, temperament, and diet. Let me check if that's two sentences. Yes. Does it cover all necessary points? Maybe add something about their eyes? But the user said short sentences, so perhaps that's enough. I think that works.</think>A rabbit is a small, soft-furred mammal with long ears and a twitching nose, often found in grassy areas. It is known for its quick movements, gentle nature, and preference for eating plants and vegetables.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "qwen3:4b" "Describe a rabbit in 2 short sentences"`
```
```json
[DEBUG] ollama_generate_stream: [qwen3:4b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [qwen3:4b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] json_safe_value: 9 bytes [qwen3:4b]
[DEBUG] json_safe_value: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"qwen3:4b","prompt":"Describe a rabbit in 2 short sentences"}]
[DEBUG] jq_sanitize: 108 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.262763Z","response":"\u003cthink\u003e","done":false}]
[DEBUG] jq_sanitized: return: 0
<think>[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.29796Z","response":"
","done":false}]
[DEBUG] jq_sanitized: return: 0
[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.333711Z","response":"Okay","done":false}]
[DEBUG] jq_sanitized: return: 0
Okay[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.369458Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.405006Z","response":" the","done":false}]
[DEBUG] jq_sanitized: return: 0
 the[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.440095Z","response":" user","done":false}]
[DEBUG] jq_sanitized: return: 0
 user[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.475047Z","response":" wants","done":false}]
[DEBUG] jq_sanitized: return: 0
 wants[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.509952Z","response":" me","done":false}]
[DEBUG] jq_sanitized: return: 0
 me[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.544662Z","response":" to","done":false}]
[DEBUG] jq_sanitized: return: 0
 to[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.579249Z","response":" describe","done":false}]
[DEBUG] jq_sanitized: return: 0
 describe[DEBUG] jq_sanitize: 93 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.614145Z","response":" a","done":false}]
[DEBUG] jq_sanitized: return: 0
 a[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.649008Z","response":" rabbit","done":false}]
[DEBUG] jq_sanitized: return: 0
 rabbit[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.683956Z","response":" in","done":false}]
[DEBUG] jq_sanitized: return: 0
 in[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.718817Z","response":" two","done":false}]
[DEBUG] jq_sanitized: return: 0
 two[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.753717Z","response":" short","done":false}]
[DEBUG] jq_sanitized: return: 0
 short[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.788599Z","response":" sentences","done":false}]
[DEBUG] jq_sanitized: return: 0
 sentences[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.823519Z","response":".","done":false}]
[DEBUG] jq_sanitized: return: 0
.[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.85874Z","response":" Let","done":false}]
[DEBUG] jq_sanitized: return: 0
 Let[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.893943Z","response":" me","done":false}]
[DEBUG] jq_sanitized: return: 0
 me[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.929117Z","response":" start","done":false}]
[DEBUG] jq_sanitized: return: 0
 start[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.964445Z","response":" by","done":false}]
[DEBUG] jq_sanitized: return: 0
 by[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:13.999907Z","response":" recalling","done":false}]
[DEBUG] jq_sanitized: return: 0
 recalling[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.035342Z","response":" the","done":false}]
[DEBUG] jq_sanitized: return: 0
 the[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.070701Z","response":" key","done":false}]
[DEBUG] jq_sanitized: return: 0
 key[DEBUG] jq_sanitize: 107 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.105917Z","response":" characteristics","done":false}]
[DEBUG] jq_sanitized: return: 0
 characteristics[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.141115Z","response":" of","done":false}]
[DEBUG] jq_sanitized: return: 0
 of[DEBUG] jq_sanitize: 93 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.176413Z","response":" a","done":false}]
[DEBUG] jq_sanitized: return: 0
 a[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.211956Z","response":" rabbit","done":false}]
[DEBUG] jq_sanitized: return: 0
 rabbit[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.247296Z","response":".","done":false}]
[DEBUG] jq_sanitized: return: 0
.[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.282481Z","response":" They","done":false}]
[DEBUG] jq_sanitized: return: 0
 They[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.317618Z","response":" have","done":false}]
[DEBUG] jq_sanitized: return: 0
 have[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.352843Z","response":" long","done":false}]
[DEBUG] jq_sanitized: return: 0
 long[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.387997Z","response":" ears","done":false}]
[DEBUG] jq_sanitized: return: 0
 ears[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.423147Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.458252Z","response":" fluffy","done":false}]
[DEBUG] jq_sanitized: return: 0
 fluffy[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.493407Z","response":" fur","done":false}]
[DEBUG] jq_sanitized: return: 0
 fur[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.528669Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.563786Z","response":" and","done":false}]
[DEBUG] jq_sanitized: return: 0
 and[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.59897Z","response":" are","done":false}]
[DEBUG] jq_sanitized: return: 0
 are[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.634067Z","response":" usually","done":false}]
[DEBUG] jq_sanitized: return: 0
 usually[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.669233Z","response":" soft","done":false}]
[DEBUG] jq_sanitized: return: 0
 soft[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.704408Z","response":" and","done":false}]
[DEBUG] jq_sanitized: return: 0
 and[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.739619Z","response":" round","done":false}]
[DEBUG] jq_sanitized: return: 0
 round[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.774749Z","response":".","done":false}]
[DEBUG] jq_sanitized: return: 0
.[DEBUG] jq_sanitize: 93 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.809905Z","response":" I","done":false}]
[DEBUG] jq_sanitized: return: 0
 I[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.84508Z","response":" should","done":false}]
[DEBUG] jq_sanitized: return: 0
 should[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.880323Z","response":" mention","done":false}]
[DEBUG] jq_sanitized: return: 0
 mention[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.915481Z","response":" their","done":false}]
[DEBUG] jq_sanitized: return: 0
 their[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.950757Z","response":" color","done":false}]
[DEBUG] jq_sanitized: return: 0
 color[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:14.986314Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.021823Z","response":" maybe","done":false}]
[DEBUG] jq_sanitized: return: 0
 maybe[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.057424Z","response":" different","done":false}]
[DEBUG] jq_sanitized: return: 0
 different[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.092938Z","response":" shades","done":false}]
[DEBUG] jq_sanitized: return: 0
 shades[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.128408Z","response":" like","done":false}]
[DEBUG] jq_sanitized: return: 0
 like[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.163876Z","response":" brown","done":false}]
[DEBUG] jq_sanitized: return: 0
 brown[DEBUG] jq_sanitize: 91 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.19948Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.235031Z","response":" white","done":false}]
[DEBUG] jq_sanitized: return: 0
 white[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.270548Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.306042Z","response":" or","done":false}]
[DEBUG] jq_sanitized: return: 0
 or[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.341491Z","response":" gray","done":false}]
[DEBUG] jq_sanitized: return: 0
 gray[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.376893Z","response":".","done":false}]
[DEBUG] jq_sanitized: return: 0
.[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.412326Z","response":" Also","done":false}]
[DEBUG] jq_sanitized: return: 0
 Also[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.447754Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.483198Z","response":" their","done":false}]
[DEBUG] jq_sanitized: return: 0
 their[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.518674Z","response":" behavior","done":false}]
[DEBUG] jq_sanitized: return: 0
 behavior[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.554194Z","response":"—","done":false}]
[DEBUG] jq_sanitized: return: 0
—[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.589646Z","response":"like","done":false}]
[DEBUG] jq_sanitized: return: 0
like[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.625109Z","response":" hopping","done":false}]
[DEBUG] jq_sanitized: return: 0
 hopping[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.660585Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.696025Z","response":" being","done":false}]
[DEBUG] jq_sanitized: return: 0
 being[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.73147Z","response":" cautious","done":false}]
[DEBUG] jq_sanitized: return: 0
 cautious[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.766865Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.802283Z","response":" or","done":false}]
[DEBUG] jq_sanitized: return: 0
 or[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.837731Z","response":" having","done":false}]
[DEBUG] jq_sanitized: return: 0
 having[DEBUG] jq_sanitize: 93 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.873185Z","response":" a","done":false}]
[DEBUG] jq_sanitized: return: 0
 a[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.908638Z","response":" gentle","done":false}]
[DEBUG] jq_sanitized: return: 0
 gentle[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.944226Z","response":" nature","done":false}]
[DEBUG] jq_sanitized: return: 0
 nature[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:15.979771Z","response":".","done":false}]
[DEBUG] jq_sanitized: return: 0
.[DEBUG] jq_sanitize: 93 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.015522Z","response":" I","done":false}]
[DEBUG] jq_sanitized: return: 0
 I[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.050797Z","response":" need","done":false}]
[DEBUG] jq_sanitized: return: 0
 need[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.086465Z","response":" to","done":false}]
[DEBUG] jq_sanitized: return: 0
 to[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.122082Z","response":" keep","done":false}]
[DEBUG] jq_sanitized: return: 0
 keep[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.157757Z","response":" each","done":false}]
[DEBUG] jq_sanitized: return: 0
 each[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.19336Z","response":" sentence","done":false}]
[DEBUG] jq_sanitized: return: 0
 sentence[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.228931Z","response":" concise","done":false}]
[DEBUG] jq_sanitized: return: 0
 concise[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.264627Z","response":".","done":false}]
[DEBUG] jq_sanitized: return: 0
.[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.300258Z","response":" First","done":false}]
[DEBUG] jq_sanitized: return: 0
 First[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.335854Z","response":" sentence","done":false}]
[DEBUG] jq_sanitized: return: 0
 sentence[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.371428Z","response":" could","done":false}]
[DEBUG] jq_sanitized: return: 0
 could[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.406975Z","response":" focus","done":false}]
[DEBUG] jq_sanitized: return: 0
 focus[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.442565Z","response":" on","done":false}]
[DEBUG] jq_sanitized: return: 0
 on[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.478196Z","response":" physical","done":false}]
[DEBUG] jq_sanitized: return: 0
 physical[DEBUG] jq_sanitize: 102 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.513762Z","response":" appearance","done":false}]
[DEBUG] jq_sanitized: return: 0
 appearance[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.549343Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.584922Z","response":" second","done":false}]
[DEBUG] jq_sanitized: return: 0
 second[DEBUG] jq_sanitize: 93 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.62058Z","response":" on","done":false}]
[DEBUG] jq_sanitized: return: 0
 on[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.656167Z","response":" behavior","done":false}]
[DEBUG] jq_sanitized: return: 0
 behavior[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.691765Z","response":" and","done":false}]
[DEBUG] jq_sanitized: return: 0
 and[DEBUG] jq_sanitize: 103 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.727349Z","response":" personality","done":false}]
[DEBUG] jq_sanitized: return: 0
 personality[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.762897Z","response":".","done":false}]
[DEBUG] jq_sanitized: return: 0
.[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.798504Z","response":" Let","done":false}]
[DEBUG] jq_sanitized: return: 0
 Let[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.834067Z","response":" me","done":false}]
[DEBUG] jq_sanitized: return: 0
 me[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.869653Z","response":" check","done":false}]
[DEBUG] jq_sanitized: return: 0
 check[DEBUG] jq_sanitize: 93 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.90523Z","response":" if","done":false}]
[DEBUG] jq_sanitized: return: 0
 if[DEBUG] jq_sanitize: 93 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.941136Z","response":" I","done":false}]
[DEBUG] jq_sanitized: return: 0
 I[DEBUG] jq_sanitize: 93 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:16.976709Z","response":"'m","done":false}]
[DEBUG] jq_sanitized: return: 0
'm[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.014628Z","response":" covering","done":false}]
[DEBUG] jq_sanitized: return: 0
 covering[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.052306Z","response":" all","done":false}]
[DEBUG] jq_sanitized: return: 0
 all[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.087984Z","response":" the","done":false}]
[DEBUG] jq_sanitized: return: 0
 the[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.123571Z","response":" main","done":false}]
[DEBUG] jq_sanitized: return: 0
 main[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.159091Z","response":" points","done":false}]
[DEBUG] jq_sanitized: return: 0
 points[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.194658Z","response":" without","done":false}]
[DEBUG] jq_sanitized: return: 0
 without[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.23018Z","response":" being","done":false}]
[DEBUG] jq_sanitized: return: 0
 being[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.266117Z","response":" too","done":false}]
[DEBUG] jq_sanitized: return: 0
 too[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.301986Z","response":" word","done":false}]
[DEBUG] jq_sanitized: return: 0
 word[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.337861Z","response":"y","done":false}]
[DEBUG] jq_sanitized: return: 0
y[DEBUG] jq_sanitize: 91 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.37372Z","response":".","done":false}]
[DEBUG] jq_sanitized: return: 0
.[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.409595Z","response":" Maybe","done":false}]
[DEBUG] jq_sanitized: return: 0
 Maybe[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.445481Z","response":" something","done":false}]
[DEBUG] jq_sanitized: return: 0
 something[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.481322Z","response":" like","done":false}]
[DEBUG] jq_sanitized: return: 0
 like[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.517213Z","response":":","done":false}]
[DEBUG] jq_sanitized: return: 0
:[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.553006Z","response":" \"","done":false}]
[DEBUG] jq_sanitized: return: 0
 "[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.588902Z","response":"A","done":false}]
[DEBUG] jq_sanitized: return: 0
A[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.624777Z","response":" rabbit","done":false}]
[DEBUG] jq_sanitized: return: 0
 rabbit[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.660656Z","response":" has","done":false}]
[DEBUG] jq_sanitized: return: 0
 has[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.696516Z","response":" soft","done":false}]
[DEBUG] jq_sanitized: return: 0
 soft[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.732423Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.768325Z","response":" fluffy","done":false}]
[DEBUG] jq_sanitized: return: 0
 fluffy[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.804181Z","response":" fur","done":false}]
[DEBUG] jq_sanitized: return: 0
 fur[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.840065Z","response":" and","done":false}]
[DEBUG] jq_sanitized: return: 0
 and[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.875987Z","response":" long","done":false}]
[DEBUG] jq_sanitized: return: 0
 long[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.911875Z","response":" ears","done":false}]
[DEBUG] jq_sanitized: return: 0
 ears[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.947996Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:17.983881Z","response":" often","done":false}]
[DEBUG] jq_sanitized: return: 0
 often[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.019788Z","response":" sporting","done":false}]
[DEBUG] jq_sanitized: return: 0
 sporting[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.05583Z","response":" a","done":false}]
[DEBUG] jq_sanitized: return: 0
 a[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.091673Z","response":" variety","done":false}]
[DEBUG] jq_sanitized: return: 0
 variety[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.127528Z","response":" of","done":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] jq_sanitized: return: 0
 of[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.163388Z","response":" colors","done":false}]
[DEBUG] jq_sanitized: return: 0
 colors[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.199275Z","response":" like","done":false}]
[DEBUG] jq_sanitized: return: 0
 like[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.235217Z","response":" brown","done":false}]
[DEBUG] jq_sanitized: return: 0
 brown[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.271033Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.306948Z","response":" white","done":false}]
[DEBUG] jq_sanitized: return: 0
 white[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.342846Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.378759Z","response":" or","done":false}]
[DEBUG] jq_sanitized: return: 0
 or[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.414823Z","response":" gray","done":false}]
[DEBUG] jq_sanitized: return: 0
 gray[DEBUG] jq_sanitize: 90 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.4509Z","response":".","done":false}]
[DEBUG] jq_sanitized: return: 0
.[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.487049Z","response":" They","done":false}]
[DEBUG] jq_sanitized: return: 0
 They[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.523258Z","response":" are","done":false}]
[DEBUG] jq_sanitized: return: 0
 are[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.559465Z","response":" gentle","done":false}]
[DEBUG] jq_sanitized: return: 0
 gentle[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.595653Z","response":" creatures","done":false}]
[DEBUG] jq_sanitized: return: 0
 creatures[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.631843Z","response":" known","done":false}]
[DEBUG] jq_sanitized: return: 0
 known[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.668069Z","response":" for","done":false}]
[DEBUG] jq_sanitized: return: 0
 for[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.704116Z","response":" their","done":false}]
[DEBUG] jq_sanitized: return: 0
 their[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.740175Z","response":" quick","done":false}]
[DEBUG] jq_sanitized: return: 0
 quick[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.776389Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.812482Z","response":" hopping","done":false}]
[DEBUG] jq_sanitized: return: 0
 hopping[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.848649Z","response":" movements","done":false}]
[DEBUG] jq_sanitized: return: 0
 movements[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.884757Z","response":" and","done":false}]
[DEBUG] jq_sanitized: return: 0
 and[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.92087Z","response":" cautious","done":false}]
[DEBUG] jq_sanitized: return: 0
 cautious[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.957286Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:18.993355Z","response":" curious","done":false}]
[DEBUG] jq_sanitized: return: 0
 curious[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.029642Z","response":" nature","done":false}]
[DEBUG] jq_sanitized: return: 0
 nature[DEBUG] jq_sanitize: 93 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.06588Z","response":".\"","done":false}]
[DEBUG] jq_sanitized: return: 0
."[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.101959Z","response":" That","done":false}]
[DEBUG] jq_sanitized: return: 0
 That[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.138041Z","response":" seems","done":false}]
[DEBUG] jq_sanitized: return: 0
 seems[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.174109Z","response":" to","done":false}]
[DEBUG] jq_sanitized: return: 0
 to[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.210228Z","response":" cover","done":false}]
[DEBUG] jq_sanitized: return: 0
 cover[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.246397Z","response":" it","done":false}]
[DEBUG] jq_sanitized: return: 0
 it[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.282526Z","response":".","done":false}]
[DEBUG] jq_sanitized: return: 0
.[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.318618Z","response":" Let","done":false}]
[DEBUG] jq_sanitized: return: 0
 Let[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.354699Z","response":" me","done":false}]
[DEBUG] jq_sanitized: return: 0
 me[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.391722Z","response":" make","done":false}]
[DEBUG] jq_sanitized: return: 0
 make[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.428346Z","response":" sure","done":false}]
[DEBUG] jq_sanitized: return: 0
 sure[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.46508Z","response":" each","done":false}]
[DEBUG] jq_sanitized: return: 0
 each[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.501885Z","response":" sentence","done":false}]
[DEBUG] jq_sanitized: return: 0
 sentence[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.538932Z","response":" is","done":false}]
[DEBUG] jq_sanitized: return: 0
 is[DEBUG] jq_sanitize: 93 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.576071Z","response":" a","done":false}]
[DEBUG] jq_sanitized: return: 0
 a[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.613337Z","response":" complete","done":false}]
[DEBUG] jq_sanitized: return: 0
 complete[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.650574Z","response":" thought","done":false}]
[DEBUG] jq_sanitized: return: 0
 thought[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.687977Z","response":" and","done":false}]
[DEBUG] jq_sanitized: return: 0
 and[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.725295Z","response":" not","done":false}]
[DEBUG] jq_sanitized: return: 0
 not[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.762837Z","response":" too","done":false}]
[DEBUG] jq_sanitized: return: 0
 too[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.8003Z","response":" long","done":false}]
[DEBUG] jq_sanitized: return: 0
 long[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.837604Z","response":".","done":false}]
[DEBUG] jq_sanitized: return: 0
.[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.874924Z","response":" Yeah","done":false}]
[DEBUG] jq_sanitized: return: 0
 Yeah[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.912378Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.950104Z","response":" that","done":false}]
[DEBUG] jq_sanitized: return: 0
 that[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:19.987715Z","response":" works","done":false}]
[DEBUG] jq_sanitized: return: 0
 works[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.025745Z","response":".
","done":false}]
[DEBUG] jq_sanitized: return: 0
.[DEBUG] jq_sanitize: 109 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.063087Z","response":"\u003c/think\u003e","done":false}]
[DEBUG] jq_sanitized: return: 0
</think>[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.100689Z","response":"

","done":false}]
[DEBUG] jq_sanitized: return: 0
[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.138122Z","response":"A","done":false}]
[DEBUG] jq_sanitized: return: 0
A[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.175667Z","response":" rabbit","done":false}]
[DEBUG] jq_sanitized: return: 0
 rabbit[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.213133Z","response":" has","done":false}]
[DEBUG] jq_sanitized: return: 0
 has[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.250592Z","response":" soft","done":false}]
[DEBUG] jq_sanitized: return: 0
 soft[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.287938Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.325403Z","response":" fluffy","done":false}]
[DEBUG] jq_sanitized: return: 0
 fluffy[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.362907Z","response":" fur","done":false}]
[DEBUG] jq_sanitized: return: 0
 fur[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.400265Z","response":" and","done":false}]
[DEBUG] jq_sanitized: return: 0
 and[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.437656Z","response":" long","done":false}]
[DEBUG] jq_sanitized: return: 0
 long[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.475065Z","response":" ears","done":false}]
[DEBUG] jq_sanitized: return: 0
 ears[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.512338Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.549853Z","response":" often","done":false}]
[DEBUG] jq_sanitized: return: 0
 often[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.587129Z","response":" sporting","done":false}]
[DEBUG] jq_sanitized: return: 0
 sporting[DEBUG] jq_sanitize: 93 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.624457Z","response":" a","done":false}]
[DEBUG] jq_sanitized: return: 0
 a[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.661725Z","response":" variety","done":false}]
[DEBUG] jq_sanitized: return: 0
 variety[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.699006Z","response":" of","done":false}]
[DEBUG] jq_sanitized: return: 0
 of[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.736563Z","response":" colors","done":false}]
[DEBUG] jq_sanitized: return: 0
 colors[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.773975Z","response":" like","done":false}]
[DEBUG] jq_sanitized: return: 0
 like[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.811659Z","response":" brown","done":false}]
[DEBUG] jq_sanitized: return: 0
 brown[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.849144Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.886857Z","response":" white","done":false}]
[DEBUG] jq_sanitized: return: 0
 white[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.924329Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:20.962357Z","response":" or","done":false}]
[DEBUG] jq_sanitized: return: 0
 or[DEBUG] jq_sanitize: 96 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.000447Z","response":" gray","done":false}]
[DEBUG] jq_sanitized: return: 0
 gray[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.039146Z","response":".","done":false}]
[DEBUG] jq_sanitized: return: 0
.[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.07788Z","response":" They","done":false}]
[DEBUG] jq_sanitized: return: 0
 They[DEBUG] jq_sanitize: 94 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.11556Z","response":" are","done":false}]
[DEBUG] jq_sanitized: return: 0
 are[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.153111Z","response":" gentle","done":false}]
[DEBUG] jq_sanitized: return: 0
 gentle[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.190863Z","response":" creatures","done":false}]
[DEBUG] jq_sanitized: return: 0
 creatures[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.228528Z","response":" known","done":false}]
[DEBUG] jq_sanitized: return: 0
 known[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.266152Z","response":" for","done":false}]
[DEBUG] jq_sanitized: return: 0
 for[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.303699Z","response":" their","done":false}]
[DEBUG] jq_sanitized: return: 0
 their[DEBUG] jq_sanitize: 97 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.341353Z","response":" quick","done":false}]
[DEBUG] jq_sanitized: return: 0
 quick[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.379034Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.416529Z","response":" hopping","done":false}]
[DEBUG] jq_sanitized: return: 0
 hopping[DEBUG] jq_sanitize: 101 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.454187Z","response":" movements","done":false}]
[DEBUG] jq_sanitized: return: 0
 movements[DEBUG] jq_sanitize: 95 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.492006Z","response":" and","done":false}]
[DEBUG] jq_sanitized: return: 0
 and[DEBUG] jq_sanitize: 100 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.529596Z","response":" cautious","done":false}]
[DEBUG] jq_sanitized: return: 0
 cautious[DEBUG] jq_sanitize: 91 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.56709Z","response":",","done":false}]
[DEBUG] jq_sanitized: return: 0
,[DEBUG] jq_sanitize: 99 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.604615Z","response":" curious","done":false}]
[DEBUG] jq_sanitized: return: 0
 curious[DEBUG] jq_sanitize: 98 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.642301Z","response":" nature","done":false}]
[DEBUG] jq_sanitized: return: 0
 nature[DEBUG] jq_sanitize: 92 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.679974Z","response":".","done":false}]
[DEBUG] jq_sanitized: return: 0
.[DEBUG] jq_sanitize: 1440 bytes [{"model":"qwen3:4b","created_at":"2025-07-30T10:43:21.717456Z","response":"","done":true,"done_reason":"stop","context":[151644,872,198,74785,264,38724,304,220,17,2805,22870,151645,198,151644,77091,198,151667,198,32313,11,279,1196,6801,752,311,7512,264,38724,304,1378,2805,22870,13,6771,752,1191,553,88646,279,1376,17452,315,264,38724,13,2379,614,1293,24230,11,67561,18241,11,323,525,5990,8413,323,4778,13,358,1265,6286,862,1894,11,7196,2155,36099,1075,13876,11,4158,11,476,17545,13,7281,11,862,7709,2293,4803,92238,11,1660,45778,11,476,3432,264,21700,6993,13,358,1184,311,2506,1817,11652,63594,13,5512,11652,1410,5244,389,6961,11094,11,2086,389,7709,323,17294,13,6771,752,1779,421,358,2776,18202,678,279,1887,3501,2041,1660,2238,3409,88,13,10696,2494,1075,25,330,32,38724,702,8413,11,67561,18241,323,1293,24230,11,3545,34927,264,8045,315,7987,1075,13876,11,4158,11,476,17545,13,2379,525,21700,19970,3881,369,862,3974,11,92238,19029,323,45778,11,22208,6993,1189,2938,4977,311,3421,432,13,6771,752,1281,2704,1817,11652,374,264,4583,3381,323,537,2238,1293,13,21607,11,429,4278,624,151668,271,32,38724,702,8413,11,67561,18241,323,1293,24230,11,3545,34927,264,8045,315,7987,1075,13876,11,4158,11,476,17545,13,2379,525,21700,19970,3881,369,862,3974,11,92238,19029,323,45778,11,22208,6993,13],"total_duration":8549987000,"load_duration":54843917,"prompt_eval_count":16,"prompt_eval_duration":39259916,"eval_count":235,"eval_duration":8455230667}]
[DEBUG] jq_sanitized: return: 0

[DEBUG] ollama_generate_stream: return: 0
```
