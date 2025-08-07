# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.18

## Demo

```bash
ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft, swift, curious.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "gpt-oss:20b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 21:35:51:021138300: ollama_generate_stream: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 21:35:51:037883400: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 21:35:51:049474000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 21:35:51:072011200: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 21:35:51:083033900: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 21:35:51:093097400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:35:51:103705000: _call_curl: Turbo Mode
[DEBUG] 21:35:51:114811000: _call_curl: adding json body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 21:35:51:777827900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:51:807224300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:51:829629300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:51:852717000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:51:875523300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:51:898550800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:51:922156600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:51:946117800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:51:994350600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:018384000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:040948300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:066350600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:089734500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:113343300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:137691900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:160181200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:184722500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:207462700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:229461500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:254594300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:276085600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:300163900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:323474500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:347141400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:370813600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:395383000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:418814700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:441265300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:464741500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:486525100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:510614500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:534073300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:556944400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:582956900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:606643200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:610282600: ollama_api_post: success: return 0
[DEBUG] 21:35:52:621331700: ollama_generate_json: success: return: 0
[DEBUG] 21:35:52:631881100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:656154400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:678874200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:703332500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:728169200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:750440900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:774144700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:799298800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:822487200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:845342000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:870071400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:893413600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:915894100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:939220900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:962209700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:52:986436100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:008385200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:031971200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:057680800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:081203300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:103892600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:128254700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:166456100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:196404200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:225415000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:253012700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:280361700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:308015900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:347169000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:373308900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:398170500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:423762100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:451309000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:480005100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:505523000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:529740300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:557894500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:585227200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:616433800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:640143900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:665500000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:694705000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:724009700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:751638700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:807165700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:833991200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:860566100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:887521700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:914454000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:945272900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:53:974960000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:006135800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:036385800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:065358800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:094862000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:120265000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:146096000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:176768800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:201979400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:227434100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:255032800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:282683200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:309204500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:336059500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:360947700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:386506000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:412158300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:437554900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:463356100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:488764000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:516793300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:542213100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:570287500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:596917300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:624019400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:650277300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:677859000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:705174600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:730249200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:755441700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:779208400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:808291100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:832730200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:857701200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:881166400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:906617100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:930926800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:957076300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:54:980601200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:006135900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:053664500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:077830700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:102155200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:126706700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:152555600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:176645700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:202817800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:227170000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:253749100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:277778100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:307733900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:334227900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:358680400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:410294400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:443292000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:469775000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:496996700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:521905400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:545455500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:572032900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:599738200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:626298600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:652051700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:677474700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:706489300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:730485300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:764130100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:791080200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:818852700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:842690200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:867852200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:891211600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:916781700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:941151800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:965940700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:55:992487500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:020655900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:045444300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:070534300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:094709300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:123339100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:146649300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:173874000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:198505000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:223398300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:247623300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:275951800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:309626000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:335845300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:360082800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:385621600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:414239200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:440508400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:463946500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:489527000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:518928600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:544561300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:615167700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:639938800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:665453000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:692074800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:715721400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:740219100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:763820700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:788646000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:812450800: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:838991100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:863725600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:894305500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:920662100: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:954341900: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:56:979515200: _escape_control_characters: Safe Mode OFF
fl[DEBUG] 21:35:57:005790600: _escape_control_characters: Safe Mode OFF
uffy[DEBUG] 21:35:57:029843200: _escape_control_characters: Safe Mode OFF
,[DEBUG] 21:35:57:063257800: _escape_control_characters: Safe Mode OFF
 swift[DEBUG] 21:35:57:085341400: _escape_control_characters: Safe Mode OFF
,[DEBUG] 21:35:57:109636800: _escape_control_characters: Safe Mode OFF
 curious[DEBUG] 21:35:57:133595400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:57:157850000: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:57:176838600: ollama_generate_stream: return: 0

```
