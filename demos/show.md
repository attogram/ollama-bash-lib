# ollama_show, ollama_show_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.14

ollama_show "cogito:3b"

```
  Model
    architecture        llama     
    parameters          3.6B      
    context length      131072    
    embedding length    3072      
    quantization        Q4_K_M    

  Capabilities
    completion    
    tools         

  Parameters
    repeat_penalty    1.1    

  License
    LLAMA 3.2 COMMUNITY LICENSE AGREEMENT                 
    Llama 3.2 Version Release Date: September 25, 2024    
    ...                                                   

```


ollama_show_json "cogito:3b"

```
{
  "license": "LLAMA 3.2 COMMUNITY LICENSE AGREEMENT\nLlama 3.2 Version Release Date: September 25, 2024\n\n“Agreement” means the terms and conditions for use, reproduction, distribution \nand modification of the Llama Materials set forth herein.\n\n“Documentation” means the specifications, manuals and documentation accompanying Llama 3.2\ndistributed by Meta at https://llama.meta.com/doc/overview.\n\n“Licensee” or “you” means you, or your employer or any other person or entity (if you are \nentering into this Agreement on such person or entity’s behalf), of the age required under\napplicable laws, rules or regulations to provide legal consent and that has legal authority\nto bind your employer or such other person or entity if you are entering in this Agreement\non their behalf.\n\n“Llama 3.2” means the foundational large language models and software and algorithms, including\nmachine-learning model code, trained model weights, inference-enabling code, training-enabling code,\nfine-tuning enabling code and other elements of the foregoing distributed by Meta at \nhttps://www.llama.com/llama-downloads.\n\n“Llama Materials” means, collectively, Meta’s proprietary Llama 3.2 and Documentation (and \nany portion thereof) made available under this Agreement.\n\n“Meta” or “we” means Meta Platforms Ireland Limited (if you are located in or, \nif you are an entity, your principal place of business is in the EEA or Switzerland) \nand Meta Platforms, Inc. (if you are located outside of the EEA or Switzerland). \n\n\nBy clicking “I Accept” below or by using or distributing any portion or element of the Llama Materials,\nyou agree to be bound by this Agreement.\n\n\n1. License Rights and Redistribution.\n\n    a. Grant of Rights. You are granted a non-exclusive, worldwide, \nnon-transferable and royalty-free limited license under Meta’s intellectual property or other rights \nowned by Meta embodied in the Llama Materials to use, reproduce, distribute, copy, create derivative works \nof, and make modifications to the Llama Materials.  \n\n    b. Redistribution and Use.  \n\n        i. If you distribute or make available the Llama Materials (or any derivative works thereof), \nor a product or service (including another AI model) that contains any of them, you shall (A) provide\na copy of this Agreement with any such Llama Materials; and (B) prominently display “Built with Llama”\non a related website, user interface, blogpost, about page, or product documentation. If you use the\nLlama Materials or any outputs or results of the Llama Materials to create, train, fine tune, or\notherwise improve an AI model, which is distributed or made available, you shall also include “Llama”\nat the beginning of any such AI model name.\n\n        ii. If you receive Llama Materials, or any derivative works thereof, from a Licensee as part\nof an integrated end user product, then Section 2 of this Agreement will not apply to you. \n\n        iii. You must retain in all copies of the Llama Materials that you distribute the \nfollowing attribution notice within a “Notice” text file distributed as a part of such copies: \n“Llama 3.2 is licensed under the Llama 3.2 Community License, Copyright © Meta Platforms,\nInc. All Rights Reserved.”\n\n        iv. Your use of the Llama Materials must comply with applicable laws and regulations\n(including trade compliance laws and regulations) and adhere to the Acceptable Use Policy for\nthe Llama Materials (available at https://www.llama.com/llama3_2/use-policy), which is hereby \nincorporated by reference into this Agreement.\n  \n2. Additional Commercial Terms. If, on the Llama 3.2 version release date, the monthly active users\nof the products or services made available by or for Licensee, or Licensee’s affiliates, \nis greater than 700 million monthly active users in the preceding calendar month, you must request \na license from Meta, which Meta may grant to you in its sole discretion, and you are not authorized to\nexercise any of the rights under this Agreement unless or until Meta otherwise expressly grants you such rights.\n\n3. Disclaimer of Warranty. UNLESS REQUIRED BY APPLICABLE LAW, THE LLAMA MATERIALS AND ANY OUTPUT AND \nRESULTS THEREFROM ARE PROVIDED ON AN “AS IS” BASIS, WITHOUT WARRANTIES OF ANY KIND, AND META DISCLAIMS\nALL WARRANTIES OF ANY KIND, BOTH EXPRESS AND IMPLIED, INCLUDING, WITHOUT LIMITATION, ANY WARRANTIES\nOF TITLE, NON-INFRINGEMENT, MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. YOU ARE SOLELY RESPONSIBLE\nFOR DETERMINING THE APPROPRIATENESS OF USING OR REDISTRIBUTING THE LLAMA MATERIALS AND ASSUME ANY RISKS ASSOCIATED\nWITH YOUR USE OF THE LLAMA MATERIALS AND ANY OUTPUT AND RESULTS.\n\n4. Limitation of Liability. IN NO EVENT WILL META OR ITS AFFILIATES BE LIABLE UNDER ANY THEORY OF LIABILITY, \nWHETHER IN CONTRACT, TORT, NEGLIGENCE, PRODUCTS LIABILITY, OR OTHERWISE, ARISING OUT OF THIS AGREEMENT, \nFOR ANY LOST PROFITS OR ANY INDIRECT, SPECIAL, CONSEQUENTIAL, INCIDENTAL, EXEMPLARY OR PUNITIVE DAMAGES, EVEN \nIF META OR ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF ANY OF THE FOREGOING.\n\n5. Intellectual Property.\n\n    a. No trademark licenses are granted under this Agreement, and in connection with the Llama Materials, \nneither Meta nor Licensee may use any name or mark owned by or associated with the other or any of its affiliates, \nexcept as required for reasonable and customary use in describing and redistributing the Llama Materials or as \nset forth in this Section 5(a). Meta hereby grants you a license to use “Llama” (the “Mark”) solely as required \nto comply with the last sentence of Section 1.b.i. You will comply with Meta’s brand guidelines (currently accessible \nat https://about.meta.com/brand/resources/meta/company-brand/). All goodwill arising out of your use of the Mark \nwill inure to the benefit of Meta.\n\n    b. Subject to Meta’s ownership of Llama Materials and derivatives made by or for Meta, with respect to any\n    derivative works and modifications of the Llama Materials that are made by you, as between you and Meta,\n    you are and will be the owner of such derivative works and modifications.\n\n    c. If you institute litigation or other proceedings against Meta or any entity (including a cross-claim or\n    counterclaim in a lawsuit) alleging that the Llama Materials or Llama 3.2 outputs or results, or any portion\n    of any of the foregoing, constitutes infringement of intellectual property or other rights owned or licensable\n    by you, then any licenses granted to you under this Agreement shall terminate as of the date such litigation or\n    claim is filed or instituted. You will indemnify and hold harmless Meta from and against any claim by any third\n    party arising out of or related to your use or distribution of the Llama Materials.\n\n6. Term and Termination. The term of this Agreement will commence upon your acceptance of this Agreement or access\nto the Llama Materials and will continue in full force and effect until terminated in accordance with the terms\nand conditions herein. Meta may terminate this Agreement if you are in breach of any term or condition of this\nAgreement. Upon termination of this Agreement, you shall delete and cease use of the Llama Materials. Sections 3,\n4 and 7 shall survive the termination of this Agreement. \n\n7. Governing Law and Jurisdiction. This Agreement will be governed and construed under the laws of the State of \nCalifornia without regard to choice of law principles, and the UN Convention on Contracts for the International\nSale of Goods does not apply to this Agreement. The courts of California shall have exclusive jurisdiction of\nany dispute arising out of this Agreement.",
  "modelfile": "# Modelfile generated by \"ollama show\"\n# To build a new Modelfile based on this, replace FROM with:\n# FROM cogito:3b\n\nFROM /Users/davidbarberi/.ollama/models/blobs/sha256-c4e22d5765341f9515f28583520ea3ca92013505d34d6b909d7b4bfc035ce02f\nTEMPLATE \"\"\"{{- if or .System .Tools }}<|start_header_id|>system<|end_header_id|>\n{{- if .System }}\n\n{{ .System }}\n{{- end }}\n{{- if .Tools }}\n\nAvailable Tools:\n{{ range $.Tools }}{{- . }}\n{{ end }}\n{{ end }}<|eot_id|>\n{{- end }}\n{{- range $i, $_ := .Messages }}\n{{- $last := eq (len (slice $.Messages $i)) 1 }}\n{{- if eq .Role \"user\" }}<|start_header_id|>user<|end_header_id|>\n\n{{ .Content }}<|eot_id|>{{ if $last }}<|start_header_id|>assistant<|end_header_id|>\n\n{{ end }}\n{{- else if eq .Role \"assistant\" }}<|start_header_id|>assistant<|end_header_id|>\n{{- if .ToolCalls }}\n{{ range .ToolCalls }}\n<tool_call>\n{\"name\": \"{{ .Function.Name }}\", \"arguments\": {{ .Function.Arguments }}}\n</tool_call>{{ end }}\n{{- else }}\n\n{{ .Content }}\n{{- end }}{{ if not $last }}<|eot_id|>{{ end }}\n{{- else if eq .Role \"tool\" }}<|start_header_id|>ipython<|end_header_id|>\n\n{\"content\": \"{{ .Content }}\"}<|eot_id|>{{ if $last }}<|start_header_id|>assistant<|end_header_id|>\n\n{{ end }}\n{{- end }}\n{{- end }}\"\"\"\nPARAMETER repeat_penalty 1.1\nLICENSE \"LLAMA 3.2 COMMUNITY LICENSE AGREEMENT\nLlama 3.2 Version Release Date: September 25, 2024\n\n“Agreement” means the terms and conditions for use, reproduction, distribution \nand modification of the Llama Materials set forth herein.\n\n“Documentation” means the specifications, manuals and documentation accompanying Llama 3.2\ndistributed by Meta at https://llama.meta.com/doc/overview.\n\n“Licensee” or “you” means you, or your employer or any other person or entity (if you are \nentering into this Agreement on such person or entity’s behalf), of the age required under\napplicable laws, rules or regulations to provide legal consent and that has legal authority\nto bind your employer or such other person or entity if you are entering in this Agreement\non their behalf.\n\n“Llama 3.2” means the foundational large language models and software and algorithms, including\nmachine-learning model code, trained model weights, inference-enabling code, training-enabling code,\nfine-tuning enabling code and other elements of the foregoing distributed by Meta at \nhttps://www.llama.com/llama-downloads.\n\n“Llama Materials” means, collectively, Meta’s proprietary Llama 3.2 and Documentation (and \nany portion thereof) made available under this Agreement.\n\n“Meta” or “we” means Meta Platforms Ireland Limited (if you are located in or, \nif you are an entity, your principal place of business is in the EEA or Switzerland) \nand Meta Platforms, Inc. (if you are located outside of the EEA or Switzerland). \n\n\nBy clicking “I Accept” below or by using or distributing any portion or element of the Llama Materials,\nyou agree to be bound by this Agreement.\n\n\n1. License Rights and Redistribution.\n\n    a. Grant of Rights. You are granted a non-exclusive, worldwide, \nnon-transferable and royalty-free limited license under Meta’s intellectual property or other rights \nowned by Meta embodied in the Llama Materials to use, reproduce, distribute, copy, create derivative works \nof, and make modifications to the Llama Materials.  \n\n    b. Redistribution and Use.  \n\n        i. If you distribute or make available the Llama Materials (or any derivative works thereof), \nor a product or service (including another AI model) that contains any of them, you shall (A) provide\na copy of this Agreement with any such Llama Materials; and (B) prominently display “Built with Llama”\non a related website, user interface, blogpost, about page, or product documentation. If you use the\nLlama Materials or any outputs or results of the Llama Materials to create, train, fine tune, or\notherwise improve an AI model, which is distributed or made available, you shall also include “Llama”\nat the beginning of any such AI model name.\n\n        ii. If you receive Llama Materials, or any derivative works thereof, from a Licensee as part\nof an integrated end user product, then Section 2 of this Agreement will not apply to you. \n\n        iii. You must retain in all copies of the Llama Materials that you distribute the \nfollowing attribution notice within a “Notice” text file distributed as a part of such copies: \n“Llama 3.2 is licensed under the Llama 3.2 Community License, Copyright © Meta Platforms,\nInc. All Rights Reserved.”\n\n        iv. Your use of the Llama Materials must comply with applicable laws and regulations\n(including trade compliance laws and regulations) and adhere to the Acceptable Use Policy for\nthe Llama Materials (available at https://www.llama.com/llama3_2/use-policy), which is hereby \nincorporated by reference into this Agreement.\n  \n2. Additional Commercial Terms. If, on the Llama 3.2 version release date, the monthly active users\nof the products or services made available by or for Licensee, or Licensee’s affiliates, \nis greater than 700 million monthly active users in the preceding calendar month, you must request \na license from Meta, which Meta may grant to you in its sole discretion, and you are not authorized to\nexercise any of the rights under this Agreement unless or until Meta otherwise expressly grants you such rights.\n\n3. Disclaimer of Warranty. UNLESS REQUIRED BY APPLICABLE LAW, THE LLAMA MATERIALS AND ANY OUTPUT AND \nRESULTS THEREFROM ARE PROVIDED ON AN “AS IS” BASIS, WITHOUT WARRANTIES OF ANY KIND, AND META DISCLAIMS\nALL WARRANTIES OF ANY KIND, BOTH EXPRESS AND IMPLIED, INCLUDING, WITHOUT LIMITATION, ANY WARRANTIES\nOF TITLE, NON-INFRINGEMENT, MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. YOU ARE SOLELY RESPONSIBLE\nFOR DETERMINING THE APPROPRIATENESS OF USING OR REDISTRIBUTING THE LLAMA MATERIALS AND ASSUME ANY RISKS ASSOCIATED\nWITH YOUR USE OF THE LLAMA MATERIALS AND ANY OUTPUT AND RESULTS.\n\n4. Limitation of Liability. IN NO EVENT WILL META OR ITS AFFILIATES BE LIABLE UNDER ANY THEORY OF LIABILITY, \nWHETHER IN CONTRACT, TORT, NEGLIGENCE, PRODUCTS LIABILITY, OR OTHERWISE, ARISING OUT OF THIS AGREEMENT, \nFOR ANY LOST PROFITS OR ANY INDIRECT, SPECIAL, CONSEQUENTIAL, INCIDENTAL, EXEMPLARY OR PUNITIVE DAMAGES, EVEN \nIF META OR ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF ANY OF THE FOREGOING.\n\n5. Intellectual Property.\n\n    a. No trademark licenses are granted under this Agreement, and in connection with the Llama Materials, \nneither Meta nor Licensee may use any name or mark owned by or associated with the other or any of its affiliates, \nexcept as required for reasonable and customary use in describing and redistributing the Llama Materials or as \nset forth in this Section 5(a). Meta hereby grants you a license to use “Llama” (the “Mark”) solely as required \nto comply with the last sentence of Section 1.b.i. You will comply with Meta’s brand guidelines (currently accessible \nat https://about.meta.com/brand/resources/meta/company-brand/). All goodwill arising out of your use of the Mark \nwill inure to the benefit of Meta.\n\n    b. Subject to Meta’s ownership of Llama Materials and derivatives made by or for Meta, with respect to any\n    derivative works and modifications of the Llama Materials that are made by you, as between you and Meta,\n    you are and will be the owner of such derivative works and modifications.\n\n    c. If you institute litigation or other proceedings against Meta or any entity (including a cross-claim or\n    counterclaim in a lawsuit) alleging that the Llama Materials or Llama 3.2 outputs or results, or any portion\n    of any of the foregoing, constitutes infringement of intellectual property or other rights owned or licensable\n    by you, then any licenses granted to you under this Agreement shall terminate as of the date such litigation or\n    claim is filed or instituted. You will indemnify and hold harmless Meta from and against any claim by any third\n    party arising out of or related to your use or distribution of the Llama Materials.\n\n6. Term and Termination. The term of this Agreement will commence upon your acceptance of this Agreement or access\nto the Llama Materials and will continue in full force and effect until terminated in accordance with the terms\nand conditions herein. Meta may terminate this Agreement if you are in breach of any term or condition of this\nAgreement. Upon termination of this Agreement, you shall delete and cease use of the Llama Materials. Sections 3,\n4 and 7 shall survive the termination of this Agreement. \n\n7. Governing Law and Jurisdiction. This Agreement will be governed and construed under the laws of the State of \nCalifornia without regard to choice of law principles, and the UN Convention on Contracts for the International\nSale of Goods does not apply to this Agreement. The courts of California shall have exclusive jurisdiction of\nany dispute arising out of this Agreement.\"\n",
  "parameters": "repeat_penalty                 1.1",
  "template": "{{- if or .System .Tools }}<|start_header_id|>system<|end_header_id|>\n{{- if .System }}\n\n{{ .System }}\n{{- end }}\n{{- if .Tools }}\n\nAvailable Tools:\n{{ range $.Tools }}{{- . }}\n{{ end }}\n{{ end }}<|eot_id|>\n{{- end }}\n{{- range $i, $_ := .Messages }}\n{{- $last := eq (len (slice $.Messages $i)) 1 }}\n{{- if eq .Role \"user\" }}<|start_header_id|>user<|end_header_id|>\n\n{{ .Content }}<|eot_id|>{{ if $last }}<|start_header_id|>assistant<|end_header_id|>\n\n{{ end }}\n{{- else if eq .Role \"assistant\" }}<|start_header_id|>assistant<|end_header_id|>\n{{- if .ToolCalls }}\n{{ range .ToolCalls }}\n<tool_call>\n{\"name\": \"{{ .Function.Name }}\", \"arguments\": {{ .Function.Arguments }}}\n</tool_call>{{ end }}\n{{- else }}\n\n{{ .Content }}\n{{- end }}{{ if not $last }}<|eot_id|>{{ end }}\n{{- else if eq .Role \"tool\" }}<|start_header_id|>ipython<|end_header_id|>\n\n{\"content\": \"{{ .Content }}\"}<|eot_id|>{{ if $last }}<|start_header_id|>assistant<|end_header_id|>\n\n{{ end }}\n{{- end }}\n{{- end }}",
  "details": {
    "parent_model": "",
    "format": "gguf",
    "family": "llama",
    "families": [
      "llama"
    ],
    "parameter_size": "3.6B",
    "quantization_level": "Q4_K_M"
  },
  "model_info": {
    "general.architecture": "llama",
    "general.base_model.0.name": "Llama 3.2 3B",
    "general.base_model.0.organization": "Meta Llama",
    "general.base_model.0.repo_url": "https://huggingface.co/meta-llama/Llama-3.2-3B",
    "general.base_model.count": 1,
    "general.basename": "cogito-v1-preview-llama",
    "general.file_type": 15,
    "general.license": "llama3.2",
    "general.parameter_count": 3606752320,
    "general.quantization_version": 2,
    "general.size_label": "3B",
    "general.tags": null,
    "general.type": "model",
    "llama.attention.head_count": 24,
    "llama.attention.head_count_kv": 8,
    "llama.attention.key_length": 128,
    "llama.attention.layer_norm_rms_epsilon": 0.00001,
    "llama.attention.value_length": 128,
    "llama.block_count": 28,
    "llama.context_length": 131072,
    "llama.embedding_length": 3072,
    "llama.feed_forward_length": 8192,
    "llama.rope.dimension_count": 128,
    "llama.rope.freq_base": 500000,
    "llama.vocab_size": 128256,
    "tokenizer.ggml.bos_token_id": 128000,
    "tokenizer.ggml.eos_token_id": 128009,
    "tokenizer.ggml.merges": null,
    "tokenizer.ggml.model": "gpt2",
    "tokenizer.ggml.pre": "llama-bpe",
    "tokenizer.ggml.token_type": null,
    "tokenizer.ggml.tokens": null
  },
  "tensors": [
    {
      "name": "output.weight",
      "type": "Q6_K",
      "shape": [
        3072,
        128256
      ]
    },
    {
      "name": "output_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "rope_freqs.weight",
      "type": "F32",
      "shape": [
        64
      ]
    },
    {
      "name": "token_embd.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        128256
      ]
    },
    {
      "name": "blk.0.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.0.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.0.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.0.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.0.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.0.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.0.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.0.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.0.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.1.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.1.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.1.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.1.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.1.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.1.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.1.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.1.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.1.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.2.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.2.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.2.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.2.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.2.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.2.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.2.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.2.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.2.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.3.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.3.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.3.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.3.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.3.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.3.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.3.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.3.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.3.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.4.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.4.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.4.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.4.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.4.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.4.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.4.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.4.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.4.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.5.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.5.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.5.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.5.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.5.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.5.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.5.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.5.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.5.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.6.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.6.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.6.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.6.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.6.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.6.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.6.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.6.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.6.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.7.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.7.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.7.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.7.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.7.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.7.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.7.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.7.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.7.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.8.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.8.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.8.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.8.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.8.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.8.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.8.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.8.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.8.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.9.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.9.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.9.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.9.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.9.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.9.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.9.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.9.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.9.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.10.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.10.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.10.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.10.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.10.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.10.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.10.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.10.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.10.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.11.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.11.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.11.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.11.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.11.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.11.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.11.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.11.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.11.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.12.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.12.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.12.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.12.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.12.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.12.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.12.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.12.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.12.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.13.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.13.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.13.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.13.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.13.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.13.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.13.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.13.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.13.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.14.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.14.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.14.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.14.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.14.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.14.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.14.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.14.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.14.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.15.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.15.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.15.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.15.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.15.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.15.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.15.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.15.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.15.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.16.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.16.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.16.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.16.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.16.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.16.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.16.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.16.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.16.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.17.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.17.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.17.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.17.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.17.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.17.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.17.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.17.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.17.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.18.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.18.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.18.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.18.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.18.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.18.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.18.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.18.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.18.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.19.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.19.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.19.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.19.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.19.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.19.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.19.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.19.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.19.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.20.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.20.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.20.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.20.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.20.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.20.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.20.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.20.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.20.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.21.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.21.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.21.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.21.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.21.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.21.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.21.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.21.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.21.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.22.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.22.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.22.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.22.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.22.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.22.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.22.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.22.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.22.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.23.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.23.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.23.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.23.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.23.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.23.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.23.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.23.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.23.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.24.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.24.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.24.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.24.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.24.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.24.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.24.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.24.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.24.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.25.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.25.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.25.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.25.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.25.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.25.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.25.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.25.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.25.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.26.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.26.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.26.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.26.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.26.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.26.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.26.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.26.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.26.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.27.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.27.attn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.27.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.27.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        3072
      ]
    },
    {
      "name": "blk.27.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        3072,
        1024
      ]
    },
    {
      "name": "blk.27.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        3072
      ]
    },
    {
      "name": "blk.27.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    },
    {
      "name": "blk.27.ffn_norm.weight",
      "type": "F32",
      "shape": [
        3072
      ]
    },
    {
      "name": "blk.27.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        3072,
        8192
      ]
    }
  ],
  "capabilities": [
    "completion",
    "tools"
  ],
  "modified_at": "2025-07-08T20:21:28.950499509+02:00"
}
```
