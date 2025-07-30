# ollama_show, ollama_show_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.4

ollama_show "gemma3:1b"

```
  Model
    architecture        gemma3     
    parameters          999.89M    
    context length      32768      
    embedding length    1152       
    quantization        Q4_K_M     

  Capabilities
    completion    

  Parameters
    stop           "<end_of_turn>"    
    temperature    1                  
    top_k          64                 
    top_p          0.95               

  License
    Gemma Terms of Use                  
    Last modified: February 21, 2024    
    ...                                 

```


ollama_show_json "gemma3:1b"

```
{
  "license": "Gemma Terms of Use \n\nLast modified: February 21, 2024\n\nBy using, reproducing, modifying, distributing, performing or displaying any portion or element of Gemma, Model Derivatives including via any Hosted Service, (each as defined below) (collectively, the \"Gemma Services\") or otherwise accepting the terms of this Agreement, you agree to be bound by this Agreement.\n\nSection 1: DEFINITIONS\n1.1 Definitions\n(a) \"Agreement\" or \"Gemma Terms of Use\" means these terms and conditions that govern the use, reproduction, Distribution or modification of the Gemma Services and any terms and conditions incorporated by reference.\n\n(b) \"Distribution\" or \"Distribute\" means any transmission, publication, or other sharing of Gemma or Model Derivatives to a third party, including by providing or making Gemma or its functionality available as a hosted service via API, web access, or any other electronic or remote means (\"Hosted Service\").\n\n(c) \"Gemma\" means the set of machine learning language models, trained model weights and parameters identified at ai.google.dev/gemma, regardless of the source that you obtained it from.\n\n(d) \"Google\" means Google LLC.\n\n(e) \"Model Derivatives\" means all (i) modifications to Gemma, (ii) works based on Gemma, or (iii) any other machine learning model which is created by transfer of patterns of the weights, parameters, operations, or Output of Gemma, to that model in order to cause that model to perform similarly to Gemma, including distillation methods that use intermediate data representations or methods based on the generation of synthetic data Outputs by Gemma for training that model. For clarity, Outputs are not deemed Model Derivatives.\n\n(f) \"Output\" means the information content output of Gemma or a Model Derivative that results from operating or otherwise using Gemma or the Model Derivative, including via a Hosted Service.\n\n1.2\nAs used in this Agreement, \"including\" means \"including without limitation\".\n\nSection 2: ELIGIBILITY AND USAGE\n2.1 Eligibility\nYou represent and warrant that you have the legal capacity to enter into this Agreement (including being of sufficient age of consent). If you are accessing or using any of the Gemma Services for or on behalf of a legal entity, (a) you are entering into this Agreement on behalf of yourself and that legal entity, (b) you represent and warrant that you have the authority to act on behalf of and bind that entity to this Agreement and (c) references to \"you\" or \"your\" in the remainder of this Agreement refers to both you (as an individual) and that entity.\n\n2.2 Use\nYou may use, reproduce, modify, Distribute, perform or display any of the Gemma Services only in accordance with the terms of this Agreement, and must not violate (or encourage or permit anyone else to violate) any term of this Agreement.\n\nSection 3: DISTRIBUTION AND RESTRICTIONS\n3.1 Distribution and Redistribution\nYou may reproduce or Distribute copies of Gemma or Model Derivatives if you meet all of the following conditions:\n\nYou must include the use restrictions referenced in Section 3.2 as an enforceable provision in any agreement (e.g., license agreement, terms of use, etc.) governing the use and/or distribution of Gemma or Model Derivatives and you must provide notice to subsequent users you Distribute to that Gemma or Model Derivatives are subject to the use restrictions in Section 3.2.\nYou must provide all third party recipients of Gemma or Model Derivatives a copy of this Agreement.\nYou must cause any modified files to carry prominent notices stating that you modified the files.\nAll Distributions (other than through a Hosted Service) must be accompanied by a \"Notice\" text file that contains the following notice: \"Gemma is provided under and subject to the Gemma Terms of Use found at ai.google.dev/gemma/terms\".\nYou may add your own intellectual property statement to your modifications and, except as set forth in this Section, may provide additional or different terms and conditions for use, reproduction, or Distribution of your modifications, or for any such Model Derivatives as a whole, provided your use, reproduction, modification, Distribution, performance, and display of Gemma otherwise complies with the terms and conditions of this Agreement. Any additional or different terms and conditions you impose must not conflict with the terms of this Agreement.\n\n3.2 Use Restrictions\nYou must not use any of the Gemma Services:\n\nfor the restricted uses set forth in the Gemma Prohibited Use Policy at ai.google.dev/gemma/prohibited_use_policy (\"Prohibited Use Policy\"), which is hereby incorporated by reference into this Agreement; or\nin violation of applicable laws and regulations.\nTo the maximum extent permitted by law, Google reserves the right to restrict (remotely or otherwise) usage of any of the Gemma Services that Google reasonably believes are in violation of this Agreement.\n\n3.3 Generated Output\nGoogle claims no rights in Outputs you generate using Gemma. You and your users are solely responsible for Outputs and their subsequent uses.\n\nSection 4: ADDITIONAL PROVISIONS\n4.1 Updates\nGoogle may update Gemma from time to time, and you must make reasonable efforts to use the latest version of Gemma.\n\n4.2 Trademarks\nNothing in this Agreement grants you any rights to use Google's trademarks, trade names, logos or to otherwise suggest endorsement or misrepresent the relationship between you and Google. Google reserves any rights not expressly granted herein.\n\n4.3 DISCLAIMER OF WARRANTY\nUNLESS REQUIRED BY APPLICABLE LAW, THE GEMMA SERVICES, AND OUTPUTS, ARE PROVIDED ON AN \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY WARRANTIES OR CONDITIONS OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. YOU ARE SOLELY RESPONSIBLE FOR DETERMINING THE APPROPRIATENESS OF USING, REPRODUCING, MODIFYING, PERFORMING, DISPLAYING OR OR DISTRIBUTING ANY OF THE GEMMA SERVICES OR OUTPUTS AND ASSUME ANY AND ALL RISKS ASSOCIATED WITH YOUR USE OR DISTRIBUTION OF ANY OF THE GEMMA SERVICES OR OUTPUTS AND YOUR EXERCISE OF RIGHTS AND PERMISSIONS UNDER THIS AGREEMENT.\n\n4.4 LIMITATION OF LIABILITY\nTO THE FULLEST EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT AND UNDER NO LEGAL THEORY, WHETHER IN TORT (INCLUDING NEGLIGENCE), PRODUCT LIABILITY, CONTRACT, OR OTHERWISE, UNLESS REQUIRED BY APPLICABLE LAW, SHALL GOOGLE OR ITS AFFILIATES BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY DIRECT, INDIRECT, SPECIAL, INCIDENTAL, EXEMPLARY, CONSEQUENTIAL, OR PUNITIVE DAMAGES, OR LOST PROFITS OF ANY KIND ARISING FROM THIS AGREEMENT OR RELATED TO, ANY OF THE GEMMA SERVICES OR OUTPUTS EVEN IF GOOGLE OR ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.\n\n4.5 Term, Termination, and Survival\nThe term of this Agreement will commence upon your acceptance of this Agreement (including acceptance by your use, modification, or Distribution, reproduction, performance or display of any portion or element of the Gemma Services) and will continue in full force and effect until terminated in accordance with the terms of this Agreement. Google may terminate this Agreement if you are in breach of any term of this Agreement. Upon termination of this Agreement, you must delete and cease use and Distribution of all copies of Gemma and Model Derivatives in your possession or control. Sections 1, 2.1, 3.3, 4.2 to 4.9 shall survive the termination of this Agreement.\n\n4.6 Governing Law and Jurisdiction\nThis Agreement will be governed by the laws of the State of California without regard to choice of law principles. The UN Convention on Contracts for the International Sale of Goods does not apply to this Agreement. The state and federal courts of Santa Clara County, California shall have exclusive jurisdiction of any dispute arising out of this Agreement.\n\n4.7 Severability\nIf any provision of this Agreement is held to be invalid, illegal or unenforceable, the remaining provisions shall be unaffected thereby and remain valid as if such provision had not been set forth herein.\n\n4.8 Entire Agreement\nThis Agreement states all the terms agreed between the parties and supersedes all other agreements between the parties as of the date of acceptance relating to its subject matter.\n\n4.9 No Waiver\nGoogle will not be treated as having waived any rights by not exercising (or delaying the exercise of) any rights under this Agreement.\n",
  "modelfile": "# Modelfile generated by \"ollama show\"\n# To build a new Modelfile based on this, replace FROM with:\n# FROM gemma3:1b\n\nFROM /Users/davidbarberi/.ollama/models/blobs/sha256-7cd4618c1faf8b7233c6c906dac1694b6a47684b37b8895d470ac688520b9c01\nTEMPLATE \"\"\"{{- range $i, $_ := .Messages }}\n{{- $last := eq (len (slice $.Messages $i)) 1 }}\n{{- if or (eq .Role \"user\") (eq .Role \"system\") }}<start_of_turn>user\n{{ .Content }}<end_of_turn>\n{{ if $last }}<start_of_turn>model\n{{ end }}\n{{- else if eq .Role \"assistant\" }}<start_of_turn>model\n{{ .Content }}{{ if not $last }}<end_of_turn>\n{{ end }}\n{{- end }}\n{{- end }}\"\"\"\nPARAMETER stop <end_of_turn>\nPARAMETER temperature 1\nPARAMETER top_k 64\nPARAMETER top_p 0.95\nLICENSE \"\"\"Gemma Terms of Use \n\nLast modified: February 21, 2024\n\nBy using, reproducing, modifying, distributing, performing or displaying any portion or element of Gemma, Model Derivatives including via any Hosted Service, (each as defined below) (collectively, the \"Gemma Services\") or otherwise accepting the terms of this Agreement, you agree to be bound by this Agreement.\n\nSection 1: DEFINITIONS\n1.1 Definitions\n(a) \"Agreement\" or \"Gemma Terms of Use\" means these terms and conditions that govern the use, reproduction, Distribution or modification of the Gemma Services and any terms and conditions incorporated by reference.\n\n(b) \"Distribution\" or \"Distribute\" means any transmission, publication, or other sharing of Gemma or Model Derivatives to a third party, including by providing or making Gemma or its functionality available as a hosted service via API, web access, or any other electronic or remote means (\"Hosted Service\").\n\n(c) \"Gemma\" means the set of machine learning language models, trained model weights and parameters identified at ai.google.dev/gemma, regardless of the source that you obtained it from.\n\n(d) \"Google\" means Google LLC.\n\n(e) \"Model Derivatives\" means all (i) modifications to Gemma, (ii) works based on Gemma, or (iii) any other machine learning model which is created by transfer of patterns of the weights, parameters, operations, or Output of Gemma, to that model in order to cause that model to perform similarly to Gemma, including distillation methods that use intermediate data representations or methods based on the generation of synthetic data Outputs by Gemma for training that model. For clarity, Outputs are not deemed Model Derivatives.\n\n(f) \"Output\" means the information content output of Gemma or a Model Derivative that results from operating or otherwise using Gemma or the Model Derivative, including via a Hosted Service.\n\n1.2\nAs used in this Agreement, \"including\" means \"including without limitation\".\n\nSection 2: ELIGIBILITY AND USAGE\n2.1 Eligibility\nYou represent and warrant that you have the legal capacity to enter into this Agreement (including being of sufficient age of consent). If you are accessing or using any of the Gemma Services for or on behalf of a legal entity, (a) you are entering into this Agreement on behalf of yourself and that legal entity, (b) you represent and warrant that you have the authority to act on behalf of and bind that entity to this Agreement and (c) references to \"you\" or \"your\" in the remainder of this Agreement refers to both you (as an individual) and that entity.\n\n2.2 Use\nYou may use, reproduce, modify, Distribute, perform or display any of the Gemma Services only in accordance with the terms of this Agreement, and must not violate (or encourage or permit anyone else to violate) any term of this Agreement.\n\nSection 3: DISTRIBUTION AND RESTRICTIONS\n3.1 Distribution and Redistribution\nYou may reproduce or Distribute copies of Gemma or Model Derivatives if you meet all of the following conditions:\n\nYou must include the use restrictions referenced in Section 3.2 as an enforceable provision in any agreement (e.g., license agreement, terms of use, etc.) governing the use and/or distribution of Gemma or Model Derivatives and you must provide notice to subsequent users you Distribute to that Gemma or Model Derivatives are subject to the use restrictions in Section 3.2.\nYou must provide all third party recipients of Gemma or Model Derivatives a copy of this Agreement.\nYou must cause any modified files to carry prominent notices stating that you modified the files.\nAll Distributions (other than through a Hosted Service) must be accompanied by a \"Notice\" text file that contains the following notice: \"Gemma is provided under and subject to the Gemma Terms of Use found at ai.google.dev/gemma/terms\".\nYou may add your own intellectual property statement to your modifications and, except as set forth in this Section, may provide additional or different terms and conditions for use, reproduction, or Distribution of your modifications, or for any such Model Derivatives as a whole, provided your use, reproduction, modification, Distribution, performance, and display of Gemma otherwise complies with the terms and conditions of this Agreement. Any additional or different terms and conditions you impose must not conflict with the terms of this Agreement.\n\n3.2 Use Restrictions\nYou must not use any of the Gemma Services:\n\nfor the restricted uses set forth in the Gemma Prohibited Use Policy at ai.google.dev/gemma/prohibited_use_policy (\"Prohibited Use Policy\"), which is hereby incorporated by reference into this Agreement; or\nin violation of applicable laws and regulations.\nTo the maximum extent permitted by law, Google reserves the right to restrict (remotely or otherwise) usage of any of the Gemma Services that Google reasonably believes are in violation of this Agreement.\n\n3.3 Generated Output\nGoogle claims no rights in Outputs you generate using Gemma. You and your users are solely responsible for Outputs and their subsequent uses.\n\nSection 4: ADDITIONAL PROVISIONS\n4.1 Updates\nGoogle may update Gemma from time to time, and you must make reasonable efforts to use the latest version of Gemma.\n\n4.2 Trademarks\nNothing in this Agreement grants you any rights to use Google's trademarks, trade names, logos or to otherwise suggest endorsement or misrepresent the relationship between you and Google. Google reserves any rights not expressly granted herein.\n\n4.3 DISCLAIMER OF WARRANTY\nUNLESS REQUIRED BY APPLICABLE LAW, THE GEMMA SERVICES, AND OUTPUTS, ARE PROVIDED ON AN \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY WARRANTIES OR CONDITIONS OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. YOU ARE SOLELY RESPONSIBLE FOR DETERMINING THE APPROPRIATENESS OF USING, REPRODUCING, MODIFYING, PERFORMING, DISPLAYING OR OR DISTRIBUTING ANY OF THE GEMMA SERVICES OR OUTPUTS AND ASSUME ANY AND ALL RISKS ASSOCIATED WITH YOUR USE OR DISTRIBUTION OF ANY OF THE GEMMA SERVICES OR OUTPUTS AND YOUR EXERCISE OF RIGHTS AND PERMISSIONS UNDER THIS AGREEMENT.\n\n4.4 LIMITATION OF LIABILITY\nTO THE FULLEST EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT AND UNDER NO LEGAL THEORY, WHETHER IN TORT (INCLUDING NEGLIGENCE), PRODUCT LIABILITY, CONTRACT, OR OTHERWISE, UNLESS REQUIRED BY APPLICABLE LAW, SHALL GOOGLE OR ITS AFFILIATES BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY DIRECT, INDIRECT, SPECIAL, INCIDENTAL, EXEMPLARY, CONSEQUENTIAL, OR PUNITIVE DAMAGES, OR LOST PROFITS OF ANY KIND ARISING FROM THIS AGREEMENT OR RELATED TO, ANY OF THE GEMMA SERVICES OR OUTPUTS EVEN IF GOOGLE OR ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.\n\n4.5 Term, Termination, and Survival\nThe term of this Agreement will commence upon your acceptance of this Agreement (including acceptance by your use, modification, or Distribution, reproduction, performance or display of any portion or element of the Gemma Services) and will continue in full force and effect until terminated in accordance with the terms of this Agreement. Google may terminate this Agreement if you are in breach of any term of this Agreement. Upon termination of this Agreement, you must delete and cease use and Distribution of all copies of Gemma and Model Derivatives in your possession or control. Sections 1, 2.1, 3.3, 4.2 to 4.9 shall survive the termination of this Agreement.\n\n4.6 Governing Law and Jurisdiction\nThis Agreement will be governed by the laws of the State of California without regard to choice of law principles. The UN Convention on Contracts for the International Sale of Goods does not apply to this Agreement. The state and federal courts of Santa Clara County, California shall have exclusive jurisdiction of any dispute arising out of this Agreement.\n\n4.7 Severability\nIf any provision of this Agreement is held to be invalid, illegal or unenforceable, the remaining provisions shall be unaffected thereby and remain valid as if such provision had not been set forth herein.\n\n4.8 Entire Agreement\nThis Agreement states all the terms agreed between the parties and supersedes all other agreements between the parties as of the date of acceptance relating to its subject matter.\n\n4.9 No Waiver\nGoogle will not be treated as having waived any rights by not exercising (or delaying the exercise of) any rights under this Agreement.\n\"\"\"\n",
  "parameters": "stop                           \"<end_of_turn>\"\ntemperature                    1\ntop_k                          64\ntop_p                          0.95",
  "template": "{{- range $i, $_ := .Messages }}\n{{- $last := eq (len (slice $.Messages $i)) 1 }}\n{{- if or (eq .Role \"user\") (eq .Role \"system\") }}<start_of_turn>user\n{{ .Content }}<end_of_turn>\n{{ if $last }}<start_of_turn>model\n{{ end }}\n{{- else if eq .Role \"assistant\" }}<start_of_turn>model\n{{ .Content }}{{ if not $last }}<end_of_turn>\n{{ end }}\n{{- end }}\n{{- end }}",
  "details": {
    "parent_model": "",
    "format": "gguf",
    "family": "gemma3",
    "families": [
      "gemma3"
    ],
    "parameter_size": "999.89M",
    "quantization_level": "Q4_K_M"
  },
  "model_info": {
    "gemma3.attention.head_count": 4,
    "gemma3.attention.head_count_kv": 1,
    "gemma3.attention.key_length": 256,
    "gemma3.attention.layer_norm_rms_epsilon": 0.000001,
    "gemma3.attention.sliding_window": 512,
    "gemma3.attention.value_length": 256,
    "gemma3.block_count": 26,
    "gemma3.context_length": 32768,
    "gemma3.embedding_length": 1152,
    "gemma3.feed_forward_length": 6912,
    "gemma3.final_logit_softcapping": 30,
    "gemma3.rope.global.freq_base": 1000000,
    "gemma3.rope.local.freq_base": 10000,
    "general.architecture": "gemma3",
    "general.file_type": 15,
    "general.parameter_count": 999885952,
    "general.quantization_version": 2,
    "tokenizer.ggml.add_bos_token": true,
    "tokenizer.ggml.add_eos_token": false,
    "tokenizer.ggml.add_padding_token": false,
    "tokenizer.ggml.add_unknown_token": false,
    "tokenizer.ggml.bos_token_id": 2,
    "tokenizer.ggml.eos_token_id": 1,
    "tokenizer.ggml.merges": null,
    "tokenizer.ggml.model": "llama",
    "tokenizer.ggml.padding_token_id": 0,
    "tokenizer.ggml.pre": "default",
    "tokenizer.ggml.scores": null,
    "tokenizer.ggml.token_type": null,
    "tokenizer.ggml.tokens": null,
    "tokenizer.ggml.unknown_token_id": 3
  },
  "tensors": [
    {
      "name": "output_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "token_embd.weight",
      "type": "Q8_0",
      "shape": [
        1152,
        262144
      ]
    },
    {
      "name": "blk.0.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.0.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.0.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.0.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.0.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.0.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.0.attn_v.weight",
      "type": "Q8_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.0.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.0.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.0.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.0.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.0.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.0.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.1.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.1.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.1.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.1.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.1.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.1.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.1.attn_v.weight",
      "type": "Q8_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.1.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.1.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.1.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.1.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.1.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.1.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.2.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.2.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.2.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.2.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.2.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.2.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.2.attn_v.weight",
      "type": "Q8_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.2.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.2.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.2.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.2.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.2.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.2.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.3.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.3.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.3.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.3.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.3.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.3.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.3.attn_v.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.3.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.3.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.3.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.3.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.3.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.3.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.4.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.4.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.4.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.4.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.4.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.4.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.4.attn_v.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.4.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.4.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.4.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.4.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.4.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.4.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.5.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.5.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.5.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.5.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.5.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.5.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.5.attn_v.weight",
      "type": "Q8_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.5.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.5.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.5.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.5.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.5.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.5.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.6.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.6.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.6.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.6.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.6.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.6.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.6.attn_v.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.6.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.6.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.6.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.6.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.6.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.6.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.7.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.7.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.7.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.7.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.7.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.7.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.7.attn_v.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.7.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.7.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.7.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.7.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.7.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.7.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.8.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.8.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.8.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.8.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.8.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.8.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.8.attn_v.weight",
      "type": "Q8_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.8.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.8.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.8.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.8.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.8.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.8.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.9.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.9.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.9.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.9.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.9.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.9.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.9.attn_v.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.9.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.9.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.9.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.9.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.9.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.9.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.10.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.10.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.10.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.10.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.10.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.10.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.10.attn_v.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.10.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.10.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.10.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.10.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.10.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.10.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.11.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.11.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.11.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.11.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.11.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.11.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.11.attn_v.weight",
      "type": "Q8_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.11.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.11.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.11.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.11.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.11.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.11.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.12.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.12.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.12.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.12.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.12.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.12.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.12.attn_v.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.12.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.12.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.12.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.12.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.12.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.12.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.13.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.13.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.13.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.13.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.13.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.13.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.13.attn_v.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.13.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.13.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.13.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.13.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.13.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.13.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.14.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.14.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.14.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.14.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.14.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.14.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.14.attn_v.weight",
      "type": "Q8_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.14.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.14.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.14.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.14.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.14.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.14.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.15.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.15.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.15.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.15.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.15.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.15.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.15.attn_v.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.15.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.15.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.15.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.15.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.15.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.15.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.16.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.16.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.16.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.16.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.16.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.16.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.16.attn_v.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.16.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.16.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.16.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.16.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.16.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.16.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.17.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.17.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.17.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.17.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.17.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.17.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.17.attn_v.weight",
      "type": "Q8_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.17.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.17.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.17.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.17.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.17.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.17.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.18.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.18.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.18.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.18.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.18.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.18.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.18.attn_v.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.18.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.18.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.18.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.18.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.18.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.18.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.19.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.19.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.19.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.19.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.19.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.19.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.19.attn_v.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.19.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.19.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.19.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.19.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.19.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.19.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.20.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.20.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.20.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.20.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.20.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.20.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.20.attn_v.weight",
      "type": "Q8_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.20.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.20.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.20.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.20.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.20.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.20.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.21.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.21.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.21.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.21.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.21.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.21.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.21.attn_v.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.21.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.21.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.21.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.21.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.21.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.21.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.22.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.22.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.22.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.22.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.22.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.22.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.22.attn_v.weight",
      "type": "Q8_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.22.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.22.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.22.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.22.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.22.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.22.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.23.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.23.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.23.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.23.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.23.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.23.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.23.attn_v.weight",
      "type": "Q8_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.23.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.23.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.23.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.23.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.23.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.23.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.24.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.24.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.24.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.24.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.24.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.24.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.24.attn_v.weight",
      "type": "Q8_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.24.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.24.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.24.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.24.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.24.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.24.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.25.attn_k.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.25.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.25.attn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.25.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        1024,
        1152
      ]
    },
    {
      "name": "blk.25.attn_q.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        1024
      ]
    },
    {
      "name": "blk.25.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.25.attn_v.weight",
      "type": "Q8_0",
      "shape": [
        1152,
        256
      ]
    },
    {
      "name": "blk.25.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        6912,
        1152
      ]
    },
    {
      "name": "blk.25.ffn_gate.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.25.ffn_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.25.ffn_up.weight",
      "type": "Q5_0",
      "shape": [
        1152,
        6912
      ]
    },
    {
      "name": "blk.25.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    },
    {
      "name": "blk.25.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        1152
      ]
    }
  ],
  "capabilities": [
    "completion"
  ],
  "modified_at": "2025-06-08T12:54:43.830884512+02:00"
}
```
