# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.18

## Demo

```bash
ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft, quick, playful.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 21:46:41:776489400: ollama_generate_stream: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 21:46:41:792443700: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 21:46:41:803182000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 21:46:41:825974600: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 21:46:41:836039800: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 21:46:41:847455100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:46:41:858651000: _call_curl: Turbo Mode
[DEBUG] 21:46:41:869610500: _call_curl: adding json body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 21:46:42:423430600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:448168700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:498045100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:522188200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:547190500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:570565400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:595643100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:621108400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:645592500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:668058100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:692649800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:743459800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:768762800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:797887700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:828470700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:856005300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:886373100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:915653400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:943174500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:969190800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:42:994991800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:039038900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:054245800: ollama_api_post: success: return 0
[DEBUG] 21:46:43:066098700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:066924300: ollama_generate_json: success: return: 0
[DEBUG] 21:46:43:093163400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:116947000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:142485700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:167151300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:192303500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:216645300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:242396100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:267145500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:289804800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:315003700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:340878700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:366105600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:390419900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:415678200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:440271300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:464208400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:488615000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:513040000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:536124300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:561149500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:585917000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:613389700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:638063100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:664601300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:691302300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:717075600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:752038700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:777665800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:898007700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:926073400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:953408200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:43:981982200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:024744200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:052978600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:085156000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:163827200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:193274000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:305353500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:342254900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:453325700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:513454900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:537099700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:575801800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:600321800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:624840000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:647311300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:670919900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:696330200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:720055400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:745456500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:773487100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:798881300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:821859500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:847714300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:874402800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:898791100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:923435500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:949116700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:971835300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:44:999230400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:024418500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:050650800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:078855100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:104337100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:130504200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:156452200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:184562300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:211037500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:236832400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:263306300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:288416800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:317416300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:342369200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:380566400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:407952100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:434054600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:459819500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:520808200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:545371600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:575874100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:600969700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:626175400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:650881000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:675947800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:699725300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:726114600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:750885200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:775322000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:800888700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:824125700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:860184100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:884566300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:909293000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:934783500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:961805700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:45:988830000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:46:014789100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:46:040976100: _escape_control_characters: Safe Mode OFF
fl[DEBUG] 21:46:46:066168900: _escape_control_characters: Safe Mode OFF
uffy[DEBUG] 21:46:46:091658700: _escape_control_characters: Safe Mode OFF
,[DEBUG] 21:46:46:117227000: _escape_control_characters: Safe Mode OFF
 playful[DEBUG] 21:46:46:143271600: _escape_control_characters: Safe Mode OFF
,[DEBUG] 21:46:46:168484300: _escape_control_characters: Safe Mode OFF
 swift[DEBUG] 21:46:46:192225100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:46:217305000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:46:234284500: ollama_generate_stream: return: 0

```
