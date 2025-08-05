# ollama_show, ollama_show_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.7

ollama_show "qwen3:8b"

```
  Model
    architecture        qwen3     
    parameters          8.2B      
    context length      40960     
    embedding length    4096      
    quantization        Q4_K_M    

  Capabilities
    completion    
    tools         
    thinking      

  Parameters
    repeat_penalty    1                 
    stop              "<|im_start|>"    
    stop              "<|im_end|>"      
    temperature       0.6               
    top_k             20                
    top_p             0.95              

  License
    Apache License               
    Version 2.0, January 2004    
    ...                          

```


ollama_show_json "qwen3:8b"

```
{
  "license": "                                 Apache License\n                           Version 2.0, January 2004\n                        http://www.apache.org/licenses/\n\n   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION\n\n   1. Definitions.\n\n      \"License\" shall mean the terms and conditions for use, reproduction,\n      and distribution as defined by Sections 1 through 9 of this document.\n\n      \"Licensor\" shall mean the copyright owner or entity authorized by\n      the copyright owner that is granting the License.\n\n      \"Legal Entity\" shall mean the union of the acting entity and all\n      other entities that control, are controlled by, or are under common\n      control with that entity. For the purposes of this definition,\n      \"control\" means (i) the power, direct or indirect, to cause the\n      direction or management of such entity, whether by contract or\n      otherwise, or (ii) ownership of fifty percent (50%) or more of the\n      outstanding shares, or (iii) beneficial ownership of such entity.\n\n      \"You\" (or \"Your\") shall mean an individual or Legal Entity\n      exercising permissions granted by this License.\n\n      \"Source\" form shall mean the preferred form for making modifications,\n      including but not limited to software source code, documentation\n      source, and configuration files.\n\n      \"Object\" form shall mean any form resulting from mechanical\n      transformation or translation of a Source form, including but\n      not limited to compiled object code, generated documentation,\n      and conversions to other media types.\n\n      \"Work\" shall mean the work of authorship, whether in Source or\n      Object form, made available under the License, as indicated by a\n      copyright notice that is included in or attached to the work\n      (an example is provided in the Appendix below).\n\n      \"Derivative Works\" shall mean any work, whether in Source or Object\n      form, that is based on (or derived from) the Work and for which the\n      editorial revisions, annotations, elaborations, or other modifications\n      represent, as a whole, an original work of authorship. For the purposes\n      of this License, Derivative Works shall not include works that remain\n      separable from, or merely link (or bind by name) to the interfaces of,\n      the Work and Derivative Works thereof.\n\n      \"Contribution\" shall mean any work of authorship, including\n      the original version of the Work and any modifications or additions\n      to that Work or Derivative Works thereof, that is intentionally\n      submitted to Licensor for inclusion in the Work by the copyright owner\n      or by an individual or Legal Entity authorized to submit on behalf of\n      the copyright owner. For the purposes of this definition, \"submitted\"\n      means any form of electronic, verbal, or written communication sent\n      to the Licensor or its representatives, including but not limited to\n      communication on electronic mailing lists, source code control systems,\n      and issue tracking systems that are managed by, or on behalf of, the\n      Licensor for the purpose of discussing and improving the Work, but\n      excluding communication that is conspicuously marked or otherwise\n      designated in writing by the copyright owner as \"Not a Contribution.\"\n\n      \"Contributor\" shall mean Licensor and any individual or Legal Entity\n      on behalf of whom a Contribution has been received by Licensor and\n      subsequently incorporated within the Work.\n\n   2. Grant of Copyright License. Subject to the terms and conditions of\n      this License, each Contributor hereby grants to You a perpetual,\n      worldwide, non-exclusive, no-charge, royalty-free, irrevocable\n      copyright license to reproduce, prepare Derivative Works of,\n      publicly display, publicly perform, sublicense, and distribute the\n      Work and such Derivative Works in Source or Object form.\n\n   3. Grant of Patent License. Subject to the terms and conditions of\n      this License, each Contributor hereby grants to You a perpetual,\n      worldwide, non-exclusive, no-charge, royalty-free, irrevocable\n      (except as stated in this section) patent license to make, have made,\n      use, offer to sell, sell, import, and otherwise transfer the Work,\n      where such license applies only to those patent claims licensable\n      by such Contributor that are necessarily infringed by their\n      Contribution(s) alone or by combination of their Contribution(s)\n      with the Work to which such Contribution(s) was submitted. If You\n      institute patent litigation against any entity (including a\n      cross-claim or counterclaim in a lawsuit) alleging that the Work\n      or a Contribution incorporated within the Work constitutes direct\n      or contributory patent infringement, then any patent licenses\n      granted to You under this License for that Work shall terminate\n      as of the date such litigation is filed.\n\n   4. Redistribution. You may reproduce and distribute copies of the\n      Work or Derivative Works thereof in any medium, with or without\n      modifications, and in Source or Object form, provided that You\n      meet the following conditions:\n\n      (a) You must give any other recipients of the Work or\n          Derivative Works a copy of this License; and\n\n      (b) You must cause any modified files to carry prominent notices\n          stating that You changed the files; and\n\n      (c) You must retain, in the Source form of any Derivative Works\n          that You distribute, all copyright, patent, trademark, and\n          attribution notices from the Source form of the Work,\n          excluding those notices that do not pertain to any part of\n          the Derivative Works; and\n\n      (d) If the Work includes a \"NOTICE\" text file as part of its\n          distribution, then any Derivative Works that You distribute must\n          include a readable copy of the attribution notices contained\n          within such NOTICE file, excluding those notices that do not\n          pertain to any part of the Derivative Works, in at least one\n          of the following places: within a NOTICE text file distributed\n          as part of the Derivative Works; within the Source form or\n          documentation, if provided along with the Derivative Works; or,\n          within a display generated by the Derivative Works, if and\n          wherever such third-party notices normally appear. The contents\n          of the NOTICE file are for informational purposes only and\n          do not modify the License. You may add Your own attribution\n          notices within Derivative Works that You distribute, alongside\n          or as an addendum to the NOTICE text from the Work, provided\n          that such additional attribution notices cannot be construed\n          as modifying the License.\n\n      You may add Your own copyright statement to Your modifications and\n      may provide additional or different license terms and conditions\n      for use, reproduction, or distribution of Your modifications, or\n      for any such Derivative Works as a whole, provided Your use,\n      reproduction, and distribution of the Work otherwise complies with\n      the conditions stated in this License.\n\n   5. Submission of Contributions. Unless You explicitly state otherwise,\n      any Contribution intentionally submitted for inclusion in the Work\n      by You to the Licensor shall be under the terms and conditions of\n      this License, without any additional terms or conditions.\n      Notwithstanding the above, nothing herein shall supersede or modify\n      the terms of any separate license agreement you may have executed\n      with Licensor regarding such Contributions.\n\n   6. Trademarks. This License does not grant permission to use the trade\n      names, trademarks, service marks, or product names of the Licensor,\n      except as required for reasonable and customary use in describing the\n      origin of the Work and reproducing the content of the NOTICE file.\n\n   7. Disclaimer of Warranty. Unless required by applicable law or\n      agreed to in writing, Licensor provides the Work (and each\n      Contributor provides its Contributions) on an \"AS IS\" BASIS,\n      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or\n      implied, including, without limitation, any warranties or conditions\n      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A\n      PARTICULAR PURPOSE. You are solely responsible for determining the\n      appropriateness of using or redistributing the Work and assume any\n      risks associated with Your exercise of permissions under this License.\n\n   8. Limitation of Liability. In no event and under no legal theory,\n      whether in tort (including negligence), contract, or otherwise,\n      unless required by applicable law (such as deliberate and grossly\n      negligent acts) or agreed to in writing, shall any Contributor be\n      liable to You for damages, including any direct, indirect, special,\n      incidental, or consequential damages of any character arising as a\n      result of this License or out of the use or inability to use the\n      Work (including but not limited to damages for loss of goodwill,\n      work stoppage, computer failure or malfunction, or any and all\n      other commercial damages or losses), even if such Contributor\n      has been advised of the possibility of such damages.\n\n   9. Accepting Warranty or Additional Liability. While redistributing\n      the Work or Derivative Works thereof, You may choose to offer,\n      and charge a fee for, acceptance of support, warranty, indemnity,\n      or other liability obligations and/or rights consistent with this\n      License. However, in accepting such obligations, You may act only\n      on Your own behalf and on Your sole responsibility, not on behalf\n      of any other Contributor, and only if You agree to indemnify,\n      defend, and hold each Contributor harmless for any liability\n      incurred by, or claims asserted against, such Contributor by reason\n      of your accepting any such warranty or additional liability.\n\n   END OF TERMS AND CONDITIONS\n\n   APPENDIX: How to apply the Apache License to your work.\n\n      To apply the Apache License to your work, attach the following\n      boilerplate notice, with the fields enclosed by brackets \"[]\"\n      replaced with your own identifying information. (Don't include\n      the brackets!)  The text should be enclosed in the appropriate\n      comment syntax for the file format. We also recommend that a\n      file or class name and description of purpose be included on the\n      same \"printed page\" as the copyright notice for easier\n      identification within third-party archives.\n   Copyright 2024 Alibaba Cloud\n   Licensed under the Apache License, Version 2.0 (the \"License\");\n   you may not use this file except in compliance with the License.\n   You may obtain a copy of the License at\n       http://www.apache.org/licenses/LICENSE-2.0\n   Unless required by applicable law or agreed to in writing, software\n   distributed under the License is distributed on an \"AS IS\" BASIS,\n   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n   See the License for the specific language governing permissions and\n   limitations under the License.",
  "modelfile": "# Modelfile generated by \"ollama show\"\n# To build a new Modelfile based on this, replace FROM with:\n# FROM qwen3:8b\n\nFROM C:\\Users\\work\\.ollama\\models\\blobs\\sha256-a3de86cd1c132c822487ededd47a324c50491393e6565cd14bafa40d0b8e686f\nTEMPLATE \"\"\"\n{{- $lastUserIdx := -1 -}}\n{{- range $idx, $msg := .Messages -}}\n{{- if eq $msg.Role \"user\" }}{{ $lastUserIdx = $idx }}{{ end -}}\n{{- end }}\n{{- if or .System .Tools }}<|im_start|>system\n{{ if .System }}\n{{ .System }}\n{{- end }}\n{{- if .Tools }}\n\n# Tools\n\nYou may call one or more functions to assist with the user query.\n\nYou are provided with function signatures within <tools></tools> XML tags:\n<tools>\n{{- range .Tools }}\n{\"type\": \"function\", \"function\": {{ .Function }}}\n{{- end }}\n</tools>\n\nFor each function call, return a json object with function name and arguments within <tool_call></tool_call> XML tags:\n<tool_call>\n{\"name\": <function-name>, \"arguments\": <args-json-object>}\n</tool_call>\n{{- end -}}\n<|im_end|>\n{{ end }}\n{{- range $i, $_ := .Messages }}\n{{- $last := eq (len (slice $.Messages $i)) 1 -}}\n{{- if eq .Role \"user\" }}<|im_start|>user\n{{ .Content }}\n{{- if and $.IsThinkSet (eq $i $lastUserIdx) }}\n   {{- if $.Think -}}\n      {{- \" \"}}/think\n   {{- else -}}\n      {{- \" \"}}/no_think\n   {{- end -}}\n{{- end }}<|im_end|>\n{{ else if eq .Role \"assistant\" }}<|im_start|>assistant\n{{ if (and $.IsThinkSet (and .Thinking (or $last (gt $i $lastUserIdx)))) -}}\n<think>{{ .Thinking }}</think>\n{{ end -}}\n{{ if .Content }}{{ .Content }}\n{{- else if .ToolCalls }}<tool_call>\n{{ range .ToolCalls }}{\"name\": \"{{ .Function.Name }}\", \"arguments\": {{ .Function.Arguments }}}\n{{ end }}</tool_call>\n{{- end }}{{ if not $last }}<|im_end|>\n{{ end }}\n{{- else if eq .Role \"tool\" }}<|im_start|>user\n<tool_response>\n{{ .Content }}\n</tool_response><|im_end|>\n{{ end }}\n{{- if and (ne .Role \"assistant\") $last }}<|im_start|>assistant\n{{ if and $.IsThinkSet (not $.Think) -}}\n<think>\n\n</think>\n\n{{ end -}}\n{{ end }}\n{{- end }}\"\"\"\nPARAMETER temperature 0.6\nPARAMETER top_k 20\nPARAMETER top_p 0.95\nPARAMETER repeat_penalty 1\nPARAMETER stop <|im_start|>\nPARAMETER stop <|im_end|>\nLICENSE \"\"\"                                 Apache License\n                           Version 2.0, January 2004\n                        http://www.apache.org/licenses/\n\n   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION\n\n   1. Definitions.\n\n      \"License\" shall mean the terms and conditions for use, reproduction,\n      and distribution as defined by Sections 1 through 9 of this document.\n\n      \"Licensor\" shall mean the copyright owner or entity authorized by\n      the copyright owner that is granting the License.\n\n      \"Legal Entity\" shall mean the union of the acting entity and all\n      other entities that control, are controlled by, or are under common\n      control with that entity. For the purposes of this definition,\n      \"control\" means (i) the power, direct or indirect, to cause the\n      direction or management of such entity, whether by contract or\n      otherwise, or (ii) ownership of fifty percent (50%) or more of the\n      outstanding shares, or (iii) beneficial ownership of such entity.\n\n      \"You\" (or \"Your\") shall mean an individual or Legal Entity\n      exercising permissions granted by this License.\n\n      \"Source\" form shall mean the preferred form for making modifications,\n      including but not limited to software source code, documentation\n      source, and configuration files.\n\n      \"Object\" form shall mean any form resulting from mechanical\n      transformation or translation of a Source form, including but\n      not limited to compiled object code, generated documentation,\n      and conversions to other media types.\n\n      \"Work\" shall mean the work of authorship, whether in Source or\n      Object form, made available under the License, as indicated by a\n      copyright notice that is included in or attached to the work\n      (an example is provided in the Appendix below).\n\n      \"Derivative Works\" shall mean any work, whether in Source or Object\n      form, that is based on (or derived from) the Work and for which the\n      editorial revisions, annotations, elaborations, or other modifications\n      represent, as a whole, an original work of authorship. For the purposes\n      of this License, Derivative Works shall not include works that remain\n      separable from, or merely link (or bind by name) to the interfaces of,\n      the Work and Derivative Works thereof.\n\n      \"Contribution\" shall mean any work of authorship, including\n      the original version of the Work and any modifications or additions\n      to that Work or Derivative Works thereof, that is intentionally\n      submitted to Licensor for inclusion in the Work by the copyright owner\n      or by an individual or Legal Entity authorized to submit on behalf of\n      the copyright owner. For the purposes of this definition, \"submitted\"\n      means any form of electronic, verbal, or written communication sent\n      to the Licensor or its representatives, including but not limited to\n      communication on electronic mailing lists, source code control systems,\n      and issue tracking systems that are managed by, or on behalf of, the\n      Licensor for the purpose of discussing and improving the Work, but\n      excluding communication that is conspicuously marked or otherwise\n      designated in writing by the copyright owner as \"Not a Contribution.\"\n\n      \"Contributor\" shall mean Licensor and any individual or Legal Entity\n      on behalf of whom a Contribution has been received by Licensor and\n      subsequently incorporated within the Work.\n\n   2. Grant of Copyright License. Subject to the terms and conditions of\n      this License, each Contributor hereby grants to You a perpetual,\n      worldwide, non-exclusive, no-charge, royalty-free, irrevocable\n      copyright license to reproduce, prepare Derivative Works of,\n      publicly display, publicly perform, sublicense, and distribute the\n      Work and such Derivative Works in Source or Object form.\n\n   3. Grant of Patent License. Subject to the terms and conditions of\n      this License, each Contributor hereby grants to You a perpetual,\n      worldwide, non-exclusive, no-charge, royalty-free, irrevocable\n      (except as stated in this section) patent license to make, have made,\n      use, offer to sell, sell, import, and otherwise transfer the Work,\n      where such license applies only to those patent claims licensable\n      by such Contributor that are necessarily infringed by their\n      Contribution(s) alone or by combination of their Contribution(s)\n      with the Work to which such Contribution(s) was submitted. If You\n      institute patent litigation against any entity (including a\n      cross-claim or counterclaim in a lawsuit) alleging that the Work\n      or a Contribution incorporated within the Work constitutes direct\n      or contributory patent infringement, then any patent licenses\n      granted to You under this License for that Work shall terminate\n      as of the date such litigation is filed.\n\n   4. Redistribution. You may reproduce and distribute copies of the\n      Work or Derivative Works thereof in any medium, with or without\n      modifications, and in Source or Object form, provided that You\n      meet the following conditions:\n\n      (a) You must give any other recipients of the Work or\n          Derivative Works a copy of this License; and\n\n      (b) You must cause any modified files to carry prominent notices\n          stating that You changed the files; and\n\n      (c) You must retain, in the Source form of any Derivative Works\n          that You distribute, all copyright, patent, trademark, and\n          attribution notices from the Source form of the Work,\n          excluding those notices that do not pertain to any part of\n          the Derivative Works; and\n\n      (d) If the Work includes a \"NOTICE\" text file as part of its\n          distribution, then any Derivative Works that You distribute must\n          include a readable copy of the attribution notices contained\n          within such NOTICE file, excluding those notices that do not\n          pertain to any part of the Derivative Works, in at least one\n          of the following places: within a NOTICE text file distributed\n          as part of the Derivative Works; within the Source form or\n          documentation, if provided along with the Derivative Works; or,\n          within a display generated by the Derivative Works, if and\n          wherever such third-party notices normally appear. The contents\n          of the NOTICE file are for informational purposes only and\n          do not modify the License. You may add Your own attribution\n          notices within Derivative Works that You distribute, alongside\n          or as an addendum to the NOTICE text from the Work, provided\n          that such additional attribution notices cannot be construed\n          as modifying the License.\n\n      You may add Your own copyright statement to Your modifications and\n      may provide additional or different license terms and conditions\n      for use, reproduction, or distribution of Your modifications, or\n      for any such Derivative Works as a whole, provided Your use,\n      reproduction, and distribution of the Work otherwise complies with\n      the conditions stated in this License.\n\n   5. Submission of Contributions. Unless You explicitly state otherwise,\n      any Contribution intentionally submitted for inclusion in the Work\n      by You to the Licensor shall be under the terms and conditions of\n      this License, without any additional terms or conditions.\n      Notwithstanding the above, nothing herein shall supersede or modify\n      the terms of any separate license agreement you may have executed\n      with Licensor regarding such Contributions.\n\n   6. Trademarks. This License does not grant permission to use the trade\n      names, trademarks, service marks, or product names of the Licensor,\n      except as required for reasonable and customary use in describing the\n      origin of the Work and reproducing the content of the NOTICE file.\n\n   7. Disclaimer of Warranty. Unless required by applicable law or\n      agreed to in writing, Licensor provides the Work (and each\n      Contributor provides its Contributions) on an \"AS IS\" BASIS,\n      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or\n      implied, including, without limitation, any warranties or conditions\n      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A\n      PARTICULAR PURPOSE. You are solely responsible for determining the\n      appropriateness of using or redistributing the Work and assume any\n      risks associated with Your exercise of permissions under this License.\n\n   8. Limitation of Liability. In no event and under no legal theory,\n      whether in tort (including negligence), contract, or otherwise,\n      unless required by applicable law (such as deliberate and grossly\n      negligent acts) or agreed to in writing, shall any Contributor be\n      liable to You for damages, including any direct, indirect, special,\n      incidental, or consequential damages of any character arising as a\n      result of this License or out of the use or inability to use the\n      Work (including but not limited to damages for loss of goodwill,\n      work stoppage, computer failure or malfunction, or any and all\n      other commercial damages or losses), even if such Contributor\n      has been advised of the possibility of such damages.\n\n   9. Accepting Warranty or Additional Liability. While redistributing\n      the Work or Derivative Works thereof, You may choose to offer,\n      and charge a fee for, acceptance of support, warranty, indemnity,\n      or other liability obligations and/or rights consistent with this\n      License. However, in accepting such obligations, You may act only\n      on Your own behalf and on Your sole responsibility, not on behalf\n      of any other Contributor, and only if You agree to indemnify,\n      defend, and hold each Contributor harmless for any liability\n      incurred by, or claims asserted against, such Contributor by reason\n      of your accepting any such warranty or additional liability.\n\n   END OF TERMS AND CONDITIONS\n\n   APPENDIX: How to apply the Apache License to your work.\n\n      To apply the Apache License to your work, attach the following\n      boilerplate notice, with the fields enclosed by brackets \"[]\"\n      replaced with your own identifying information. (Don't include\n      the brackets!)  The text should be enclosed in the appropriate\n      comment syntax for the file format. We also recommend that a\n      file or class name and description of purpose be included on the\n      same \"printed page\" as the copyright notice for easier\n      identification within third-party archives.\n   Copyright 2024 Alibaba Cloud\n   Licensed under the Apache License, Version 2.0 (the \"License\");\n   you may not use this file except in compliance with the License.\n   You may obtain a copy of the License at\n       http://www.apache.org/licenses/LICENSE-2.0\n   Unless required by applicable law or agreed to in writing, software\n   distributed under the License is distributed on an \"AS IS\" BASIS,\n   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n   See the License for the specific language governing permissions and\n   limitations under the License.\"\"\"\n",
  "parameters": "stop                           \"<|im_start|>\"\nstop                           \"<|im_end|>\"\ntemperature                    0.6\ntop_k                          20\ntop_p                          0.95\nrepeat_penalty                 1",
  "template": "\n{{- $lastUserIdx := -1 -}}\n{{- range $idx, $msg := .Messages -}}\n{{- if eq $msg.Role \"user\" }}{{ $lastUserIdx = $idx }}{{ end -}}\n{{- end }}\n{{- if or .System .Tools }}<|im_start|>system\n{{ if .System }}\n{{ .System }}\n{{- end }}\n{{- if .Tools }}\n\n# Tools\n\nYou may call one or more functions to assist with the user query.\n\nYou are provided with function signatures within <tools></tools> XML tags:\n<tools>\n{{- range .Tools }}\n{\"type\": \"function\", \"function\": {{ .Function }}}\n{{- end }}\n</tools>\n\nFor each function call, return a json object with function name and arguments within <tool_call></tool_call> XML tags:\n<tool_call>\n{\"name\": <function-name>, \"arguments\": <args-json-object>}\n</tool_call>\n{{- end -}}\n<|im_end|>\n{{ end }}\n{{- range $i, $_ := .Messages }}\n{{- $last := eq (len (slice $.Messages $i)) 1 -}}\n{{- if eq .Role \"user\" }}<|im_start|>user\n{{ .Content }}\n{{- if and $.IsThinkSet (eq $i $lastUserIdx) }}\n   {{- if $.Think -}}\n      {{- \" \"}}/think\n   {{- else -}}\n      {{- \" \"}}/no_think\n   {{- end -}}\n{{- end }}<|im_end|>\n{{ else if eq .Role \"assistant\" }}<|im_start|>assistant\n{{ if (and $.IsThinkSet (and .Thinking (or $last (gt $i $lastUserIdx)))) -}}\n<think>{{ .Thinking }}</think>\n{{ end -}}\n{{ if .Content }}{{ .Content }}\n{{- else if .ToolCalls }}<tool_call>\n{{ range .ToolCalls }}{\"name\": \"{{ .Function.Name }}\", \"arguments\": {{ .Function.Arguments }}}\n{{ end }}</tool_call>\n{{- end }}{{ if not $last }}<|im_end|>\n{{ end }}\n{{- else if eq .Role \"tool\" }}<|im_start|>user\n<tool_response>\n{{ .Content }}\n</tool_response><|im_end|>\n{{ end }}\n{{- if and (ne .Role \"assistant\") $last }}<|im_start|>assistant\n{{ if and $.IsThinkSet (not $.Think) -}}\n<think>\n\n</think>\n\n{{ end -}}\n{{ end }}\n{{- end }}",
  "details": {
    "parent_model": "",
    "format": "gguf",
    "family": "qwen3",
    "families": [
      "qwen3"
    ],
    "parameter_size": "8.2B",
    "quantization_level": "Q4_K_M"
  },
  "model_info": {
    "general.architecture": "qwen3",
    "general.basename": "Qwen3",
    "general.file_type": 15,
    "general.license": "apache-2.0",
    "general.parameter_count": 8190735360,
    "general.quantization_version": 2,
    "general.size_label": "8B",
    "general.type": "model",
    "qwen3.attention.head_count": 32,
    "qwen3.attention.head_count_kv": 8,
    "qwen3.attention.key_length": 128,
    "qwen3.attention.layer_norm_rms_epsilon": 0.000001,
    "qwen3.attention.value_length": 128,
    "qwen3.block_count": 36,
    "qwen3.context_length": 40960,
    "qwen3.embedding_length": 4096,
    "qwen3.feed_forward_length": 12288,
    "qwen3.rope.freq_base": 1000000,
    "tokenizer.ggml.add_bos_token": false,
    "tokenizer.ggml.bos_token_id": 151643,
    "tokenizer.ggml.eos_token_id": 151645,
    "tokenizer.ggml.merges": null,
    "tokenizer.ggml.model": "gpt2",
    "tokenizer.ggml.padding_token_id": 151643,
    "tokenizer.ggml.pre": "qwen2",
    "tokenizer.ggml.token_type": null,
    "tokenizer.ggml.tokens": null
  },
  "tensors": [
    {
      "name": "output.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        151936
      ]
    },
    {
      "name": "output_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "token_embd.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        151936
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
      "name": "blk.0.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.0.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.0.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.0.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.0.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.0.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.1.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.1.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.1.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.1.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.1.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.1.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.2.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.2.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.2.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.2.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.2.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.2.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.3.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.3.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.3.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.3.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.3.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.3.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.4.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.4.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.4.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.4.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.4.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.4.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.5.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.5.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.5.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.5.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.5.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.5.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.6.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.6.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.6.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.6.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.6.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.6.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.7.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.7.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.7.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.7.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.7.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.7.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.8.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.8.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.8.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.8.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.8.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.8.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.9.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.9.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.9.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.9.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.9.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.9.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.10.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.10.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.10.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.10.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.10.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.10.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.11.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.11.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.11.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.11.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.11.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.11.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.12.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.12.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.12.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.12.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.12.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.12.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.13.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.13.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.13.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.13.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.13.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.13.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.14.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.14.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.14.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.14.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.14.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.14.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.15.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.15.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.15.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.15.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.15.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.15.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.16.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.16.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.16.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.16.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.16.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.16.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.17.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.17.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.17.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.17.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.17.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.17.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.18.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.18.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.18.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.18.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.18.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.18.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.19.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.19.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.19.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.19.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.19.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.19.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.20.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.20.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.20.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.20.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.20.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.20.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.21.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.21.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.21.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.21.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.21.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.21.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.22.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.22.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.22.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.22.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.22.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.22.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.23.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.23.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.23.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.23.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.23.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.23.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.24.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.24.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.24.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.24.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.24.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.24.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.25.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.25.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.25.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.25.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.25.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.25.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.26.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.26.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.26.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.26.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.26.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.26.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.27.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.27.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.27.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.27.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.27.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.27.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.28.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.28.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.28.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.28.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.28.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.28.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.29.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.29.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.29.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.29.ffn_down.weight",
      "type": "Q4_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.29.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.29.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.30.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.30.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.30.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.30.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.30.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.30.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.31.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
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
      "name": "blk.31.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.31.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.31.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.31.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
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
      "name": "blk.31.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
      ]
    },
    {
      "name": "blk.32.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.32.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.32.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.32.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.32.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.32.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.32.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.32.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.32.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
      ]
    },
    {
      "name": "blk.32.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.32.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
      ]
    },
    {
      "name": "blk.33.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.33.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.33.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.33.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.33.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.33.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.33.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.33.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.33.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
      ]
    },
    {
      "name": "blk.33.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.33.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
      ]
    },
    {
      "name": "blk.34.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.34.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.34.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.34.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.34.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.34.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.34.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.34.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.34.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
      ]
    },
    {
      "name": "blk.34.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.34.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
      ]
    },
    {
      "name": "blk.35.attn_k.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.35.attn_k_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.35.attn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.35.attn_output.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.35.attn_q.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.35.attn_q_norm.weight",
      "type": "F32",
      "shape": [
        128
      ]
    },
    {
      "name": "blk.35.attn_v.weight",
      "type": "F16",
      "shape": [
        4096,
        1024
      ]
    },
    {
      "name": "blk.35.ffn_down.weight",
      "type": "Q6_K",
      "shape": [
        12288,
        4096
      ]
    },
    {
      "name": "blk.35.ffn_gate.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
      ]
    },
    {
      "name": "blk.35.ffn_norm.weight",
      "type": "F32",
      "shape": [
        4096
      ]
    },
    {
      "name": "blk.35.ffn_up.weight",
      "type": "Q4_K",
      "shape": [
        4096,
        12288
      ]
    }
  ],
  "capabilities": [
    "completion",
    "tools",
    "thinking"
  ],
  "modified_at": "2025-07-20T14:30:40.3324961+02:00"
}
```
