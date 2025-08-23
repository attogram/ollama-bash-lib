# ollama_show, ollama_show_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

ollama_show -m "gemma3n:e2b"

```
  Model
    architecture        gemma3n    
    parameters          4.5B       
    context length      32768      
    embedding length    2048       
    quantization        Q4_K_M     

  Capabilities
    completion    

  License
    Gemma Terms of Use               
    Last modified: March 24, 2025    
    ...                              

```


ollama_show_json -m "gemma3n:e2b"

```json
{
  "license": "Gemma Terms of Use\nLast modified: March 24, 2025\n\nBy using, reproducing, modifying, distributing, performing or displaying any portion or element of Gemma, Model Derivatives including via any Hosted Service, (each as defined below) (collectively, the \"Gemma Services\") or otherwise accepting the terms of this Agreement, you agree to be bound by this Agreement.\n\nSection 1: DEFINITIONS\n\n1.1 Definitions\n\n(a) \"Agreement\" or \"Gemma Terms of Use\" means these terms and conditions that govern the use, reproduction, Distribution or modification of the Gemma Services and any terms and conditions incorporated by reference.\n\n(b) \"Distribution\" or \"Distribute\" means any transmission, publication, or other sharing of Gemma or Model Derivatives to a third party, including by providing or making Gemma or its functionality available as a hosted service via API, web access, or any other electronic or remote means (\"Hosted Service\").\n\n(c) \"Gemma\" means the set of machine learning language models, trained model weights and parameters identified in the Appendix, regardless of the source that you obtained it from.\n\n(d) \"Google\" means Google LLC.\n\n(e) \"Model Derivatives\" means all (i) modifications to Gemma, (ii) works based on Gemma, or (iii) any other machine learning model which is created by transfer of patterns of the weights, parameters, operations, or Output of Gemma, to that model in order to cause that model to perform similarly to Gemma, including distillation methods that use intermediate data representations or methods based on the generation of synthetic data Outputs by Gemma for training that model. For clarity, Outputs are not deemed Model Derivatives.\n\n(f) \"Output\" means the information content output of Gemma or a Model Derivative that results from operating or otherwise using Gemma or the Model Derivative, including via a Hosted Service.\n\n1.2\n\nAs used in this Agreement, \"including\" means \"including without limitation\".\n\nSection 2: ELIGIBILITY AND USAGE\n\n2.1 Eligibility\n\nYou represent and warrant that you have the legal capacity to enter into this Agreement (including being of sufficient age of consent). If you are accessing or using any of the Gemma Services for or on behalf of a legal entity, (a) you are entering into this Agreement on behalf of yourself and that legal entity, (b) you represent and warrant that you have the authority to act on behalf of and bind that entity to this Agreement and (c) references to \"you\" or \"your\" in the remainder of this Agreement refers to both you (as an individual) and that entity.\n\n2.2 Use\n\nYou may use, reproduce, modify, Distribute, perform or display any of the Gemma Services only in accordance with the terms of this Agreement, and must not violate (or encourage or permit anyone else to violate) any term of this Agreement.\n\nSection 3: DISTRIBUTION AND RESTRICTIONS\n\n3.1 Distribution and Redistribution\n\nYou may reproduce or Distribute copies of Gemma or Model Derivatives if you meet all of the following conditions:\n\nYou must include the use restrictions referenced in Section 3.2 as an enforceable provision in any agreement (e.g., license agreement, terms of use, etc.) governing the use and/or distribution of Gemma or Model Derivatives and you must provide notice to subsequent users you Distribute to that Gemma or Model Derivatives are subject to the use restrictions in Section 3.2.\nYou must provide all third party recipients of Gemma or Model Derivatives a copy of this Agreement.\nYou must cause any modified files to carry prominent notices stating that you modified the files.\nAll Distributions (other than through a Hosted Service) must be accompanied by a \"Notice\" text file that contains the following notice: \"Gemma is provided under and subject to the Gemma Terms of Use found at ai.google.dev/gemma/terms\".\nYou may add your own intellectual property statement to your modifications and, except as set forth in this Section, may provide additional or different terms and conditions for use, reproduction, or Distribution of your modifications, or for any such Model Derivatives as a whole, provided your use, reproduction, modification, Distribution, performance, and display of Gemma otherwise complies with the terms and conditions of this Agreement. Any additional or different terms and conditions you impose must not conflict with the terms of this Agreement.\n\n3.2 Use Restrictions\n\nYou must not use any of the Gemma Services:\n\nfor the restricted uses set forth in the Gemma Prohibited Use Policy at ai.google.dev/gemma/prohibited_use_policy (\"Prohibited Use Policy\"), which is hereby incorporated by reference into this Agreement; or\nin violation of applicable laws and regulations.\nTo the maximum extent permitted by law, Google reserves the right to restrict (remotely or otherwise) usage of any of the Gemma Services that Google reasonably believes are in violation of this Agreement.\n\n3.3 Generated Output\n\nGoogle claims no rights in Outputs you generate using Gemma. You and your users are solely responsible for Outputs and their subsequent uses.\n\nSection 4: ADDITIONAL PROVISIONS\n\n4.1 Updates\n\nGoogle may update Gemma from time to time.\n\n4.2 Trademarks\n\nNothing in this Agreement grants you any rights to use Google's trademarks, trade names, logos or to otherwise suggest endorsement or misrepresent the relationship between you and Google. Google reserves any rights not expressly granted herein.\n\n4.3 DISCLAIMER OF WARRANTY\n\nUNLESS REQUIRED BY APPLICABLE LAW, THE GEMMA SERVICES, AND OUTPUTS, ARE PROVIDED ON AN \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY WARRANTIES OR CONDITIONS OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. YOU ARE SOLELY RESPONSIBLE FOR DETERMINING THE APPROPRIATENESS OF USING, REPRODUCING, MODIFYING, PERFORMING, DISPLAYING OR DISTRIBUTING ANY OF THE GEMMA SERVICES OR OUTPUTS AND ASSUME ANY AND ALL RISKS ASSOCIATED WITH YOUR USE OR DISTRIBUTION OF ANY OF THE GEMMA SERVICES OR OUTPUTS AND YOUR EXERCISE OF RIGHTS AND PERMISSIONS UNDER THIS AGREEMENT.\n\n4.4 LIMITATION OF LIABILITY\n\nTO THE FULLEST EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT AND UNDER NO LEGAL THEORY, WHETHER IN TORT (INCLUDING NEGLIGENCE), PRODUCT LIABILITY, CONTRACT, OR OTHERWISE, UNLESS REQUIRED BY APPLICABLE LAW, SHALL GOOGLE OR ITS AFFILIATES BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY DIRECT, INDIRECT, SPECIAL, INCIDENTAL, EXEMPLARY, CONSEQUENTIAL, OR PUNITIVE DAMAGES, OR LOST PROFITS OF ANY KIND ARISING FROM THIS AGREEMENT OR RELATED TO, ANY OF THE GEMMA SERVICES OR OUTPUTS EVEN IF GOOGLE OR ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.\n\n4.5 Term, Termination, and Survival\n\nThe term of this Agreement will commence upon your acceptance of this Agreement (including acceptance by your use, modification, or Distribution, reproduction, performance or display of any portion or element of the Gemma Services) and will continue in full force and effect until terminated in accordance with the terms of this Agreement. Google may terminate this Agreement if you are in breach of any term of this Agreement. Upon termination of this Agreement, you must delete and cease use and Distribution of all copies of Gemma and Model Derivatives in your possession or control. Sections 1, 2.1, 3.3, 4.2 to 4.9 shall survive the termination of this Agreement.\n\n4.6 Governing Law and Jurisdiction\n\nThis Agreement will be governed by the laws of the State of California without regard to choice of law principles. The UN Convention on Contracts for the International Sale of Goods does not apply to this Agreement. The state and federal courts of Santa Clara County, California shall have exclusive jurisdiction of any dispute arising out of this Agreement.\n\n4.7 Severability\n\nIf any provision of this Agreement is held to be invalid, illegal or unenforceable, the remaining provisions shall be unaffected thereby and remain valid as if such provision had not been set forth herein.\n\n4.8 Entire Agreement\n\nThis Agreement states all the terms agreed between the parties and supersedes all other agreements between the parties as of the date of acceptance relating to its subject matter.\n\n4.9 No Waiver\n\nGoogle will not be treated as having waived any rights by not exercising (or delaying the exercise of) any rights under this Agreement.",
  "modelfile": "# Modelfile generated by \"ollama show\"\n# To build a new Modelfile based on this, replace FROM with:\n# FROM gemma3n:e2b\n\nFROM C:\\Users\\work\\.ollama\\models\\blobs\\sha256-3839a254cf2d00b208c6e2524c129e4438f9d106bba4c3fbc12b631f519d1de1\nTEMPLATE \"\"\"{{- range $i, $_ := .Messages }}\n{{- $last := eq (len (slice $.Messages $i)) 1 }}\n{{- if or (eq .Role \"user\") (eq .Role \"system\") }}<start_of_turn>user\n{{ .Content }}<end_of_turn>\n{{ if $last }}<start_of_turn>model\n{{ end }}\n{{- else if eq .Role \"assistant\" }}<start_of_turn>model\n{{ .Content }}{{ if not $last }}<end_of_turn>\n{{ end }}\n{{- end }}\n{{- end }}\"\"\"\nLICENSE \"\"\"Gemma Terms of Use\nLast modified: March 24, 2025\n\nBy using, reproducing, modifying, distributing, performing or displaying any portion or element of Gemma, Model Derivatives including via any Hosted Service, (each as defined below) (collectively, the \"Gemma Services\") or otherwise accepting the terms of this Agreement, you agree to be bound by this Agreement.\n\nSection 1: DEFINITIONS\n\n1.1 Definitions\n\n(a) \"Agreement\" or \"Gemma Terms of Use\" means these terms and conditions that govern the use, reproduction, Distribution or modification of the Gemma Services and any terms and conditions incorporated by reference.\n\n(b) \"Distribution\" or \"Distribute\" means any transmission, publication, or other sharing of Gemma or Model Derivatives to a third party, including by providing or making Gemma or its functionality available as a hosted service via API, web access, or any other electronic or remote means (\"Hosted Service\").\n\n(c) \"Gemma\" means the set of machine learning language models, trained model weights and parameters identified in the Appendix, regardless of the source that you obtained it from.\n\n(d) \"Google\" means Google LLC.\n\n(e) \"Model Derivatives\" means all (i) modifications to Gemma, (ii) works based on Gemma, or (iii) any other machine learning model which is created by transfer of patterns of the weights, parameters, operations, or Output of Gemma, to that model in order to cause that model to perform similarly to Gemma, including distillation methods that use intermediate data representations or methods based on the generation of synthetic data Outputs by Gemma for training that model. For clarity, Outputs are not deemed Model Derivatives.\n\n(f) \"Output\" means the information content output of Gemma or a Model Derivative that results from operating or otherwise using Gemma or the Model Derivative, including via a Hosted Service.\n\n1.2\n\nAs used in this Agreement, \"including\" means \"including without limitation\".\n\nSection 2: ELIGIBILITY AND USAGE\n\n2.1 Eligibility\n\nYou represent and warrant that you have the legal capacity to enter into this Agreement (including being of sufficient age of consent). If you are accessing or using any of the Gemma Services for or on behalf of a legal entity, (a) you are entering into this Agreement on behalf of yourself and that legal entity, (b) you represent and warrant that you have the authority to act on behalf of and bind that entity to this Agreement and (c) references to \"you\" or \"your\" in the remainder of this Agreement refers to both you (as an individual) and that entity.\n\n2.2 Use\n\nYou may use, reproduce, modify, Distribute, perform or display any of the Gemma Services only in accordance with the terms of this Agreement, and must not violate (or encourage or permit anyone else to violate) any term of this Agreement.\n\nSection 3: DISTRIBUTION AND RESTRICTIONS\n\n3.1 Distribution and Redistribution\n\nYou may reproduce or Distribute copies of Gemma or Model Derivatives if you meet all of the following conditions:\n\nYou must include the use restrictions referenced in Section 3.2 as an enforceable provision in any agreement (e.g., license agreement, terms of use, etc.) governing the use and/or distribution of Gemma or Model Derivatives and you must provide notice to subsequent users you Distribute to that Gemma or Model Derivatives are subject to the use restrictions in Section 3.2.\nYou must provide all third party recipients of Gemma or Model Derivatives a copy of this Agreement.\nYou must cause any modified files to carry prominent notices stating that you modified the files.\nAll Distributions (other than through a Hosted Service) must be accompanied by a \"Notice\" text file that contains the following notice: \"Gemma is provided under and subject to the Gemma Terms of Use found at ai.google.dev/gemma/terms\".\nYou may add your own intellectual property statement to your modifications and, except as set forth in this Section, may provide additional or different terms and conditions for use, reproduction, or Distribution of your modifications, or for any such Model Derivatives as a whole, provided your use, reproduction, modification, Distribution, performance, and display of Gemma otherwise complies with the terms and conditions of this Agreement. Any additional or different terms and conditions you impose must not conflict with the terms of this Agreement.\n\n3.2 Use Restrictions\n\nYou must not use any of the Gemma Services:\n\nfor the restricted uses set forth in the Gemma Prohibited Use Policy at ai.google.dev/gemma/prohibited_use_policy (\"Prohibited Use Policy\"), which is hereby incorporated by reference into this Agreement; or\nin violation of applicable laws and regulations.\nTo the maximum extent permitted by law, Google reserves the right to restrict (remotely or otherwise) usage of any of the Gemma Services that Google reasonably believes are in violation of this Agreement.\n\n3.3 Generated Output\n\nGoogle claims no rights in Outputs you generate using Gemma. You and your users are solely responsible for Outputs and their subsequent uses.\n\nSection 4: ADDITIONAL PROVISIONS\n\n4.1 Updates\n\nGoogle may update Gemma from time to time.\n\n4.2 Trademarks\n\nNothing in this Agreement grants you any rights to use Google's trademarks, trade names, logos or to otherwise suggest endorsement or misrepresent the relationship between you and Google. Google reserves any rights not expressly granted herein.\n\n4.3 DISCLAIMER OF WARRANTY\n\nUNLESS REQUIRED BY APPLICABLE LAW, THE GEMMA SERVICES, AND OUTPUTS, ARE PROVIDED ON AN \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY WARRANTIES OR CONDITIONS OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. YOU ARE SOLELY RESPONSIBLE FOR DETERMINING THE APPROPRIATENESS OF USING, REPRODUCING, MODIFYING, PERFORMING, DISPLAYING OR DISTRIBUTING ANY OF THE GEMMA SERVICES OR OUTPUTS AND ASSUME ANY AND ALL RISKS ASSOCIATED WITH YOUR USE OR DISTRIBUTION OF ANY OF THE GEMMA SERVICES OR OUTPUTS AND YOUR EXERCISE OF RIGHTS AND PERMISSIONS UNDER THIS AGREEMENT.\n\n4.4 LIMITATION OF LIABILITY\n\nTO THE FULLEST EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT AND UNDER NO LEGAL THEORY, WHETHER IN TORT (INCLUDING NEGLIGENCE), PRODUCT LIABILITY, CONTRACT, OR OTHERWISE, UNLESS REQUIRED BY APPLICABLE LAW, SHALL GOOGLE OR ITS AFFILIATES BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY DIRECT, INDIRECT, SPECIAL, INCIDENTAL, EXEMPLARY, CONSEQUENTIAL, OR PUNITIVE DAMAGES, OR LOST PROFITS OF ANY KIND ARISING FROM THIS AGREEMENT OR RELATED TO, ANY OF THE GEMMA SERVICES OR OUTPUTS EVEN IF GOOGLE OR ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.\n\n4.5 Term, Termination, and Survival\n\nThe term of this Agreement will commence upon your acceptance of this Agreement (including acceptance by your use, modification, or Distribution, reproduction, performance or display of any portion or element of the Gemma Services) and will continue in full force and effect until terminated in accordance with the terms of this Agreement. Google may terminate this Agreement if you are in breach of any term of this Agreement. Upon termination of this Agreement, you must delete and cease use and Distribution of all copies of Gemma and Model Derivatives in your possession or control. Sections 1, 2.1, 3.3, 4.2 to 4.9 shall survive the termination of this Agreement.\n\n4.6 Governing Law and Jurisdiction\n\nThis Agreement will be governed by the laws of the State of California without regard to choice of law principles. The UN Convention on Contracts for the International Sale of Goods does not apply to this Agreement. The state and federal courts of Santa Clara County, California shall have exclusive jurisdiction of any dispute arising out of this Agreement.\n\n4.7 Severability\n\nIf any provision of this Agreement is held to be invalid, illegal or unenforceable, the remaining provisions shall be unaffected thereby and remain valid as if such provision had not been set forth herein.\n\n4.8 Entire Agreement\n\nThis Agreement states all the terms agreed between the parties and supersedes all other agreements between the parties as of the date of acceptance relating to its subject matter.\n\n4.9 No Waiver\n\nGoogle will not be treated as having waived any rights by not exercising (or delaying the exercise of) any rights under this Agreement.\"\"\"\n",
  "template": "{{- range $i, $_ := .Messages }}\n{{- $last := eq (len (slice $.Messages $i)) 1 }}\n{{- if or (eq .Role \"user\") (eq .Role \"system\") }}<start_of_turn>user\n{{ .Content }}<end_of_turn>\n{{ if $last }}<start_of_turn>model\n{{ end }}\n{{- else if eq .Role \"assistant\" }}<start_of_turn>model\n{{ .Content }}{{ if not $last }}<end_of_turn>\n{{ end }}\n{{- end }}\n{{- end }}",
  "details": {
    "parent_model": "",
    "format": "gguf",
    "family": "gemma3n",
    "families": [
      "gemma3n"
    ],
    "parameter_size": "4.5B",
    "quantization_level": "Q4_K_M"
  },
  "model_info": {
    "gemma3n.activation_sparsity_scale": null,
    "gemma3n.altup.active_idx": 0,
    "gemma3n.altup.correct_scale": true,
    "gemma3n.altup.lr_multiplier": 1,
    "gemma3n.altup.num_inputs": 4,
    "gemma3n.attention.head_count": 8,
    "gemma3n.attention.head_count_kv": 2,
    "gemma3n.attention.layer_norm_rms_epsilon": 0.000001,
    "gemma3n.attention.shared_kv_layers": 10,
    "gemma3n.attention.sliding_window": 512,
    "gemma3n.attention.sliding_window_pattern": null,
    "gemma3n.block_count": 30,
    "gemma3n.context_length": 32768,
    "gemma3n.embedding_length": 2048,
    "gemma3n.embedding_length_per_layer_input": 256,
    "gemma3n.feed_forward_length": 8192,
    "gemma3n.head_dim": 256,
    "gemma3n.laurel_rank": 64,
    "gemma3n.num_kv_shared_layers": 10,
    "gemma3n.rope.freq_base": 1000000,
    "gemma3n.rope.freq_base_local": 10000,
    "general.architecture": "gemma3n",
    "general.file_type": 15,
    "general.parameter_count": 4456156768,
    "general.quantization_version": 2,
    "tokenizer.ggml.add_bos_token": true,
    "tokenizer.ggml.add_eos_token": false,
    "tokenizer.ggml.add_padding_token": false,
    "tokenizer.ggml.add_unknown_token": false,
    "tokenizer.ggml.bos_token_id": 2,
    "tokenizer.ggml.eos_token_id": 1,
    "tokenizer.ggml.eos_token_ids": null,
    "tokenizer.ggml.merges": null,
    "tokenizer.ggml.model": "gpt2",
    "tokenizer.ggml.padding_token_id": 0,
    "tokenizer.ggml.pre": "default",
    "tokenizer.ggml.scores": null,
    "tokenizer.ggml.token_type": null,
    "tokenizer.ggml.tokens": null,
    "tokenizer.ggml.unknown_token_id": 3
  },
  "tensors": [
    {
      "name": "altup_proj.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048,
        3
      ]
    },
    {
      "name": "altup_unembd_proj.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048,
        3
      ]
    },
    {
      "name": "blk.0.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.0.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.0.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.0.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.0.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.0.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
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
        2048
      ]
    },
    {
      "name": "blk.0.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.0.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "type": "Q6_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.0.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.0.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.0.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.0.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.0.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.0.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.0.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.0.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.0.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.0.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.0.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.0.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.1.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.1.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.1.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.1.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.1.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.1.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.1.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.1.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
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
      "name": "blk.1.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.1.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.1.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.1.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.1.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.1.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.1.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.1.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.1.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.1.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.1.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.1.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.1.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.1.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.2.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.2.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.2.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.2.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.2.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.2.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.2.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.2.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.2.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.2.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.2.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.2.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.2.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.2.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.2.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.2.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.2.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.2.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.2.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.2.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.2.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.2.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.3.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.3.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.3.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.3.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.3.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.3.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.3.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.3.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.3.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.3.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.3.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.3.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.3.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.3.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.3.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.3.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.3.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.3.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.3.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.3.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.3.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.3.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.4.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.4.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.4.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.4.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.4.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.4.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.4.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.4.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.4.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.4.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.4.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.4.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.4.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.4.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.4.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.4.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.4.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.4.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.4.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.4.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.4.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.4.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.5.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.5.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.5.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.5.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.5.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.5.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.5.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.5.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.5.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.5.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.5.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.5.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.5.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.5.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.5.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.5.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.5.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.5.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.5.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.5.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.5.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.5.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.6.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.6.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.6.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.6.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.6.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.6.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.6.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
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
      "name": "blk.6.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.6.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.6.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.6.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.6.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.6.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.6.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.6.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.6.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.6.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.6.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.6.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.6.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.6.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.6.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.7.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.7.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.7.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.7.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.7.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.7.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.7.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.7.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.7.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.7.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.7.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.7.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.7.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.7.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.7.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.7.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.7.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.7.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.7.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.7.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.7.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.7.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.8.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.8.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.8.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.8.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.8.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.8.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.8.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.8.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.8.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.8.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.8.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.8.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.8.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.8.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.8.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.8.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.8.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.8.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.8.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.8.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.8.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.8.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.9.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.9.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.9.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.9.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.9.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.9.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.9.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.9.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.9.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.9.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.9.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.9.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.9.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.9.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.9.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.9.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.9.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.9.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.9.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.9.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.9.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.9.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.10.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.10.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.10.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.10.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.10.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.10.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.10.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.10.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.10.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.10.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.10.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.10.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.10.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.10.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.10.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.10.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.10.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.10.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.10.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.10.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.10.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.10.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.11.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.11.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.11.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.11.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.11.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.11.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.11.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
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
      "name": "blk.11.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.11.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.11.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.11.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.11.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.11.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.11.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.11.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.11.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.11.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.11.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.11.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.11.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.11.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.11.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.12.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.12.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.12.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.12.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.12.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.12.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.12.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.12.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.12.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.12.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.12.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.12.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.12.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.12.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.12.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.12.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.12.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.12.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.12.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.12.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.12.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.12.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.13.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.13.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.13.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.13.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.13.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.13.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.13.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.13.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.13.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.13.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.13.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.13.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.13.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.13.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.13.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.13.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.13.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.13.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.13.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.13.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.13.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.13.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.14.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.14.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.14.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.14.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.14.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.14.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.14.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.14.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.14.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.14.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.14.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.14.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.14.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.14.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.14.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.14.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.14.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.14.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.14.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.14.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.14.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.14.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.15.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.15.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.15.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.15.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.15.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.15.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.15.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.15.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.15.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.15.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.15.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.15.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.15.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.15.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.15.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.15.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.15.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.15.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.15.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.15.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.15.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.15.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.16.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.16.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.16.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.16.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.16.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.16.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.16.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
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
      "name": "blk.16.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.16.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.16.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.16.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.16.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.16.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.16.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.16.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.16.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.16.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.16.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.16.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.16.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.16.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.16.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.17.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.17.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.17.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.17.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.17.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.17.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.17.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.17.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.17.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.17.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.17.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.17.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.17.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.17.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.17.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.17.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.17.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.17.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.17.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.17.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.17.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.17.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.18.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.18.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.18.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.18.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.18.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.18.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.18.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.18.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.18.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.18.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.18.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.18.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.18.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.18.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.18.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.18.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.18.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.18.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.18.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.18.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.18.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.18.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.19.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.19.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.19.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.19.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.19.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.19.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.19.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.19.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.19.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.19.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.19.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.19.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.19.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.19.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.19.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.19.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.19.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.19.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.19.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.19.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.19.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.19.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.20.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.20.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.20.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.20.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.20.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.20.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.20.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.20.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.20.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.20.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.20.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.20.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.20.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.20.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.20.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.20.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.20.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.20.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.20.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.20.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.20.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.20.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.21.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.21.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.21.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.21.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.21.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.21.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.21.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
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
      "name": "blk.21.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.21.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.21.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.21.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.21.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.21.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.21.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.21.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.21.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.21.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.21.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.21.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.21.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.21.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.21.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.22.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.22.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.22.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.22.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.22.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.22.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.22.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.22.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.22.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.22.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.22.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.22.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.22.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.22.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.22.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.22.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.22.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.22.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.22.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.22.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.22.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.22.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.23.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.23.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.23.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.23.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.23.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.23.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.23.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.23.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.23.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.23.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.23.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.23.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.23.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.23.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.23.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.23.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.23.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.23.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.23.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.23.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.23.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.23.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.24.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.24.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.24.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.24.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.24.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.24.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.24.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.24.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.24.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.24.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.24.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.24.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.24.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.24.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.24.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.24.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.24.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.24.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.24.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.24.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.24.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.24.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.25.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.25.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.25.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.25.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.25.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.25.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.25.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.25.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.25.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.25.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.25.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.25.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.25.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.25.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.25.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.25.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.25.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.25.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
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
      "name": "blk.25.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.25.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
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
      "name": "blk.25.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.25.attn_v.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.26.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.26.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.26.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.26.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.26.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.26.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.26.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.26.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.26.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.26.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.26.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.26.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.26.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.26.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.26.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.26.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.26.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.26.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.26.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.26.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.26.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.26.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.26.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.26.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.27.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.27.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.27.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.27.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.27.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.27.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.27.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.27.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.27.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.27.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.27.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.27.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.27.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.27.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.27.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.27.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.27.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.27.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.27.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.27.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.27.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.27.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.27.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.27.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.28.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.28.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.28.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.28.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.28.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.28.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.28.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.28.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.28.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.28.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.28.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.28.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.28.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.28.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.28.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.28.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.28.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.28.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.28.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.28.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.28.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.28.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.28.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.28.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.29.altup_correct_scale.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.29.altup_correct_coef.weight",
      "type": "F16",
      "shape": [
        4,
        4
      ]
    },
    {
      "name": "blk.29.altup_router.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        4
      ]
    },
    {
      "name": "blk.29.altup_predict_coef.weight",
      "type": "F16",
      "shape": [
        4,
        16
      ]
    },
    {
      "name": "blk.29.altup_router_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.29.attn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.29.laurel_l.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        64
      ]
    },
    {
      "name": "blk.29.laurel_r.weight",
      "type": "Q5_0",
      "shape": [
        64,
        2048
      ]
    },
    {
      "name": "blk.29.laurel_post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.29.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        8192,
        2048
      ]
    },
    {
      "name": "blk.29.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.29.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        8192
      ]
    },
    {
      "name": "blk.29.inp_gate.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.29.proj.weight",
      "type": "Q4_K",
      "shape": [
        256,
        2048
      ]
    },
    {
      "name": "blk.29.post_attention_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.29.post_ffw_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.29.post_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.29.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.29.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.29.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "blk.29.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.29.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "blk.29.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.29.attn_v.weight",
      "type": "Q6_K",
      "shape": [
        2048,
        512
      ]
    },
    {
      "name": "output_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "per_layer_model_proj.weight",
      "type": "Q4_K",
      "shape": [
        2048,
        7680
      ]
    },
    {
      "name": "per_layer_proj_norm.weight",
      "type": "F32",
      "shape": [
        256
      ]
    },
    {
      "name": "per_layer_token_embd.weight",
      "type": "F16",
      "shape": [
        7680,
        262144
      ]
    },
    {
      "name": "token_embd.weight",
      "type": "Q6_K",
      "shape": [
        2048,
        262400
      ]
    }
  ],
  "capabilities": [
    "completion"
  ],
  "modified_at": "2025-08-03T17:53:33.6294197+02:00"
}
```
