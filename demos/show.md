# ollama_show, ollama_show_json
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.0
```

model: gemma:2b

ollama_show "gemma:2b"

  Model
    architecture        gemma    
    parameters          2.5B     
    context length      8192     
    embedding length    2048     
    quantization        Q4_0     

  Capabilities
    completion    

  Parameters
    repeat_penalty    1                    
    stop              "<start_of_turn>"    
    stop              "<end_of_turn>"      

  License
    Gemma Terms of Use                  
    Last modified: February 21, 2024    
    ...                                 


ollama_show_json "gemma:2b"

{
  "license": "Gemma Terms of Use \n\nLast modified: February 21, 2024\n\nBy using, reproducing, modifying, distributing, performing or displaying any portion or element of Gemma, Model Derivatives including via any Hosted Service, (each as defined below) (collectively, the \"Gemma Services\") or otherwise accepting the terms of this Agreement, you agree to be bound by this Agreement.\n\nSection 1: DEFINITIONS\n1.1 Definitions\n(a) \"Agreement\" or \"Gemma Terms of Use\" means these terms and conditions that govern the use, reproduction, Distribution or modification of the Gemma Services and any terms and conditions incorporated by reference.\n\n(b) \"Distribution\" or \"Distribute\" means any transmission, publication, or other sharing of Gemma or Model Derivatives to a third party, including by providing or making Gemma or its functionality available as a hosted service via API, web access, or any other electronic or remote means (\"Hosted Service\").\n\n(c) \"Gemma\" means the set of machine learning language models, trained model weights and parameters identified at ai.google.dev/gemma, regardless of the source that you obtained it from.\n\n(d) \"Google\" means Google LLC.\n\n(e) \"Model Derivatives\" means all (i) modifications to Gemma, (ii) works based on Gemma, or (iii) any other machine learning model which is created by transfer of patterns of the weights, parameters, operations, or Output of Gemma, to that model in order to cause that model to perform similarly to Gemma, including distillation methods that use intermediate data representations or methods based on the generation of synthetic data Outputs by Gemma for training that model. For clarity, Outputs are not deemed Model Derivatives.\n\n(f) \"Output\" means the information content output of Gemma or a Model Derivative that results from operating or otherwise using Gemma or the Model Derivative, including via a Hosted Service.\n\n1.2\nAs used in this Agreement, \"including\" means \"including without limitation\".\n\nSection 2: ELIGIBILITY AND USAGE\n2.1 Eligibility\nYou represent and warrant that you have the legal capacity to enter into this Agreement (including being of sufficient age of consent). If you are accessing or using any of the Gemma Services for or on behalf of a legal entity, (a) you are entering into this Agreement on behalf of yourself and that legal entity, (b) you represent and warrant that you have the authority to act on behalf of and bind that entity to this Agreement and (c) references to \"you\" or \"your\" in the remainder of this Agreement refers to both you (as an individual) and that entity.\n\n2.2 Use\nYou may use, reproduce, modify, Distribute, perform or display any of the Gemma Services only in accordance with the terms of this Agreement, and must not violate (or encourage or permit anyone else to violate) any term of this Agreement.\n\nSection 3: DISTRIBUTION AND RESTRICTIONS\n3.1 Distribution and Redistribution\nYou may reproduce or Distribute copies of Gemma or Model Derivatives if you meet all of the following conditions:\n\nYou must include the use restrictions referenced in Section 3.2 as an enforceable provision in any agreement (e.g., license agreement, terms of use, etc.) governing the use and/or distribution of Gemma or Model Derivatives and you must provide notice to subsequent users you Distribute to that Gemma or Model Derivatives are subject to the use restrictions in Section 3.2.\nYou must provide all third party recipients of Gemma or Model Derivatives a copy of this Agreement.\nYou must cause any modified files to carry prominent notices stating that you modified the files.\nAll Distributions (other than through a Hosted Service) must be accompanied by a \"Notice\" text file that contains the following notice: \"Gemma is provided under and subject to the Gemma Terms of Use found at ai.google.dev/gemma/terms\".\nYou may add your own intellectual property statement to your modifications and, except as set forth in this Section, may provide additional or different terms and conditions for use, reproduction, or Distribution of your modifications, or for any such Model Derivatives as a whole, provided your use, reproduction, modification, Distribution, performance, and display of Gemma otherwise complies with the terms and conditions of this Agreement. Any additional or different terms and conditions you impose must not conflict with the terms of this Agreement.\n\n3.2 Use Restrictions\nYou must not use any of the Gemma Services:\n\nfor the restricted uses set forth in the Gemma Prohibited Use Policy at ai.google.dev/gemma/prohibited_use_policy (\"Prohibited Use Policy\"), which is hereby incorporated by reference into this Agreement; or\nin violation of applicable laws and regulations.\nTo the maximum extent permitted by law, Google reserves the right to restrict (remotely or otherwise) usage of any of the Gemma Services that Google reasonably believes are in violation of this Agreement.\n\n3.3 Generated Output\nGoogle claims no rights in Outputs you generate using Gemma. You and your users are solely responsible for Outputs and their subsequent uses.\n\nSection 4: ADDITIONAL PROVISIONS\n4.1 Updates\nGoogle may update Gemma from time to time, and you must make reasonable efforts to use the latest version of Gemma.\n\n4.2 Trademarks\nNothing in this Agreement grants you any rights to use Google's trademarks, trade names, logos or to otherwise suggest endorsement or misrepresent the relationship between you and Google. Google reserves any rights not expressly granted herein.\n\n4.3 DISCLAIMER OF WARRANTY\nUNLESS REQUIRED BY APPLICABLE LAW, THE GEMMA SERVICES, AND OUTPUTS, ARE PROVIDED ON AN \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY WARRANTIES OR CONDITIONS OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. YOU ARE SOLELY RESPONSIBLE FOR DETERMINING THE APPROPRIATENESS OF USING, REPRODUCING, MODIFYING, PERFORMING, DISPLAYING OR OR DISTRIBUTING ANY OF THE GEMMA SERVICES OR OUTPUTS AND ASSUME ANY AND ALL RISKS ASSOCIATED WITH YOUR USE OR DISTRIBUTION OF ANY OF THE GEMMA SERVICES OR OUTPUTS AND YOUR EXERCISE OF RIGHTS AND PERMISSIONS UNDER THIS AGREEMENT.\n\n4.4 LIMITATION OF LIABILITY\nTO THE FULLEST EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT AND UNDER NO LEGAL THEORY, WHETHER IN TORT (INCLUDING NEGLIGENCE), PRODUCT LIABILITY, CONTRACT, OR OTHERWISE, UNLESS REQUIRED BY APPLICABLE LAW, SHALL GOOGLE OR ITS AFFILIATES BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY DIRECT, INDIRECT, SPECIAL, INCIDENTAL, EXEMPLARY, CONSEQUENTIAL, OR PUNITIVE DAMAGES, OR LOST PROFITS OF ANY KIND ARISING FROM THIS AGREEMENT OR RELATED TO, ANY OF THE GEMMA SERVICES OR OUTPUTS EVEN IF GOOGLE OR ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.\n\n4.5 Term, Termination, and Survival\nThe term of this Agreement will commence upon your acceptance of this Agreement (including acceptance by your use, modification, or Distribution, reproduction, performance or display of any portion or element of the Gemma Services) and will continue in full force and effect until terminated in accordance with the terms of this Agreement. Google may terminate this Agreement if you are in breach of any term of this Agreement. Upon termination of this Agreement, you must delete and cease use and Distribution of all copies of Gemma and Model Derivatives in your possession or control. Sections 1, 2.1, 3.3, 4.2 to 4.9 shall survive the termination of this Agreement.\n\n4.6 Governing Law and Jurisdiction\nThis Agreement will be governed by the laws of the State of California without regard to choice of law principles. The UN Convention on Contracts for the International Sale of Goods does not apply to this Agreement. The state and federal courts of Santa Clara County, California shall have exclusive jurisdiction of any dispute arising out of this Agreement.\n\n4.7 Severability\nIf any provision of this Agreement is held to be invalid, illegal or unenforceable, the remaining provisions shall be unaffected thereby and remain valid as if such provision had not been set forth herein.\n\n4.8 Entire Agreement\nThis Agreement states all the terms agreed between the parties and supersedes all other agreements between the parties as of the date of acceptance relating to its subject matter.\n\n4.9 No Waiver\nGoogle will not be treated as having waived any rights by not exercising (or delaying the exercise of) any rights under this Agreement.\n\n",
  "modelfile": "# Modelfile generated by \"ollama show\"\n# To build a new Modelfile based on this, replace FROM with:\n# FROM gemma:2b\n\nFROM /Users/davidbarberi/.ollama/models/blobs/sha256-c1864a5eb19305c40519da12cc543519e48a0697ecd30e15d5ac228644957d12\nTEMPLATE \"<start_of_turn>user\n{{ if .System }}{{ .System }} {{ end }}{{ .Prompt }}<end_of_turn>\n<start_of_turn>model\n{{ .Response }}<end_of_turn>\n\"\nPARAMETER repeat_penalty 1\nPARAMETER stop <start_of_turn>\nPARAMETER stop <end_of_turn>\nLICENSE \"\"\"Gemma Terms of Use \n\nLast modified: February 21, 2024\n\nBy using, reproducing, modifying, distributing, performing or displaying any portion or element of Gemma, Model Derivatives including via any Hosted Service, (each as defined below) (collectively, the \"Gemma Services\") or otherwise accepting the terms of this Agreement, you agree to be bound by this Agreement.\n\nSection 1: DEFINITIONS\n1.1 Definitions\n(a) \"Agreement\" or \"Gemma Terms of Use\" means these terms and conditions that govern the use, reproduction, Distribution or modification of the Gemma Services and any terms and conditions incorporated by reference.\n\n(b) \"Distribution\" or \"Distribute\" means any transmission, publication, or other sharing of Gemma or Model Derivatives to a third party, including by providing or making Gemma or its functionality available as a hosted service via API, web access, or any other electronic or remote means (\"Hosted Service\").\n\n(c) \"Gemma\" means the set of machine learning language models, trained model weights and parameters identified at ai.google.dev/gemma, regardless of the source that you obtained it from.\n\n(d) \"Google\" means Google LLC.\n\n(e) \"Model Derivatives\" means all (i) modifications to Gemma, (ii) works based on Gemma, or (iii) any other machine learning model which is created by transfer of patterns of the weights, parameters, operations, or Output of Gemma, to that model in order to cause that model to perform similarly to Gemma, including distillation methods that use intermediate data representations or methods based on the generation of synthetic data Outputs by Gemma for training that model. For clarity, Outputs are not deemed Model Derivatives.\n\n(f) \"Output\" means the information content output of Gemma or a Model Derivative that results from operating or otherwise using Gemma or the Model Derivative, including via a Hosted Service.\n\n1.2\nAs used in this Agreement, \"including\" means \"including without limitation\".\n\nSection 2: ELIGIBILITY AND USAGE\n2.1 Eligibility\nYou represent and warrant that you have the legal capacity to enter into this Agreement (including being of sufficient age of consent). If you are accessing or using any of the Gemma Services for or on behalf of a legal entity, (a) you are entering into this Agreement on behalf of yourself and that legal entity, (b) you represent and warrant that you have the authority to act on behalf of and bind that entity to this Agreement and (c) references to \"you\" or \"your\" in the remainder of this Agreement refers to both you (as an individual) and that entity.\n\n2.2 Use\nYou may use, reproduce, modify, Distribute, perform or display any of the Gemma Services only in accordance with the terms of this Agreement, and must not violate (or encourage or permit anyone else to violate) any term of this Agreement.\n\nSection 3: DISTRIBUTION AND RESTRICTIONS\n3.1 Distribution and Redistribution\nYou may reproduce or Distribute copies of Gemma or Model Derivatives if you meet all of the following conditions:\n\nYou must include the use restrictions referenced in Section 3.2 as an enforceable provision in any agreement (e.g., license agreement, terms of use, etc.) governing the use and/or distribution of Gemma or Model Derivatives and you must provide notice to subsequent users you Distribute to that Gemma or Model Derivatives are subject to the use restrictions in Section 3.2.\nYou must provide all third party recipients of Gemma or Model Derivatives a copy of this Agreement.\nYou must cause any modified files to carry prominent notices stating that you modified the files.\nAll Distributions (other than through a Hosted Service) must be accompanied by a \"Notice\" text file that contains the following notice: \"Gemma is provided under and subject to the Gemma Terms of Use found at ai.google.dev/gemma/terms\".\nYou may add your own intellectual property statement to your modifications and, except as set forth in this Section, may provide additional or different terms and conditions for use, reproduction, or Distribution of your modifications, or for any such Model Derivatives as a whole, provided your use, reproduction, modification, Distribution, performance, and display of Gemma otherwise complies with the terms and conditions of this Agreement. Any additional or different terms and conditions you impose must not conflict with the terms of this Agreement.\n\n3.2 Use Restrictions\nYou must not use any of the Gemma Services:\n\nfor the restricted uses set forth in the Gemma Prohibited Use Policy at ai.google.dev/gemma/prohibited_use_policy (\"Prohibited Use Policy\"), which is hereby incorporated by reference into this Agreement; or\nin violation of applicable laws and regulations.\nTo the maximum extent permitted by law, Google reserves the right to restrict (remotely or otherwise) usage of any of the Gemma Services that Google reasonably believes are in violation of this Agreement.\n\n3.3 Generated Output\nGoogle claims no rights in Outputs you generate using Gemma. You and your users are solely responsible for Outputs and their subsequent uses.\n\nSection 4: ADDITIONAL PROVISIONS\n4.1 Updates\nGoogle may update Gemma from time to time, and you must make reasonable efforts to use the latest version of Gemma.\n\n4.2 Trademarks\nNothing in this Agreement grants you any rights to use Google's trademarks, trade names, logos or to otherwise suggest endorsement or misrepresent the relationship between you and Google. Google reserves any rights not expressly granted herein.\n\n4.3 DISCLAIMER OF WARRANTY\nUNLESS REQUIRED BY APPLICABLE LAW, THE GEMMA SERVICES, AND OUTPUTS, ARE PROVIDED ON AN \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY WARRANTIES OR CONDITIONS OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. YOU ARE SOLELY RESPONSIBLE FOR DETERMINING THE APPROPRIATENESS OF USING, REPRODUCING, MODIFYING, PERFORMING, DISPLAYING OR OR DISTRIBUTING ANY OF THE GEMMA SERVICES OR OUTPUTS AND ASSUME ANY AND ALL RISKS ASSOCIATED WITH YOUR USE OR DISTRIBUTION OF ANY OF THE GEMMA SERVICES OR OUTPUTS AND YOUR EXERCISE OF RIGHTS AND PERMISSIONS UNDER THIS AGREEMENT.\n\n4.4 LIMITATION OF LIABILITY\nTO THE FULLEST EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT AND UNDER NO LEGAL THEORY, WHETHER IN TORT (INCLUDING NEGLIGENCE), PRODUCT LIABILITY, CONTRACT, OR OTHERWISE, UNLESS REQUIRED BY APPLICABLE LAW, SHALL GOOGLE OR ITS AFFILIATES BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY DIRECT, INDIRECT, SPECIAL, INCIDENTAL, EXEMPLARY, CONSEQUENTIAL, OR PUNITIVE DAMAGES, OR LOST PROFITS OF ANY KIND ARISING FROM THIS AGREEMENT OR RELATED TO, ANY OF THE GEMMA SERVICES OR OUTPUTS EVEN IF GOOGLE OR ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.\n\n4.5 Term, Termination, and Survival\nThe term of this Agreement will commence upon your acceptance of this Agreement (including acceptance by your use, modification, or Distribution, reproduction, performance or display of any portion or element of the Gemma Services) and will continue in full force and effect until terminated in accordance with the terms of this Agreement. Google may terminate this Agreement if you are in breach of any term of this Agreement. Upon termination of this Agreement, you must delete and cease use and Distribution of all copies of Gemma and Model Derivatives in your possession or control. Sections 1, 2.1, 3.3, 4.2 to 4.9 shall survive the termination of this Agreement.\n\n4.6 Governing Law and Jurisdiction\nThis Agreement will be governed by the laws of the State of California without regard to choice of law principles. The UN Convention on Contracts for the International Sale of Goods does not apply to this Agreement. The state and federal courts of Santa Clara County, California shall have exclusive jurisdiction of any dispute arising out of this Agreement.\n\n4.7 Severability\nIf any provision of this Agreement is held to be invalid, illegal or unenforceable, the remaining provisions shall be unaffected thereby and remain valid as if such provision had not been set forth herein.\n\n4.8 Entire Agreement\nThis Agreement states all the terms agreed between the parties and supersedes all other agreements between the parties as of the date of acceptance relating to its subject matter.\n\n4.9 No Waiver\nGoogle will not be treated as having waived any rights by not exercising (or delaying the exercise of) any rights under this Agreement.\n\n\"\"\"\n",
  "parameters": "repeat_penalty                 1\nstop                           \"<start_of_turn>\"\nstop                           \"<end_of_turn>\"",
  "template": "<start_of_turn>user\n{{ if .System }}{{ .System }} {{ end }}{{ .Prompt }}<end_of_turn>\n<start_of_turn>model\n{{ .Response }}<end_of_turn>\n",
  "details": {
    "parent_model": "",
    "format": "gguf",
    "family": "gemma",
    "families": [
      "gemma"
    ],
    "parameter_size": "3B",
    "quantization_level": "Q4_0"
  },
  "model_info": {
    "gemma.attention.head_count": 8,
    "gemma.attention.head_count_kv": 1,
    "gemma.attention.key_length": 256,
    "gemma.attention.layer_norm_rms_epsilon": 0.000001,
    "gemma.attention.value_length": 256,
    "gemma.block_count": 18,
    "gemma.context_length": 8192,
    "gemma.embedding_length": 2048,
    "gemma.feed_forward_length": 16384,
    "general.architecture": "gemma",
    "general.file_type": 2,
    "general.parameter_count": 2506434560,
    "general.quantization_version": 2,
    "tokenizer.ggml.bos_token_id": 2,
    "tokenizer.ggml.eos_token_id": 1,
    "tokenizer.ggml.model": "llama",
    "tokenizer.ggml.padding_token_id": 0,
    "tokenizer.ggml.scores": null,
    "tokenizer.ggml.token_type": null,
    "tokenizer.ggml.tokens": null,
    "tokenizer.ggml.unknown_token_id": 3
  },
  "tensors": [
    {
      "name": "token_embd.weight",
      "type": "Q8_0",
      "shape": [
        2048,
        256128
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
      "name": "blk.0.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.0.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.0.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.0.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.0.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.0.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.0.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
        2048
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
      "name": "blk.0.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.1.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.1.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.1.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.1.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.1.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.1.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.1.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
        2048
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
      "name": "blk.1.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.10.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.10.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.10.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.10.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.10.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.10.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.10.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
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
      "name": "blk.10.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.11.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.11.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.11.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.11.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.11.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.11.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.11.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
        2048
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
      "name": "blk.11.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.12.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.12.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.12.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.12.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.12.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.12.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.12.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
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
      "name": "blk.12.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.13.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.13.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.13.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.13.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.13.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.13.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.13.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
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
      "name": "blk.13.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.14.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.14.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.14.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.14.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.14.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.14.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.14.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
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
      "name": "blk.14.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.15.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.15.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.15.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.15.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.15.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.15.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.15.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
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
      "name": "blk.15.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.16.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.16.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.16.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.16.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.16.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.16.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.16.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
        2048
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
      "name": "blk.16.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.17.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.17.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.17.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.17.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.17.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.17.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.17.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
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
      "name": "blk.17.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.2.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.2.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.2.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.2.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.2.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.2.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.2.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
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
      "name": "blk.2.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.3.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.3.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.3.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.3.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.3.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.3.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.3.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
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
      "name": "blk.3.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.4.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.4.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.4.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.4.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.4.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.4.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.4.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
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
      "name": "blk.4.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.5.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.5.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.5.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.5.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.5.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.5.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.5.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
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
      "name": "blk.5.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.6.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.6.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.6.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.6.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.6.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.6.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.6.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
        2048
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
      "name": "blk.6.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.7.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.7.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.7.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.7.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.7.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.7.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.7.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
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
      "name": "blk.7.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.8.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.8.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.8.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.8.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.8.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.8.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.8.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
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
      "name": "blk.8.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    },
    {
      "name": "blk.9.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.9.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.9.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        256
      ]
    },
    {
      "name": "blk.9.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        2048
      ]
    },
    {
      "name": "blk.9.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.9.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        2048,
        16384
      ]
    },
    {
      "name": "blk.9.ffn_down.weight",
      "type": "Q4_0",
      "shape": [
        16384,
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
      "name": "blk.9.ffn_norm.weight",
      "type": "F32",
      "shape": [
        2048
      ]
    }
  ],
  "capabilities": [
    "completion"
  ],
  "modified_at": "2025-06-09T13:56:24.790452967+02:00"
}
```
