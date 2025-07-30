# ollama_show, ollama_show_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.0

ollama_show "minicpm-v:8b"

```
  Model
    architecture        qwen2    
    parameters          7.6B     
    context length      32768    
    embedding length    3584     
    quantization        Q4_0     

  Capabilities
    completion    
    vision        

  Projector
    architecture        clip       
    parameters          503.97M    
    embedding length    1152       
    dimensions          0          

  Parameters
    stop    "<|im_start|>"    
    stop    "<|im_end|>"      

  License
    Version 1.0, June 5, 2024               
    © 2024 OpenBMB. All rights reserved.    
    ...                                     

```


ollama_show_json "minicpm-v:8b"

```
{
  "license": "Version 1.0, June 5, 2024\n© 2024 OpenBMB. All rights reserved.\n\n## Part One: Preamble\n\nWe are opening the entire series of the globally leading MiniCPM edge-side large language models, including the flagship edge-side models MiniCPM-2.4B and MiniCPM-1.2B, as well as the world's most powerful edge multimodal models MiniCPM-V series. The aforementioned weights are completely open for all academic research. Commercial use is also allowed after filling out a registration questionnaire. Community use of the MiniCPM series models must comply with Apache 2.0 and the \"MiniCPM Model Community License Agreement.\"\nTherefore, you and the MiniCPM development team agree to the following \"MiniCPM Model Community License Agreement\":\n\n## Part Two: Licensing and Redistributio\n\n####  1. Grant of Rights\nYou are granted a non-exclusive, worldwide, non-transferable, royalty-free, limited license to use, copy, distribute, reproduce, create derivative works from, and modify MiniCPM materials in accordance with OpenBMB's intellectual property rights or other rights in the MiniCPM materials.\n####  2. Distribution and Redistribution\n- If you distribute or provide MiniCPM series model materials (or any derivative works thereof), or use any product or service of them, you must (A) provide a copy of this agreement; and (B) prominently display \"Built with 面壁MiniCPM\" on the relevant website, user interface, blog post, about page, or product documentation. If you create, train, fine-tune, or improve an AI model using the MiniCPM series models, the model must include \"MiniCPM\" in its name.\n- You must retain the following attribution statement in all distributed MiniCPM-related materials: \"MiniCPM is licensed under the MiniCPM Model Community License, © OpenBMB Platforms, Inc. All rights reserved.\"\n- Your use of MiniCPM materials must comply with applicable laws and regulations and the \"MiniCPM Model Community License Agreement,\" which is incorporated into this agreement by reference.\n- You may not use MiniCPM series models or their outputs and results to improve any other large language models (other than MiniCPM or its derivatives).\n####  3. Additional Commercial Terms\nIf you or your affiliates' services or products deploy the model on edge-side devices not exceeding 5,000 units, or provide applications with a daily active user count (DAU) of less than 1 million, you can apply to OpenBMB for permission and, after filling out the registration questionnaire, may be allowed to use it commercially for free. Otherwise, please email (cpm@modelbest.cn) to apply for authorization from OpenBMB, which may, at its discretion, grant permission, and you will not have the right to exercise any rights under this agreement.\n####  4. Usage-based Restrictions\nThe restrictions set forth in Appendix A are considered usage-based restrictions. Therefore, you may not use the model or its derivatives for designated restricted uses. You may use the model under this license, including only for lawful purposes and in compliance with the terms of the license. Usage includes creating any content, fine-tuning, updating, running, training, evaluating, and/or re-parameterizing the model. You should require all users of the model or its derivatives to comply with the terms of this section.\n\n## Part Three: Other Terms\n####  5. Trademarks and Related\nThis license does not grant you the right to use OpenBMB, OpenBMB Intelligence, MiniCPM trademarks, trade names, logos, or otherwise imply a relationship between the parties; any rights not expressly granted herein are reserved by OpenBMB.\n####  6. Disclaimer\nUnless required by applicable law or agreed to in writing, OpenBMB provides the model and supplemental materials \"as is,\" without any warranty or condition, express or implied, including but not limited to all express and implied warranties or conditions of title, non-infringement, merchantability, or fitness for a particular purpose. You are solely responsible for determining the appropriateness of using or redistributing the model, its derivatives, and supplemental materials, and assume any risks associated with exercising the permissions under this license.\n\n## Appendix A: Usage Restrictions\nYou agree not to use the model or its derivatives for:\n- Any use that violates applicable national or international laws or regulations or infringes upon the legal rights and interests of any third party;\n- Any military purposes;\n- Exploiting, harming, or attempting to exploit or harm minors in any way;\n- Generating or disseminating verifiable false information and/or content with the intent to harm others;\n- Generating or disseminating inappropriate content that must comply with applicable regulatory requirements;\n- Unauthorized generation or dissemination of personally identifiable information, or unreasonable use thereof;\n- Defamation, demeaning, or otherwise harassing others;\n- Fully automated decision-making that adversely affects individuals' legal rights or creates or modifies binding, enforceable obligations;\n- Any use intended to or having the effect of discriminating or harming individuals or groups based on online or offline social behaviors or known or predicted personal characteristics;\n- Exploiting the vulnerabilities of specific groups due to their age, social, physical, or psychological characteristics, in a manner that materially distorts the behavior of group members, leading to or likely leading to physical or psychological harm to the person or others;\n- Any use intended to or having the effect of discriminating against individuals or groups based on legally protected characteristics or categories.\n",
  "modelfile": "# Modelfile generated by \"ollama show\"\n# To build a new Modelfile based on this, replace FROM with:\n# FROM minicpm-v:8b\n\nFROM /Users/davidbarberi/.ollama/models/blobs/sha256-262843d4806aeb402336980badd414a72576b20b1e5d537647da15f16c4a4df0\nFROM /Users/davidbarberi/.ollama/models/blobs/sha256-f8a805e9e62085805c69c427287acefc284932eb4abfe6e1b1ce431d27e2f4e0\nTEMPLATE \"\"\"{{- if .Messages }}\n{{- range $i, $_ := .Messages }}\n{{- $last := eq (len (slice $.Messages $i)) 1 -}}\n<|im_start|>{{ .Role }}\n{{ .Content }}\n{{- if $last }}\n{{- if (ne .Role \"assistant\") }}<|im_end|>\n<|im_start|>assistant\n{{ end }}\n{{- else }}<|im_end|>\n{{ end }}\n{{- end }}\n{{- else }}\n{{- if .System }}<|im_start|>system\n{{ .System }}<|im_end|>\n{{ end }}{{ if .Prompt }}<|im_start|>user\n{{ .Prompt }}<|im_end|>\n{{ end }}<|im_start|>assistant\n{{ end }}{{ .Response }}{{ if .Response }}<|im_end|>{{ end }}\"\"\"\nPARAMETER stop <|im_start|>\nPARAMETER stop <|im_end|>\nLICENSE \"\"\"Version 1.0, June 5, 2024\n© 2024 OpenBMB. All rights reserved.\n\n## Part One: Preamble\n\nWe are opening the entire series of the globally leading MiniCPM edge-side large language models, including the flagship edge-side models MiniCPM-2.4B and MiniCPM-1.2B, as well as the world's most powerful edge multimodal models MiniCPM-V series. The aforementioned weights are completely open for all academic research. Commercial use is also allowed after filling out a registration questionnaire. Community use of the MiniCPM series models must comply with Apache 2.0 and the \"MiniCPM Model Community License Agreement.\"\nTherefore, you and the MiniCPM development team agree to the following \"MiniCPM Model Community License Agreement\":\n\n## Part Two: Licensing and Redistributio\n\n####  1. Grant of Rights\nYou are granted a non-exclusive, worldwide, non-transferable, royalty-free, limited license to use, copy, distribute, reproduce, create derivative works from, and modify MiniCPM materials in accordance with OpenBMB's intellectual property rights or other rights in the MiniCPM materials.\n####  2. Distribution and Redistribution\n- If you distribute or provide MiniCPM series model materials (or any derivative works thereof), or use any product or service of them, you must (A) provide a copy of this agreement; and (B) prominently display \"Built with 面壁MiniCPM\" on the relevant website, user interface, blog post, about page, or product documentation. If you create, train, fine-tune, or improve an AI model using the MiniCPM series models, the model must include \"MiniCPM\" in its name.\n- You must retain the following attribution statement in all distributed MiniCPM-related materials: \"MiniCPM is licensed under the MiniCPM Model Community License, © OpenBMB Platforms, Inc. All rights reserved.\"\n- Your use of MiniCPM materials must comply with applicable laws and regulations and the \"MiniCPM Model Community License Agreement,\" which is incorporated into this agreement by reference.\n- You may not use MiniCPM series models or their outputs and results to improve any other large language models (other than MiniCPM or its derivatives).\n####  3. Additional Commercial Terms\nIf you or your affiliates' services or products deploy the model on edge-side devices not exceeding 5,000 units, or provide applications with a daily active user count (DAU) of less than 1 million, you can apply to OpenBMB for permission and, after filling out the registration questionnaire, may be allowed to use it commercially for free. Otherwise, please email (cpm@modelbest.cn) to apply for authorization from OpenBMB, which may, at its discretion, grant permission, and you will not have the right to exercise any rights under this agreement.\n####  4. Usage-based Restrictions\nThe restrictions set forth in Appendix A are considered usage-based restrictions. Therefore, you may not use the model or its derivatives for designated restricted uses. You may use the model under this license, including only for lawful purposes and in compliance with the terms of the license. Usage includes creating any content, fine-tuning, updating, running, training, evaluating, and/or re-parameterizing the model. You should require all users of the model or its derivatives to comply with the terms of this section.\n\n## Part Three: Other Terms\n####  5. Trademarks and Related\nThis license does not grant you the right to use OpenBMB, OpenBMB Intelligence, MiniCPM trademarks, trade names, logos, or otherwise imply a relationship between the parties; any rights not expressly granted herein are reserved by OpenBMB.\n####  6. Disclaimer\nUnless required by applicable law or agreed to in writing, OpenBMB provides the model and supplemental materials \"as is,\" without any warranty or condition, express or implied, including but not limited to all express and implied warranties or conditions of title, non-infringement, merchantability, or fitness for a particular purpose. You are solely responsible for determining the appropriateness of using or redistributing the model, its derivatives, and supplemental materials, and assume any risks associated with exercising the permissions under this license.\n\n## Appendix A: Usage Restrictions\nYou agree not to use the model or its derivatives for:\n- Any use that violates applicable national or international laws or regulations or infringes upon the legal rights and interests of any third party;\n- Any military purposes;\n- Exploiting, harming, or attempting to exploit or harm minors in any way;\n- Generating or disseminating verifiable false information and/or content with the intent to harm others;\n- Generating or disseminating inappropriate content that must comply with applicable regulatory requirements;\n- Unauthorized generation or dissemination of personally identifiable information, or unreasonable use thereof;\n- Defamation, demeaning, or otherwise harassing others;\n- Fully automated decision-making that adversely affects individuals' legal rights or creates or modifies binding, enforceable obligations;\n- Any use intended to or having the effect of discriminating or harming individuals or groups based on online or offline social behaviors or known or predicted personal characteristics;\n- Exploiting the vulnerabilities of specific groups due to their age, social, physical, or psychological characteristics, in a manner that materially distorts the behavior of group members, leading to or likely leading to physical or psychological harm to the person or others;\n- Any use intended to or having the effect of discriminating against individuals or groups based on legally protected characteristics or categories.\n\"\"\"\n",
  "parameters": "stop                           \"<|im_start|>\"\nstop                           \"<|im_end|>\"",
  "template": "{{- if .Messages }}\n{{- range $i, $_ := .Messages }}\n{{- $last := eq (len (slice $.Messages $i)) 1 -}}\n<|im_start|>{{ .Role }}\n{{ .Content }}\n{{- if $last }}\n{{- if (ne .Role \"assistant\") }}<|im_end|>\n<|im_start|>assistant\n{{ end }}\n{{- else }}<|im_end|>\n{{ end }}\n{{- end }}\n{{- else }}\n{{- if .System }}<|im_start|>system\n{{ .System }}<|im_end|>\n{{ end }}{{ if .Prompt }}<|im_start|>user\n{{ .Prompt }}<|im_end|>\n{{ end }}<|im_start|>assistant\n{{ end }}{{ .Response }}{{ if .Response }}<|im_end|>{{ end }}",
  "details": {
    "parent_model": "",
    "format": "gguf",
    "family": "qwen2",
    "families": [
      "qwen2",
      "clip"
    ],
    "parameter_size": "7.6B",
    "quantization_level": "Q4_0"
  },
  "model_info": {
    "general.architecture": "qwen2",
    "general.file_type": 2,
    "general.parameter_count": 7612763648,
    "general.quantization_version": 2,
    "qwen2.attention.head_count": 28,
    "qwen2.attention.head_count_kv": 4,
    "qwen2.attention.layer_norm_rms_epsilon": 0.000001,
    "qwen2.block_count": 28,
    "qwen2.context_length": 32768,
    "qwen2.embedding_length": 3584,
    "qwen2.feed_forward_length": 18944,
    "qwen2.rope.freq_base": 1000000,
    "tokenizer.ggml.bos_token_id": 151644,
    "tokenizer.ggml.eos_token_id": 151645,
    "tokenizer.ggml.merges": null,
    "tokenizer.ggml.model": "gpt2",
    "tokenizer.ggml.padding_token_id": 0,
    "tokenizer.ggml.pre": "qwen2",
    "tokenizer.ggml.token_type": null,
    "tokenizer.ggml.tokens": null,
    "tokenizer.ggml.unknown_token_id": 128244
  },
  "projector_info": {
    "clip.has_minicpmv_projector": true,
    "clip.has_text_encoder": false,
    "clip.has_vision_encoder": true,
    "clip.minicpmv_version": 3,
    "clip.projector_type": "resampler",
    "clip.use_gelu": true,
    "clip.vision.attention.head_count": 16,
    "clip.vision.attention.layer_norm_epsilon": 0.000001,
    "clip.vision.block_count": 26,
    "clip.vision.embedding_length": 1152,
    "clip.vision.feed_forward_length": 4304,
    "clip.vision.image_mean": null,
    "clip.vision.image_size": 448,
    "clip.vision.image_std": null,
    "clip.vision.patch_size": 14,
    "clip.vision.projection_dim": 0,
    "general.architecture": "clip",
    "general.description": "image encoder for MiniCPM-V",
    "general.file_type": 1,
    "general.parameter_count": 503973104
  },
  "tensors": [
    {
      "name": "token_embd.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        151666
      ]
    },
    {
      "name": "blk.0.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.0.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.0.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.0.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.0.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.0.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.0.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.0.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.0.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.0.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.0.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.0.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.1.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.1.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.1.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.1.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.1.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.1.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.1.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.1.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.1.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.1.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.1.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.1.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.2.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.2.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.2.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.2.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.2.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.2.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.2.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.2.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.2.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.2.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.2.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.2.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.3.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.3.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.3.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.3.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.3.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.3.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.3.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.3.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.3.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.3.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.3.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.3.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.4.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.4.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.4.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.4.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.4.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.4.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.4.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.4.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.4.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.4.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.4.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.4.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.5.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.5.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.5.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.5.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.5.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.5.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.5.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.5.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.5.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.5.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.5.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.5.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.6.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.6.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.6.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.6.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.6.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.6.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.6.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.6.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.6.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.6.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.6.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.6.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.7.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.7.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.7.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.7.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.7.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.7.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.7.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.7.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.7.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.7.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.7.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.7.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.8.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.8.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.8.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.8.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.8.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.8.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.8.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.10.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.10.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.10.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.10.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.10.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.10.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.10.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.10.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.10.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.10.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.10.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.10.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.11.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.11.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.11.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.11.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.11.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.11.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.11.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.11.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.11.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.11.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.11.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.11.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.12.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.12.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.12.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.12.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.12.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.12.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.12.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.12.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.12.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.12.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.12.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.12.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.13.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.13.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.13.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.13.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.13.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.13.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.13.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.13.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.8.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.8.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.8.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.8.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.8.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.9.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.9.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.9.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.9.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.9.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.9.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.9.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.9.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.9.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.9.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.9.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.9.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.13.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.13.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.13.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.13.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.14.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.14.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.14.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.14.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.14.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.14.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.14.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.14.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.14.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.14.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.14.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.14.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.15.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.15.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.15.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.15.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.15.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.15.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.15.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.15.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.15.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.15.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.15.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.15.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.16.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.16.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.16.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.16.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.16.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.16.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.16.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.16.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.16.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.16.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.16.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.16.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.17.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.17.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.17.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.17.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.17.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.17.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.17.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.17.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.17.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.17.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.17.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.17.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.18.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.18.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.18.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.18.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.18.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.18.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.18.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.18.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.18.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.18.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.18.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.18.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.19.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.19.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.19.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.19.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.19.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.19.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.19.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.19.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.19.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.19.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.19.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.19.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.20.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.20.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.20.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.20.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.20.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.20.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.20.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.20.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.20.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.20.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.20.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.20.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.21.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.21.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.21.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.21.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.21.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.21.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.21.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.21.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.21.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.21.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.21.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.21.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.22.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.22.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.22.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.22.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.22.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.22.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.22.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.22.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.22.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.22.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.22.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.22.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.23.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.23.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.23.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.23.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.23.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.23.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.23.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.23.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.23.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.23.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.23.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.23.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.24.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.24.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.24.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.24.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.24.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.24.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.24.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.24.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.24.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.24.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.24.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.24.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.25.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.25.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.25.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.25.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.25.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.25.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.25.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.25.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.25.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.25.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.25.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.25.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.26.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.26.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.26.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.26.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.26.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.26.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.26.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.26.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.26.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.26.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.26.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.26.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.27.attn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.27.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        18944,
        3584
      ]
    },
    {
      "name": "blk.27.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.27.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        18944
      ]
    },
    {
      "name": "blk.27.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.27.attn_k.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.27.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "blk.27.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.27.attn_q.bias",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "blk.27.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        3584
      ]
    },
    {
      "name": "blk.27.attn_v.bias",
      "type": "F32",
      "shape": [
        512
      ]
    },
    {
      "name": "blk.27.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        3584,
        512
      ]
    },
    {
      "name": "output_norm.weight",
      "type": "F32",
      "shape": [
        3584
      ]
    },
    {
      "name": "output.weight",
      "type": "Q6_K",
      "shape": [
        3584,
        151666
      ]
    }
  ],
  "capabilities": [
    "completion",
    "vision"
  ],
  "modified_at": "2025-06-08T22:19:16.066567907+02:00"
}
```
