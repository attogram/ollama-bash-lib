# ollama_show, ollama_show_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

ollama_show -m "dolphin3:8b"

```
  Model
    architecture        llama     
    parameters          8.0B      
    context length      131072    
    embedding length    4096      
    quantization        Q4_K_M    

  Capabilities
    completion    

  Parameters
    stop    "<|im_start|>"    
    stop    "<|im_end|>"      

  System
    You are Dolphin, a helpful AI assistant.    

  License
    LLAMA 3.1 COMMUNITY LICENSE AGREEMENT            
    Llama 3.1 Version Release Date: July 23, 2024    
    ...                                              

```


ollama_show_json -m "dolphin3:8b"

```json
{
  "license": "LLAMA 3.1 COMMUNITY LICENSE AGREEMENT\nLlama 3.1 Version Release Date: July 23, 2024\n\n“Agreement” means the terms and conditions for use, reproduction, distribution and modification of the\nLlama Materials set forth herein.\n\n“Documentation” means the specifications, manuals and documentation accompanying Llama 3.1\ndistributed by Meta at https://llama.meta.com/doc/overview.\n\n“Licensee” or “you” means you, or your employer or any other person or entity (if you are entering into\nthis Agreement on such person or entity’s behalf), of the age required under applicable laws, rules or\nregulations to provide legal consent and that has legal authority to bind your employer or such other\nperson or entity if you are entering in this Agreement on their behalf.\n\n“Llama 3.1” means the foundational large language models and software and algorithms, including\nmachine-learning model code, trained model weights, inference-enabling code, training-enabling code,\nfine-tuning enabling code and other elements of the foregoing distributed by Meta at\nhttps://llama.meta.com/llama-downloads.\n\n“Llama Materials” means, collectively, Meta’s proprietary Llama 3.1 and Documentation (and any\nportion thereof) made available under this Agreement.\n\n“Meta” or “we” means Meta Platforms Ireland Limited (if you are located in or, if you are an entity, your\nprincipal place of business is in the EEA or Switzerland) and Meta Platforms, Inc. (if you are located\noutside of the EEA or Switzerland).\n\nBy clicking “I Accept” below or by using or distributing any portion or element of the Llama Materials,\nyou agree to be bound by this Agreement.\n\n1. License Rights and Redistribution.\n\n  a. Grant of Rights. You are granted a non-exclusive, worldwide, non-transferable and royalty-free\nlimited license under Meta’s intellectual property or other rights owned by Meta embodied in the Llama\nMaterials to use, reproduce, distribute, copy, create derivative works of, and make modifications to the\nLlama Materials.\n\n  b. Redistribution and Use.\n\n      i. If you distribute or make available the Llama Materials (or any derivative works\nthereof), or a product or service (including another AI model) that contains any of them, you shall (A)\nprovide a copy of this Agreement with any such Llama Materials; and (B) prominently display “Built with\nLlama” on a related website, user interface, blogpost, about page, or product documentation. If you use\nthe Llama Materials or any outputs or results of the Llama Materials to create, train, fine tune, or\notherwise improve an AI model, which is distributed or made available, you shall also include “Llama” at\nthe beginning of any such AI model name.\n\n      ii. If you receive Llama Materials, or any derivative works thereof, from a Licensee as part \nof an integrated end user product, then Section 2 of this Agreement will not apply to you.\n\n      iii. You must retain in all copies of the Llama Materials that you distribute the following\nattribution notice within a “Notice” text file distributed as a part of such copies: “Llama 3.1 is\nlicensed under the Llama 3.1 Community License, Copyright © Meta Platforms, Inc. All Rights\nReserved.”\n\n      iv. Your use of the Llama Materials must comply with applicable laws and regulations\n(including trade compliance laws and regulations) and adhere to the Acceptable Use Policy for the Llama\nMaterials (available at https://llama.meta.com/llama3_1/use-policy), which is hereby incorporated by\nreference into this Agreement.\n\n2. Additional Commercial Terms. If, on the Llama 3.1 version release date, the monthly active users\nof the products or services made available by or for Licensee, or Licensee’s affiliates, is greater than 700\nmillion monthly active users in the preceding calendar month, you must request a license from Meta,\nwhich Meta may grant to you in its sole discretion, and you are not authorized to exercise any of the\nrights under this Agreement unless or until Meta otherwise expressly grants you such rights.\n\n3. Disclaimer of Warranty. UNLESS REQUIRED BY APPLICABLE LAW, THE LLAMA MATERIALS AND ANY\nOUTPUT AND RESULTS THEREFROM ARE PROVIDED ON AN “AS IS” BASIS, WITHOUT WARRANTIES OF\nANY KIND, AND META DISCLAIMS ALL WARRANTIES OF ANY KIND, BOTH EXPRESS AND IMPLIED,\nINCLUDING, WITHOUT LIMITATION, ANY WARRANTIES OF TITLE, NON-INFRINGEMENT,\nMERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. YOU ARE SOLELY RESPONSIBLE FOR\nDETERMINING THE APPROPRIATENESS OF USING OR REDISTRIBUTING THE LLAMA MATERIALS AND\nASSUME ANY RISKS ASSOCIATED WITH YOUR USE OF THE LLAMA MATERIALS AND ANY OUTPUT AND\nRESULTS.\n\n4. Limitation of Liability. IN NO EVENT WILL META OR ITS AFFILIATES BE LIABLE UNDER ANY THEORY OF\nLIABILITY, WHETHER IN CONTRACT, TORT, NEGLIGENCE, PRODUCTS LIABILITY, OR OTHERWISE, ARISING\nOUT OF THIS AGREEMENT, FOR ANY LOST PROFITS OR ANY INDIRECT, SPECIAL, CONSEQUENTIAL,\nINCIDENTAL, EXEMPLARY OR PUNITIVE DAMAGES, EVEN IF META OR ITS AFFILIATES HAVE BEEN ADVISED\nOF THE POSSIBILITY OF ANY OF THE FOREGOING.\n\n5. Intellectual Property.\n\n  a. No trademark licenses are granted under this Agreement, and in connection with the Llama\nMaterials, neither Meta nor Licensee may use any name or mark owned by or associated with the other\nor any of its affiliates, except as required for reasonable and customary use in describing and\nredistributing the Llama Materials or as set forth in this Section 5(a). Meta hereby grants you a license to\nuse “Llama” (the “Mark”) solely as required to comply with the last sentence of Section 1.b.i. You will\ncomply with Meta’s brand guidelines (currently accessible at\nhttps://about.meta.com/brand/resources/meta/company-brand/ ). All goodwill arising out of your use\nof the Mark will inure to the benefit of Meta.\n\n  b. Subject to Meta’s ownership of Llama Materials and derivatives made by or for Meta, with\nrespect to any derivative works and modifications of the Llama Materials that are made by you, as\nbetween you and Meta, you are and will be the owner of such derivative works and modifications.\n\n  c. If you institute litigation or other proceedings against Meta or any entity (including a\ncross-claim or counterclaim in a lawsuit) alleging that the Llama Materials or Llama 3.1 outputs or\nresults, or any portion of any of the foregoing, constitutes infringement of intellectual property or other\nrights owned or licensable by you, then any licenses granted to you under this Agreement shall\nterminate as of the date such litigation or claim is filed or instituted. You will indemnify and hold\nharmless Meta from and against any claim by any third party arising out of or related to your use or\ndistribution of the Llama Materials.\n\n6. Term and Termination. The term of this Agreement will commence upon your acceptance of this\nAgreement or access to the Llama Materials and will continue in full force and effect until terminated in\naccordance with the terms and conditions herein. Meta may terminate this Agreement if you are in\nbreach of any term or condition of this Agreement. Upon termination of this Agreement, you shall delete\nand cease use of the Llama Materials. Sections 3, 4 and 7 shall survive the termination of this\nAgreement.\n\n7. Governing Law and Jurisdiction. This Agreement will be governed and construed under the laws of\nthe State of California without regard to choice of law principles, and the UN Convention on Contracts\nfor the International Sale of Goods does not apply to this Agreement. The courts of California shall have\nexclusive jurisdiction of any dispute arising out of this Agreement.",
  "modelfile": "# Modelfile generated by \"ollama show\"\n# To build a new Modelfile based on this, replace FROM with:\n# FROM dolphin3:8b\n\nFROM C:\\Users\\work\\.ollama\\models\\blobs\\sha256-1eee6953530837b2b17d61a4e6f71a5aa31c9714cfcf3cb141aa5c1972b5116b\nTEMPLATE \"\"\"{{- range $i, $_ := .Messages }}\n{{- $last := eq (len (slice $.Messages $i)) 1 -}}\n<|im_start|>{{ .Role }}\n{{ .Content }}{{ if not $last }}<|im_end|>\n{{ end }}\n{{- if and (ne .Role \"assistant\") $last }}<|im_end|>\n<|im_start|>assistant\n{{ end }}\n{{- end }}\"\"\"\nSYSTEM You are Dolphin, a helpful AI assistant.\nPARAMETER stop <|im_start|>\nPARAMETER stop <|im_end|>\nLICENSE \"LLAMA 3.1 COMMUNITY LICENSE AGREEMENT\nLlama 3.1 Version Release Date: July 23, 2024\n\n“Agreement” means the terms and conditions for use, reproduction, distribution and modification of the\nLlama Materials set forth herein.\n\n“Documentation” means the specifications, manuals and documentation accompanying Llama 3.1\ndistributed by Meta at https://llama.meta.com/doc/overview.\n\n“Licensee” or “you” means you, or your employer or any other person or entity (if you are entering into\nthis Agreement on such person or entity’s behalf), of the age required under applicable laws, rules or\nregulations to provide legal consent and that has legal authority to bind your employer or such other\nperson or entity if you are entering in this Agreement on their behalf.\n\n“Llama 3.1” means the foundational large language models and software and algorithms, including\nmachine-learning model code, trained model weights, inference-enabling code, training-enabling code,\nfine-tuning enabling code and other elements of the foregoing distributed by Meta at\nhttps://llama.meta.com/llama-downloads.\n\n“Llama Materials” means, collectively, Meta’s proprietary Llama 3.1 and Documentation (and any\nportion thereof) made available under this Agreement.\n\n“Meta” or “we” means Meta Platforms Ireland Limited (if you are located in or, if you are an entity, your\nprincipal place of business is in the EEA or Switzerland) and Meta Platforms, Inc. (if you are located\noutside of the EEA or Switzerland).\n\nBy clicking “I Accept” below or by using or distributing any portion or element of the Llama Materials,\nyou agree to be bound by this Agreement.\n\n1. License Rights and Redistribution.\n\n  a. Grant of Rights. You are granted a non-exclusive, worldwide, non-transferable and royalty-free\nlimited license under Meta’s intellectual property or other rights owned by Meta embodied in the Llama\nMaterials to use, reproduce, distribute, copy, create derivative works of, and make modifications to the\nLlama Materials.\n\n  b. Redistribution and Use.\n\n      i. If you distribute or make available the Llama Materials (or any derivative works\nthereof), or a product or service (including another AI model) that contains any of them, you shall (A)\nprovide a copy of this Agreement with any such Llama Materials; and (B) prominently display “Built with\nLlama” on a related website, user interface, blogpost, about page, or product documentation. If you use\nthe Llama Materials or any outputs or results of the Llama Materials to create, train, fine tune, or\notherwise improve an AI model, which is distributed or made available, you shall also include “Llama” at\nthe beginning of any such AI model name.\n\n      ii. If you receive Llama Materials, or any derivative works thereof, from a Licensee as part \nof an integrated end user product, then Section 2 of this Agreement will not apply to you.\n\n      iii. You must retain in all copies of the Llama Materials that you distribute the following\nattribution notice within a “Notice” text file distributed as a part of such copies: “Llama 3.1 is\nlicensed under the Llama 3.1 Community License, Copyright © Meta Platforms, Inc. All Rights\nReserved.”\n\n      iv. Your use of the Llama Materials must comply with applicable laws and regulations\n(including trade compliance laws and regulations) and adhere to the Acceptable Use Policy for the Llama\nMaterials (available at https://llama.meta.com/llama3_1/use-policy), which is hereby incorporated by\nreference into this Agreement.\n\n2. Additional Commercial Terms. If, on the Llama 3.1 version release date, the monthly active users\nof the products or services made available by or for Licensee, or Licensee’s affiliates, is greater than 700\nmillion monthly active users in the preceding calendar month, you must request a license from Meta,\nwhich Meta may grant to you in its sole discretion, and you are not authorized to exercise any of the\nrights under this Agreement unless or until Meta otherwise expressly grants you such rights.\n\n3. Disclaimer of Warranty. UNLESS REQUIRED BY APPLICABLE LAW, THE LLAMA MATERIALS AND ANY\nOUTPUT AND RESULTS THEREFROM ARE PROVIDED ON AN “AS IS” BASIS, WITHOUT WARRANTIES OF\nANY KIND, AND META DISCLAIMS ALL WARRANTIES OF ANY KIND, BOTH EXPRESS AND IMPLIED,\nINCLUDING, WITHOUT LIMITATION, ANY WARRANTIES OF TITLE, NON-INFRINGEMENT,\nMERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. YOU ARE SOLELY RESPONSIBLE FOR\nDETERMINING THE APPROPRIATENESS OF USING OR REDISTRIBUTING THE LLAMA MATERIALS AND\nASSUME ANY RISKS ASSOCIATED WITH YOUR USE OF THE LLAMA MATERIALS AND ANY OUTPUT AND\nRESULTS.\n\n4. Limitation of Liability. IN NO EVENT WILL META OR ITS AFFILIATES BE LIABLE UNDER ANY THEORY OF\nLIABILITY, WHETHER IN CONTRACT, TORT, NEGLIGENCE, PRODUCTS LIABILITY, OR OTHERWISE, ARISING\nOUT OF THIS AGREEMENT, FOR ANY LOST PROFITS OR ANY INDIRECT, SPECIAL, CONSEQUENTIAL,\nINCIDENTAL, EXEMPLARY OR PUNITIVE DAMAGES, EVEN IF META OR ITS AFFILIATES HAVE BEEN ADVISED\nOF THE POSSIBILITY OF ANY OF THE FOREGOING.\n\n5. Intellectual Property.\n\n  a. No trademark licenses are granted under this Agreement, and in connection with the Llama\nMaterials, neither Meta nor Licensee may use any name or mark owned by or associated with the other\nor any of its affiliates, except as required for reasonable and customary use in describing and\nredistributing the Llama Materials or as set forth in this Section 5(a). Meta hereby grants you a license to\nuse “Llama” (the “Mark”) solely as required to comply with the last sentence of Section 1.b.i. You will\ncomply with Meta’s brand guidelines (currently accessible at\nhttps://about.meta.com/brand/resources/meta/company-brand/ ). All goodwill arising out of your use\nof the Mark will inure to the benefit of Meta.\n\n  b. Subject to Meta’s ownership of Llama Materials and derivatives made by or for Meta, with\nrespect to any derivative works and modifications of the Llama Materials that are made by you, as\nbetween you and Meta, you are and will be the owner of such derivative works and modifications.\n\n  c. If you institute litigation or other proceedings against Meta or any entity (including a\ncross-claim or counterclaim in a lawsuit) alleging that the Llama Materials or Llama 3.1 outputs or\nresults, or any portion of any of the foregoing, constitutes infringement of intellectual property or other\nrights owned or licensable by you, then any licenses granted to you under this Agreement shall\nterminate as of the date such litigation or claim is filed or instituted. You will indemnify and hold\nharmless Meta from and against any claim by any third party arising out of or related to your use or\ndistribution of the Llama Materials.\n\n6. Term and Termination. The term of this Agreement will commence upon your acceptance of this\nAgreement or access to the Llama Materials and will continue in full force and effect until terminated in\naccordance with the terms and conditions herein. Meta may terminate this Agreement if you are in\nbreach of any term or condition of this Agreement. Upon termination of this Agreement, you shall delete\nand cease use of the Llama Materials. Sections 3, 4 and 7 shall survive the termination of this\nAgreement.\n\n7. Governing Law and Jurisdiction. This Agreement will be governed and construed under the laws of\nthe State of California without regard to choice of law principles, and the UN Convention on Contracts\nfor the International Sale of Goods does not apply to this Agreement. The courts of California shall have\nexclusive jurisdiction of any dispute arising out of this Agreement.\"\n",
  "parameters": "stop                           \"<|im_start|>\"\nstop                           \"<|im_end|>\"",
  "template": "{{- range $i, $_ := .Messages }}\n{{- $last := eq (len (slice $.Messages $i)) 1 -}}\n<|im_start|>{{ .Role }}\n{{ .Content }}{{ if not $last }}<|im_end|>\n{{ end }}\n{{- if and (ne .Role \"assistant\") $last }}<|im_end|>\n<|im_start|>assistant\n{{ end }}\n{{- end }}",
  "system": "You are Dolphin, a helpful AI assistant.",
  "details": {
    "parent_model": "",
    "format": "gguf",
    "family": "llama",
    "families": [
      "llama"
    ],
    "parameter_size": "8.0B",
    "quantization_level": "Q4_K_M"
  },
  "model_info": {
    "general.architecture": "llama",
    "general.base_model.0.name": "Llama 3.1 8B",
    "general.base_model.0.organization": "Meta Llama",
    "general.base_model.0.repo_url": "https://huggingface.co/meta-llama/Llama-3.1-8B",
    "general.base_model.count": 1,
    "general.basename": "Dolphin-3.0-Llama-3.1",
    "general.dataset.0.name": "Opc Sft Stage1",
    "general.dataset.0.organization": "OpenCoder LLM",
    "general.dataset.0.repo_url": "https://huggingface.co/OpenCoder-LLM/opc-sft-stage1",
    "general.dataset.1.name": "Opc Sft Stage2",
    "general.dataset.1.organization": "OpenCoder LLM",
    "general.dataset.1.repo_url": "https://huggingface.co/OpenCoder-LLM/opc-sft-stage2",
    "general.dataset.10.name": "Samantha Data",
    "general.dataset.10.organization": "Cognitivecomputations",
    "general.dataset.10.repo_url": "https://huggingface.co/cognitivecomputations/samantha-data",
    "general.dataset.11.name": "CodeFeedback Filtered Instruction",
    "general.dataset.11.organization": "M A P",
    "general.dataset.11.repo_url": "https://huggingface.co/m-a-p/CodeFeedback-Filtered-Instruction",
    "general.dataset.12.name": "Code Feedback",
    "general.dataset.12.organization": "M A P",
    "general.dataset.12.repo_url": "https://huggingface.co/m-a-p/Code-Feedback",
    "general.dataset.2.name": "Orca Agentinstruct 1M v1",
    "general.dataset.2.organization": "Microsoft",
    "general.dataset.2.repo_url": "https://huggingface.co/microsoft/orca-agentinstruct-1M-v1",
    "general.dataset.2.version": "v1",
    "general.dataset.3.name": "Orca Math Word Problems 200k",
    "general.dataset.3.organization": "Microsoft",
    "general.dataset.3.repo_url": "https://huggingface.co/microsoft/orca-math-word-problems-200k",
    "general.dataset.4.name": "Hermes Function Calling v1",
    "general.dataset.4.organization": "NousResearch",
    "general.dataset.4.repo_url": "https://huggingface.co/NousResearch/hermes-function-calling-v1",
    "general.dataset.4.version": "v1",
    "general.dataset.5.name": "NuminaMath CoT",
    "general.dataset.5.organization": "AI MO",
    "general.dataset.5.repo_url": "https://huggingface.co/AI-MO/NuminaMath-CoT",
    "general.dataset.6.name": "NuminaMath TIR",
    "general.dataset.6.organization": "AI MO",
    "general.dataset.6.repo_url": "https://huggingface.co/AI-MO/NuminaMath-TIR",
    "general.dataset.7.name": "Tulu 3 Sft Mixture",
    "general.dataset.7.organization": "Allenai",
    "general.dataset.7.repo_url": "https://huggingface.co/allenai/tulu-3-sft-mixture",
    "general.dataset.8.name": "Dolphin Coder",
    "general.dataset.8.organization": "Cognitivecomputations",
    "general.dataset.8.repo_url": "https://huggingface.co/cognitivecomputations/dolphin-coder",
    "general.dataset.9.name": "Smoltalk",
    "general.dataset.9.organization": "HuggingFaceTB",
    "general.dataset.9.repo_url": "https://huggingface.co/HuggingFaceTB/smoltalk",
    "general.dataset.count": 13,
    "general.file_type": 15,
    "general.languages": null,
    "general.license": "llama3.1",
    "general.organization": "Cognitivecomputations",
    "general.parameter_count": 8030277696,
    "general.quantization_version": 2,
    "general.size_label": "8B",
    "general.type": "model",
    "llama.attention.head_count": 32,
    "llama.attention.head_count_kv": 8,
    "llama.attention.key_length": 128,
    "llama.attention.layer_norm_rms_epsilon": 0.00001,
    "llama.attention.value_length": 128,
    "llama.block_count": 32,
    "llama.context_length": 131072,
    "llama.embedding_length": 4096,
    "llama.feed_forward_length": 14336,
    "llama.rope.dimension_count": 128,
    "llama.rope.freq_base": 500000,
    "llama.vocab_size": 128258,
    "tokenizer.ggml.bos_token_id": 128000,
    "tokenizer.ggml.eos_token_id": 128256,
    "tokenizer.ggml.merges": null,
    "tokenizer.ggml.model": "gpt2",
    "tokenizer.ggml.padding_token_id": 128001,
    "tokenizer.ggml.pre": "llama-bpe",
    "tokenizer.ggml.token_type": null,
    "tokenizer.ggml.tokens": null
  },
  "tensors": [
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
        4096,
        128258
      ]
    },
    {
      "name": "blk.0.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.0.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.0.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.0.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.0.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.0.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.0.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.0.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.0.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.1.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.1.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.1.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.1.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.1.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.1.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.1.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.1.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.1.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.2.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.2.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.2.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.2.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.2.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.2.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.2.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.2.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.2.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.3.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.3.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.3.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.3.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.3.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.3.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.3.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.3.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.3.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.4.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.4.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.4.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.4.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.4.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.4.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.4.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.4.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.4.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.5.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.5.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.5.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.5.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.5.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.5.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.5.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.5.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.5.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.6.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.6.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.6.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.6.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.6.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.6.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.6.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.6.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.6.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.7.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.7.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.7.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.7.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.7.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.7.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.7.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.7.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.7.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.8.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.8.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.8.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.8.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.8.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.8.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.8.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.8.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.8.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.10.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.10.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.10.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.10.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.10.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.10.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.10.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.10.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.10.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.11.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.11.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.11.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.11.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.11.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.11.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.11.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.11.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.11.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.12.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.12.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.12.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.12.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.12.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.12.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.12.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.12.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.12.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.13.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.13.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.13.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.13.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.13.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.13.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.13.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.13.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.13.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.14.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.14.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.14.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.14.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.14.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.14.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.14.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.14.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.14.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.15.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.15.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.15.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.15.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.15.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.15.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.15.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.15.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.15.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.16.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.16.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.16.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.16.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.16.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.16.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.16.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.16.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.16.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.17.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.17.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.17.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.17.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.17.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.17.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.17.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.17.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.17.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.18.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.18.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.18.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.18.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.18.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.18.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.18.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.18.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.18.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.19.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.19.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.19.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.19.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.19.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.19.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.19.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.19.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.19.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.20.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.20.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.20.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.20.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.20.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.9.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.9.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.9.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.9.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.9.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.9.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.9.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.9.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.9.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.20.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.20.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.20.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.20.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.21.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.21.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.21.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.21.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.21.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.21.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.21.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.21.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.21.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.22.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.22.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.22.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.22.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.22.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.22.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.22.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.22.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.22.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.23.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.23.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.23.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.23.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.23.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.23.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.23.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.23.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.23.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.24.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.24.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.24.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.24.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.24.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.24.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.24.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.24.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.24.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.25.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.25.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.25.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.25.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.25.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.25.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.25.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.25.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.25.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.26.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.26.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.26.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.26.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.26.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.26.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.26.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.26.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.26.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.27.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.27.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.27.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.27.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.27.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.27.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.27.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.27.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.27.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.28.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.28.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.28.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.28.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.28.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.28.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.28.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.28.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.28.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.29.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.29.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.29.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.29.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.29.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.29.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.29.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.29.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.29.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.30.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.30.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.30.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.30.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.30.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.30.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.30.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.30.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.30.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.31.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.31.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        14336
      ]
    },
    {
      "name": "blk.31.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.31.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.31.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.31.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "output.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        128258
      ]
    },
    {
      "name": "blk.31.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.31.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        14336,
        4096
      ]
    },
    {
      "name": "blk.31.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "output_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    }
  ],
  "capabilities": [
    "completion"
  ],
  "modified_at": "2025-07-21T22:00:52.2303758+02:00"
}
```
