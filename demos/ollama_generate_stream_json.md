# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.1

## Demo

```bash
ollama_generate_stream_json -m "gpt-oss:120b" -p "Describe a rabbit in 3 words"

```
```json
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.414674259Z",
  "response": "",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.414689932Z",
  "response": "",
  "thinking": "We",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.414696057Z",
  "response": "",
  "thinking": " need",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.414701379Z",
  "response": "",
  "thinking": " to",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.414710087Z",
  "response": "",
  "thinking": " respond",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.414715196Z",
  "response": "",
  "thinking": " with",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.414719879Z",
  "response": "",
  "thinking": " three",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.414725401Z",
  "response": "",
  "thinking": " words",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.422608326Z",
  "response": "",
  "thinking": " describing",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.422616879Z",
  "response": "",
  "thinking": " a",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.423836144Z",
  "response": "",
  "thinking": " rabbit",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.423844501Z",
  "response": "",
  "thinking": ".",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.428285881Z",
  "response": "",
  "thinking": " No",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.434752324Z",
  "response": "",
  "thinking": " dis",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.444258784Z",
  "response": "",
  "thinking": "allowed",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.457839053Z",
  "response": "",
  "thinking": " content",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.463383376Z",
  "response": "",
  "thinking": ".",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.472823468Z",
  "response": "",
  "thinking": " Simple",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.481550518Z",
  "response": "",
  "thinking": ".",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.541378187Z",
  "response": "Soft",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.548678093Z",
  "response": ",",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.562241404Z",
  "response": " swift",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.5647476Z",
  "response": ",",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.572668617Z",
  "response": " curious",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.583178261Z",
  "response": ".",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.590496031Z",
  "response": "",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:54.590500721Z",
  "response": "",
  "done": true,
  "done_reason": "stop",
  "total_duration": 457409342,
  "prompt_eval_count": 81,
  "eval_count": 34
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json -m "gpt-oss:120b" -p "Describe a rabbit in 3 words"

```
```json
[DEBUG] 22:43:55:302179200: ollama_generate_stream_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:43:55:342604100: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:43:55:388805800: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:43:55:426505900: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:43:55:450137400: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:43:55:512902400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:43:55:535045300: _call_curl: Turbo Mode
[DEBUG] 22:43:55:557760200: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:43:55:589560900: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 22:43:57:035595800: ollama_api_post: success
[DEBUG] 22:43:57:067483900: ollama_generate_json: success
[DEBUG] 22:43:57:092558600: ollama_generate_stream_json: success
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:55.99251252Z",
  "response": "",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:55.992534552Z",
  "response": "",
  "thinking": "We",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:55.992544788Z",
  "response": "",
  "thinking": " just",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:55.992556978Z",
  "response": "",
  "thinking": " need",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:55.992565212Z",
  "response": "",
  "thinking": " three",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:55.992576839Z",
  "response": "",
  "thinking": " words",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:55.992585156Z",
  "response": "",
  "thinking": " describing",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:55.995687842Z",
  "response": "",
  "thinking": " a",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:55.995696123Z",
  "response": "",
  "thinking": " rabbit",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.011248416Z",
  "response": "",
  "thinking": ".",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.013645476Z",
  "response": "",
  "thinking": " No",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.036738253Z",
  "response": "",
  "thinking": " policy",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.036748509Z",
  "response": "",
  "thinking": " issue",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.044263758Z",
  "response": "",
  "thinking": ".",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.058997915Z",
  "response": "",
  "thinking": " Provide",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.064383648Z",
  "response": "",
  "thinking": " answer",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.077343587Z",
  "response": "",
  "thinking": ":",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.082403475Z",
  "response": "",
  "thinking": " \"",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.094268836Z",
  "response": "",
  "thinking": "Fl",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.10245042Z",
  "response": "",
  "thinking": "uffy",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.114675012Z",
  "response": "",
  "thinking": ",",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.121120495Z",
  "response": "",
  "thinking": " speedy",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.130426657Z",
  "response": "",
  "thinking": ",",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.145716812Z",
  "response": "",
  "thinking": " timid",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.152610384Z",
  "response": "",
  "thinking": "\".",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.218339134Z",
  "response": "Fl",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.233887529Z",
  "response": "uffy",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.241064267Z",
  "response": ",",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.247957331Z",
  "response": " swift",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.257339285Z",
  "response": ",",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.272718724Z",
  "response": " timid",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.276312902Z",
  "response": ".",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.286722241Z",
  "response": "",
  "done": false
}
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:56.286728029Z",
  "response": "",
  "done": true,
  "done_reason": "stop",
  "total_duration": 649327028,
  "prompt_eval_count": 81,
  "eval_count": 41
}
```
