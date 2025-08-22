# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.3

## Setup

OLLAMA_HOST: http://localhost:11434
OBL_API: http://localhost:11434


## Demo


```
ollama_generate -m "$model" -p "$prompt"
```
```
<think>
Okay, the user wants me to describe a rabbit in three words. Let me think about the key characteristics of a rabbit. They're known for their soft fur, so maybe "soft-furred" or "fluffy." Then, their ears are long and upright, so "long-eared" could work. Also, rabbits are often associated with being quick and agile, so "nimble" or "quick." Wait, but I need three words. Let me combine these. "Soft-furred, long-eared, nimble" – that's three. Alternatively, maybe "fluffy, quick, gentle" to capture their appearance and behavior. But the user might prefer more specific terms. Let me check if "nimble" is commonly used. Yes, it's a good descriptor. So the answer should be three words that encapsulate the physical and behavioral traits. Maybe "soft, quick, fluffy" but that's three. Wait, the user said three words, not three adjectives. So maybe "fluffy, long-eared, quick." That works. Or "soft-furred, nimble, long-eared." But perhaps the user wants concise words. Let me think again. The most common descriptors are fluffy, long ears, and quick. So "fluffy, long-eared, quick" – that's three words. Alternatively, "soft, quick, gentle" if they want more about temperament. But the user didn't specify, so better to stick with physical traits. So I'll go with "fluffy, long-eared, quick."
</think>

Fluffy, long-eared, quick.
```

## Demo Debug


```
OBL_DEBUG=1 ollama_generate -m "$model" -p "$prompt"
```
```
[DEBUG] 22:04:51:218968500: ollama_generate: [-m] [qwen3:8b] [-p] [Describe a rabbit in 3 words]
[DEBUG] 22:04:51:262398000: ollama_generate: init: model: [] prompt: []
[DEBUG] 22:04:51:287489500: ollama_generate: while getopts: OPTARG: [qwen3:8b] opt: [m]
[DEBUG] 22:04:51:310509700: ollama_generate: while getopts: OPTARG: [Describe a rabbit in 3 words] opt: [p]
[DEBUG] 22:04:51:341300900: ollama_generate: final: model: [qwen3:8b] prompt: [Describe a rabbit in 3 words]
[DEBUG] 22:04:51:364331300: ollama_generate: checking: model: [qwen3:8b]
[DEBUG] 22:04:51:387850300: ollama_generate: checked: model: [qwen3:8b]
[DEBUG] 22:04:51:438036400: ollama_generate_json: [qwen3:8b] [Describe a rabbit in 3 words]
[DEBUG] 22:04:51:485719400: ollama_generate_json: json_payload: {"model":"qwen3:8b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:04:51:525955500: ollama_api_post: [/api/generate] {"model":"qwen3:8b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:04:51:558130200: _call_curl: [POST] [/api/generate] {"model":"qwen3:8b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:04:51:595831700: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 22:04:51:619963100: _call_curl: json_body: {"model":"qwen3:8b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:04:51:641587300: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X POST http://localhost:11434/api/generate -d @-
[DEBUG] 22:05:01:387878400: ollama_api_post: success
[DEBUG] 22:05:01:425517700: ollama_generate_json: success
[DEBUG] 22:05:01:509980000: ollama_generate: result: 3803 bytes: {"model":"qwen3:8b","created_at":"2025-08-22T20:05:01.2649925Z","response":"\u003cthink\u003e\nOkay, the user wants me t
[DEBUG] 22:05:01:602534700: ollama_generate: thinking: off
<think>
Okay, the user wants me to describe a rabbit in three words. Let me think about the key characteristics of a rabbit. They're known for their soft fur, long ears, and quick movements. Maybe "soft," "quick," and "alert"? Wait, "alert" might not be the best. Alternatively, "delicate" could work. Or maybe "nimble" instead of "quick." Let me consider synonyms. "Graceful" might fit. Hmm. Also, rabbits have a certain cuteness, so maybe "cute" is an option. But the user might want more descriptive words. Let me check if there's a common three-word description. Sometimes people use "soft, fluffy, and quick." But the user might prefer more concise terms. Let me think again. "Soft," "quick," and "alert" seem to capture the physical traits and behavior. Alternatively, "delicate," "nimble," and "curious." Wait, the user might want the most accurate terms. Let me verify. Rabbits have soft fur, are quick to move, and are alert to their surroundings. So "soft," "quick," and "alert" could work. Alternatively, "fluffy," "nimble," and "inquisitive." But I need to make sure these words are concise and commonly associated with rabbits. Maybe "soft," "nimble," and "alert" is better. Let me check if there's a standard answer. Sometimes people use "soft, fluffy, and quick," but maybe the user wants more precise terms. I think "soft," "quick," and "alert" are good. Alternatively, "delicate," "nimble," and "curious." Hmm. I need to choose the best three words that encapsulate the essence of a rabbit. Let me go with "soft," "quick," and "alert."
</think>

Soft, quick, alert.
[DEBUG] 22:05:01:696235900: ollama_generate: success
```
