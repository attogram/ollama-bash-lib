Ollama Bash Lib - Demo - ollama_show, ollama_show_json
ollama_bash_lib: ./../ollama_bash_lib.sh
ollama_lib_version: v0.38.0
ollama_installed: OK
ollama_api_ping: OK

model: codellama:7b

ollama_show "codellama:7b"

  Model
    architecture        llama    
    parameters          6.7B     
    context length      16384    
    embedding length    4096     
    quantization        Q4_0     

  Capabilities
    completion    

  Parameters
    rope_frequency_base    1e+06         
    stop                   "[INST]"      
    stop                   "[/INST]"     
    stop                   "<<SYS>>"     
    stop                   "<</SYS>>"    

  License
    LLAMA 2 COMMUNITY LICENSE AGREEMENT            
    Llama 2 Version Release Date: July 18, 2023    
    ...                                            


ollama_show_json "codellama:7b"

{
  "license": "LLAMA 2 COMMUNITY LICENSE AGREEMENT\t\nLlama 2 Version Release Date: July 18, 2023\n\n\"Agreement\" means the terms and conditions for use, reproduction, distribution and \nmodification of the Llama Materials set forth herein.\n\n\"Documentation\" means the specifications, manuals and documentation \naccompanying Llama 2 distributed by Meta at ai.meta.com/resources/models-and-\nlibraries/llama-downloads/.\n\n\"Licensee\" or \"you\" means you, or your employer or any other person or entity (if \nyou are entering into this Agreement on such person or entity's behalf), of the age \nrequired under applicable laws, rules or regulations to provide legal consent and that \nhas legal authority to bind your employer or such other person or entity if you are \nentering in this Agreement on their behalf.\n\n\"Llama 2\" means the foundational large language models and software and \nalgorithms, including machine-learning model code, trained model weights, \ninference-enabling code, training-enabling code, fine-tuning enabling code and other \nelements of the foregoing distributed by Meta at ai.meta.com/resources/models-and-\nlibraries/llama-downloads/.\n\n\"Llama Materials\" means, collectively, Meta's proprietary Llama 2 and \nDocumentation (and any portion thereof) made available under this Agreement.\n\n\"Meta\" or \"we\" means Meta Platforms Ireland Limited (if you are located in or, if you \nare an entity, your principal place of business is in the EEA or Switzerland) and Meta \nPlatforms, Inc. (if you are located outside of the EEA or Switzerland). \n\nBy clicking \"I Accept\" below or by using or distributing any portion or element of the \nLlama Materials, you agree to be bound by this Agreement.\n\n1. License Rights and Redistribution. \n\n      a. Grant of Rights. You are granted a non-exclusive, worldwide, non-\ntransferable and royalty-free limited license under Meta's intellectual property or \nother rights owned by Meta embodied in the Llama Materials to use, reproduce, \ndistribute, copy, create derivative works of, and make modifications to the Llama \nMaterials.  \n      \n      b. Redistribution and Use.  \n\n            i. If you distribute or make the Llama Materials, or any derivative works \nthereof, available to a third party, you shall provide a copy of this Agreement to such \nthird party. \n            ii.  If you receive Llama Materials, or any derivative works thereof, from \na Licensee as part of an integrated end user product, then Section 2 of this \nAgreement will not apply to you. \n\n            iii. You must retain in all copies of the Llama Materials that you \ndistribute the following attribution notice within a \"Notice\" text file distributed as a \npart of such copies: \"Llama 2 is licensed under the LLAMA 2 Community License, \nCopyright (c) Meta Platforms, Inc. All Rights Reserved.\"\n\n            iv. Your use of the Llama Materials must comply with applicable laws \nand regulations (including trade compliance laws and regulations) and adhere to the \nAcceptable Use Policy for the Llama Materials (available at \nhttps://ai.meta.com/llama/use-policy), which is hereby incorporated by reference into \nthis Agreement.\n\n            v. You will not use the Llama Materials or any output or results of the \nLlama Materials to improve any other large language model (excluding Llama 2 or \nderivative works thereof).  \n\n2. Additional Commercial Terms. If, on the Llama 2 version release date, the \nmonthly active users of the products or services made available by or for Licensee, \nor Licensee's affiliates, is greater than 700 million monthly active users in the \npreceding calendar month, you must request a license from Meta, which Meta may \ngrant to you in its sole discretion, and you are not authorized to exercise any of the \nrights under this Agreement unless or until Meta otherwise expressly grants you \nsuch rights.\n            \n3. Disclaimer of Warranty. UNLESS REQUIRED BY APPLICABLE LAW, THE \nLLAMA MATERIALS AND ANY OUTPUT AND RESULTS THEREFROM ARE \nPROVIDED ON AN \"AS IS\" BASIS, WITHOUT WARRANTIES OF ANY KIND, \nEITHER EXPRESS OR IMPLIED, INCLUDING, WITHOUT LIMITATION, ANY \nWARRANTIES OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY, OR \nFITNESS FOR A PARTICULAR PURPOSE. YOU ARE SOLELY RESPONSIBLE \nFOR DETERMINING THE APPROPRIATENESS OF USING OR REDISTRIBUTING \nTHE LLAMA MATERIALS AND ASSUME ANY RISKS ASSOCIATED WITH YOUR \nUSE OF THE LLAMA MATERIALS AND ANY OUTPUT AND RESULTS.\n\n4. Limitation of Liability. IN NO EVENT WILL META OR ITS AFFILIATES BE \nLIABLE UNDER ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, TORT, \nNEGLIGENCE, PRODUCTS LIABILITY, OR OTHERWISE, ARISING OUT OF THIS \nAGREEMENT, FOR ANY LOST PROFITS OR ANY INDIRECT, SPECIAL, \nCONSEQUENTIAL, INCIDENTAL, EXEMPLARY OR PUNITIVE DAMAGES, EVEN \nIF META OR ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF \nANY OF THE FOREGOING.\n \n5. Intellectual Property.\n\n      a. No trademark licenses are granted under this Agreement, and in \nconnection with the Llama Materials, neither Meta nor Licensee may use any name \nor mark owned by or associated with the other or any of its affiliates, except as \nrequired for reasonable and customary use in describing and redistributing the \nLlama Materials.\n\n      b. Subject to Meta's ownership of Llama Materials and derivatives made by or \nfor Meta, with respect to any derivative works and modifications of the Llama \nMaterials that are made by you, as between you and Meta, you are and will be the \nowner of such derivative works and modifications.\n\n      c. If you institute litigation or other proceedings against Meta or any entity \n(including a cross-claim or counterclaim in a lawsuit) alleging that the Llama \nMaterials or Llama 2 outputs or results, or any portion of any of the foregoing, \nconstitutes infringement of intellectual property or other rights owned or licensable \nby you, then any licenses granted to you under this Agreement shall terminate as of \nthe date such litigation or claim is filed or instituted. You will indemnify and hold \nharmless Meta from and against any claim by any third party arising out of or related \nto your use or distribution of the Llama Materials.\n\n6. Term and Termination. The term of this Agreement will commence upon your \nacceptance of this Agreement or access to the Llama Materials and will continue in \nfull force and effect until terminated in accordance with the terms and conditions \nherein. Meta may terminate this Agreement if you are in breach of any term or \ncondition of this Agreement. Upon termination of this Agreement, you shall delete \nand cease use of the Llama Materials. Sections 3, 4 and 7 shall survive the \ntermination of this Agreement. \n\n7. Governing Law and Jurisdiction. This Agreement will be governed and \nconstrued under the laws of the State of California without regard to choice of law \nprinciples, and the UN Convention on Contracts for the International Sale of Goods \ndoes not apply to this Agreement. The courts of California shall have exclusive \njurisdiction of any dispute arising out of this Agreement. \n\n\n# Llama Code Acceptable Use Policy\n\nMeta is committed to promoting safe and fair use of its tools and features, including Llama Code. If you access or use Llama Code, you agree to this Acceptable Use Policy (“Policy”). The most recent copy of this policy can be found at [ai.meta.com/llama/use-policy](http://ai.meta.com/llama/use-policy).\n\n## Prohibited Uses\nWe want everyone to use Llama Code safely and responsibly. You agree you will not use, or allow others to use, Llama Code to: \n\n1. Violate the law or others’ rights, including to:\n    1. Engage in, promote, generate, contribute to, encourage, plan, incite, or further illegal or unlawful activity or content, such as: \n        1. Violence or terrorism \n        2. Exploitation or harm to children, including the solicitation, creation, acquisition, or dissemination of child exploitative content or failure to report Child Sexual Abuse Material\n        3. Human trafficking, exploitation, and sexual violence\n        4. The illegal distribution of information or materials to minors, including obscene materials, or failure to employ legally required age-gating in connection with such information or materials.\n        5. Sexual solicitation\n        6. Any other criminal activity\n    2. Engage in, promote, incite, or facilitate the harassment, abuse, threatening, or bullying of individuals or groups of individuals\n    3. Engage in, promote, incite, or facilitate discrimination or other unlawful or harmful conduct in the provision of employment, employment benefits, credit, housing, other economic benefits, or other essential goods and services\n    4. Engage in the unauthorized or unlicensed practice of any profession including, but not limited to, financial, legal, medical/health, or related professional practices \n    5. Collect, process, disclose, generate, or infer health, demographic, or other sensitive personal or private information about individuals without rights and consents required by applicable laws\n    6. Engage in or facilitate any action or generate any content that infringes, misappropriates, or otherwise violates any third-party rights, including the outputs or results of any products or services using the Llama 2 Materials\n    7. Create, generate, or facilitate the creation of malicious code, malware, computer viruses or do anything else that could disable, overburden, interfere with or impair the proper working, integrity, operation or appearance of a website or computer system \n\n\n\n2. Engage in, promote, incite, facilitate, or assist in the planning or development of activities that present a risk of death or bodily harm to individuals, including use of Llama Code related to the following:\n    1. Military, warfare, nuclear industries or applications, espionage, use for materials or activities that are subject to the International Traffic Arms Regulations (ITAR) maintained by the United States Department of State\n    2. Guns and illegal weapons (including weapon development)\n    3. Illegal drugs and regulated/controlled substances\n    4. Operation of critical infrastructure, transportation technologies, or heavy machinery\n    5. Self-harm or harm to others, including suicide, cutting, and eating disorders\n    6. Any content intended to incite or promote violence, abuse, or any infliction of bodily harm to an individual\n\n\n\n3. Intentionally deceive or mislead others, including use of Llama Code related to the following:\n    1. Generating, promoting, or furthering fraud or the creation or promotion of disinformation\n    2. Generating, promoting, or furthering defamatory content, including the creation of defamatory statements, images, or other content\n    3. Generating, promoting, or further distributing spam\n    4. Impersonating another individual without consent, authorization, or legal right\n    5. Representing that the use of Llama Code or outputs are human-generated\n    6. Generating or facilitating false online engagement, including fake reviews and other means of fake online engagement \n4. Fail to appropriately disclose to end users any known dangers of your AI system \n\nPlease report any violation of this Policy, software “bug,” or other problems that could lead to a violation of this Policy through one of the following means:\n\n* Reporting issues with the model: [github.com/facebookresearch/llama](http://github.com/facebookresearch/llama)\n* Reporting risky content generated by the model: [developers.facebook.com/llama_output_feedback](http://developers.facebook.com/llama_output_feedback)\n* Reporting bugs and security concerns: [facebook.com/whitehat/info](http://facebook.com/whitehat/info)\n* Reporting violations of the Acceptable Use Policy or unlicensed uses of Llama: [LlamaUseReport@meta.com](mailto:LlamaUseReport@meta.com)\n\n",
  "modelfile": "# Modelfile generated by \"ollama show\"\n# To build a new Modelfile based on this, replace FROM with:\n# FROM codellama:7b\n\nFROM /Users/davidbarberi/.ollama/models/blobs/sha256-3a43f93b78ec50f7c4e4dc8bd1cb3fff5a900e7d574c51a6f7495e48486e0dac\nTEMPLATE \"[INST] <<SYS>>{{ .System }}<</SYS>>\n\n{{ .Prompt }} [/INST]\n\"\nPARAMETER rope_frequency_base 1e+06\nPARAMETER stop [INST]\nPARAMETER stop [/INST]\nPARAMETER stop <<SYS>>\nPARAMETER stop <</SYS>>\nLICENSE \"\"\"LLAMA 2 COMMUNITY LICENSE AGREEMENT\t\nLlama 2 Version Release Date: July 18, 2023\n\n\"Agreement\" means the terms and conditions for use, reproduction, distribution and \nmodification of the Llama Materials set forth herein.\n\n\"Documentation\" means the specifications, manuals and documentation \naccompanying Llama 2 distributed by Meta at ai.meta.com/resources/models-and-\nlibraries/llama-downloads/.\n\n\"Licensee\" or \"you\" means you, or your employer or any other person or entity (if \nyou are entering into this Agreement on such person or entity's behalf), of the age \nrequired under applicable laws, rules or regulations to provide legal consent and that \nhas legal authority to bind your employer or such other person or entity if you are \nentering in this Agreement on their behalf.\n\n\"Llama 2\" means the foundational large language models and software and \nalgorithms, including machine-learning model code, trained model weights, \ninference-enabling code, training-enabling code, fine-tuning enabling code and other \nelements of the foregoing distributed by Meta at ai.meta.com/resources/models-and-\nlibraries/llama-downloads/.\n\n\"Llama Materials\" means, collectively, Meta's proprietary Llama 2 and \nDocumentation (and any portion thereof) made available under this Agreement.\n\n\"Meta\" or \"we\" means Meta Platforms Ireland Limited (if you are located in or, if you \nare an entity, your principal place of business is in the EEA or Switzerland) and Meta \nPlatforms, Inc. (if you are located outside of the EEA or Switzerland). \n\nBy clicking \"I Accept\" below or by using or distributing any portion or element of the \nLlama Materials, you agree to be bound by this Agreement.\n\n1. License Rights and Redistribution. \n\n      a. Grant of Rights. You are granted a non-exclusive, worldwide, non-\ntransferable and royalty-free limited license under Meta's intellectual property or \nother rights owned by Meta embodied in the Llama Materials to use, reproduce, \ndistribute, copy, create derivative works of, and make modifications to the Llama \nMaterials.  \n      \n      b. Redistribution and Use.  \n\n            i. If you distribute or make the Llama Materials, or any derivative works \nthereof, available to a third party, you shall provide a copy of this Agreement to such \nthird party. \n            ii.  If you receive Llama Materials, or any derivative works thereof, from \na Licensee as part of an integrated end user product, then Section 2 of this \nAgreement will not apply to you. \n\n            iii. You must retain in all copies of the Llama Materials that you \ndistribute the following attribution notice within a \"Notice\" text file distributed as a \npart of such copies: \"Llama 2 is licensed under the LLAMA 2 Community License, \nCopyright (c) Meta Platforms, Inc. All Rights Reserved.\"\n\n            iv. Your use of the Llama Materials must comply with applicable laws \nand regulations (including trade compliance laws and regulations) and adhere to the \nAcceptable Use Policy for the Llama Materials (available at \nhttps://ai.meta.com/llama/use-policy), which is hereby incorporated by reference into \nthis Agreement.\n\n            v. You will not use the Llama Materials or any output or results of the \nLlama Materials to improve any other large language model (excluding Llama 2 or \nderivative works thereof).  \n\n2. Additional Commercial Terms. If, on the Llama 2 version release date, the \nmonthly active users of the products or services made available by or for Licensee, \nor Licensee's affiliates, is greater than 700 million monthly active users in the \npreceding calendar month, you must request a license from Meta, which Meta may \ngrant to you in its sole discretion, and you are not authorized to exercise any of the \nrights under this Agreement unless or until Meta otherwise expressly grants you \nsuch rights.\n            \n3. Disclaimer of Warranty. UNLESS REQUIRED BY APPLICABLE LAW, THE \nLLAMA MATERIALS AND ANY OUTPUT AND RESULTS THEREFROM ARE \nPROVIDED ON AN \"AS IS\" BASIS, WITHOUT WARRANTIES OF ANY KIND, \nEITHER EXPRESS OR IMPLIED, INCLUDING, WITHOUT LIMITATION, ANY \nWARRANTIES OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY, OR \nFITNESS FOR A PARTICULAR PURPOSE. YOU ARE SOLELY RESPONSIBLE \nFOR DETERMINING THE APPROPRIATENESS OF USING OR REDISTRIBUTING \nTHE LLAMA MATERIALS AND ASSUME ANY RISKS ASSOCIATED WITH YOUR \nUSE OF THE LLAMA MATERIALS AND ANY OUTPUT AND RESULTS.\n\n4. Limitation of Liability. IN NO EVENT WILL META OR ITS AFFILIATES BE \nLIABLE UNDER ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, TORT, \nNEGLIGENCE, PRODUCTS LIABILITY, OR OTHERWISE, ARISING OUT OF THIS \nAGREEMENT, FOR ANY LOST PROFITS OR ANY INDIRECT, SPECIAL, \nCONSEQUENTIAL, INCIDENTAL, EXEMPLARY OR PUNITIVE DAMAGES, EVEN \nIF META OR ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF \nANY OF THE FOREGOING.\n \n5. Intellectual Property.\n\n      a. No trademark licenses are granted under this Agreement, and in \nconnection with the Llama Materials, neither Meta nor Licensee may use any name \nor mark owned by or associated with the other or any of its affiliates, except as \nrequired for reasonable and customary use in describing and redistributing the \nLlama Materials.\n\n      b. Subject to Meta's ownership of Llama Materials and derivatives made by or \nfor Meta, with respect to any derivative works and modifications of the Llama \nMaterials that are made by you, as between you and Meta, you are and will be the \nowner of such derivative works and modifications.\n\n      c. If you institute litigation or other proceedings against Meta or any entity \n(including a cross-claim or counterclaim in a lawsuit) alleging that the Llama \nMaterials or Llama 2 outputs or results, or any portion of any of the foregoing, \nconstitutes infringement of intellectual property or other rights owned or licensable \nby you, then any licenses granted to you under this Agreement shall terminate as of \nthe date such litigation or claim is filed or instituted. You will indemnify and hold \nharmless Meta from and against any claim by any third party arising out of or related \nto your use or distribution of the Llama Materials.\n\n6. Term and Termination. The term of this Agreement will commence upon your \nacceptance of this Agreement or access to the Llama Materials and will continue in \nfull force and effect until terminated in accordance with the terms and conditions \nherein. Meta may terminate this Agreement if you are in breach of any term or \ncondition of this Agreement. Upon termination of this Agreement, you shall delete \nand cease use of the Llama Materials. Sections 3, 4 and 7 shall survive the \ntermination of this Agreement. \n\n7. Governing Law and Jurisdiction. This Agreement will be governed and \nconstrued under the laws of the State of California without regard to choice of law \nprinciples, and the UN Convention on Contracts for the International Sale of Goods \ndoes not apply to this Agreement. The courts of California shall have exclusive \njurisdiction of any dispute arising out of this Agreement. \n\n\"\"\"\nLICENSE \"# Llama Code Acceptable Use Policy\n\nMeta is committed to promoting safe and fair use of its tools and features, including Llama Code. If you access or use Llama Code, you agree to this Acceptable Use Policy (“Policy”). The most recent copy of this policy can be found at [ai.meta.com/llama/use-policy](http://ai.meta.com/llama/use-policy).\n\n## Prohibited Uses\nWe want everyone to use Llama Code safely and responsibly. You agree you will not use, or allow others to use, Llama Code to: \n\n1. Violate the law or others’ rights, including to:\n    1. Engage in, promote, generate, contribute to, encourage, plan, incite, or further illegal or unlawful activity or content, such as: \n        1. Violence or terrorism \n        2. Exploitation or harm to children, including the solicitation, creation, acquisition, or dissemination of child exploitative content or failure to report Child Sexual Abuse Material\n        3. Human trafficking, exploitation, and sexual violence\n        4. The illegal distribution of information or materials to minors, including obscene materials, or failure to employ legally required age-gating in connection with such information or materials.\n        5. Sexual solicitation\n        6. Any other criminal activity\n    2. Engage in, promote, incite, or facilitate the harassment, abuse, threatening, or bullying of individuals or groups of individuals\n    3. Engage in, promote, incite, or facilitate discrimination or other unlawful or harmful conduct in the provision of employment, employment benefits, credit, housing, other economic benefits, or other essential goods and services\n    4. Engage in the unauthorized or unlicensed practice of any profession including, but not limited to, financial, legal, medical/health, or related professional practices \n    5. Collect, process, disclose, generate, or infer health, demographic, or other sensitive personal or private information about individuals without rights and consents required by applicable laws\n    6. Engage in or facilitate any action or generate any content that infringes, misappropriates, or otherwise violates any third-party rights, including the outputs or results of any products or services using the Llama 2 Materials\n    7. Create, generate, or facilitate the creation of malicious code, malware, computer viruses or do anything else that could disable, overburden, interfere with or impair the proper working, integrity, operation or appearance of a website or computer system \n\n\n\n2. Engage in, promote, incite, facilitate, or assist in the planning or development of activities that present a risk of death or bodily harm to individuals, including use of Llama Code related to the following:\n    1. Military, warfare, nuclear industries or applications, espionage, use for materials or activities that are subject to the International Traffic Arms Regulations (ITAR) maintained by the United States Department of State\n    2. Guns and illegal weapons (including weapon development)\n    3. Illegal drugs and regulated/controlled substances\n    4. Operation of critical infrastructure, transportation technologies, or heavy machinery\n    5. Self-harm or harm to others, including suicide, cutting, and eating disorders\n    6. Any content intended to incite or promote violence, abuse, or any infliction of bodily harm to an individual\n\n\n\n3. Intentionally deceive or mislead others, including use of Llama Code related to the following:\n    1. Generating, promoting, or furthering fraud or the creation or promotion of disinformation\n    2. Generating, promoting, or furthering defamatory content, including the creation of defamatory statements, images, or other content\n    3. Generating, promoting, or further distributing spam\n    4. Impersonating another individual without consent, authorization, or legal right\n    5. Representing that the use of Llama Code or outputs are human-generated\n    6. Generating or facilitating false online engagement, including fake reviews and other means of fake online engagement \n4. Fail to appropriately disclose to end users any known dangers of your AI system \n\nPlease report any violation of this Policy, software “bug,” or other problems that could lead to a violation of this Policy through one of the following means:\n\n* Reporting issues with the model: [github.com/facebookresearch/llama](http://github.com/facebookresearch/llama)\n* Reporting risky content generated by the model: [developers.facebook.com/llama_output_feedback](http://developers.facebook.com/llama_output_feedback)\n* Reporting bugs and security concerns: [facebook.com/whitehat/info](http://facebook.com/whitehat/info)\n* Reporting violations of the Acceptable Use Policy or unlicensed uses of Llama: [LlamaUseReport@meta.com](mailto:LlamaUseReport@meta.com)\n\n\"\n",
  "parameters": "rope_frequency_base            1e+06\nstop                           \"[INST]\"\nstop                           \"[/INST]\"\nstop                           \"<<SYS>>\"\nstop                           \"<</SYS>>\"",
  "template": "[INST] <<SYS>>{{ .System }}<</SYS>>\n\n{{ .Prompt }} [/INST]\n",
  "details": {
    "parent_model": "",
    "format": "gguf",
    "family": "llama",
    "families": null,
    "parameter_size": "7B",
    "quantization_level": "Q4_0"
  },
  "model_info": {
    "general.architecture": "llama",
    "general.file_type": 2,
    "general.parameter_count": 6738546688,
    "general.quantization_version": 2,
    "llama.attention.head_count": 32,
    "llama.attention.head_count_kv": 32,
    "llama.attention.layer_norm_rms_epsilon": 0.00001,
    "llama.block_count": 32,
    "llama.context_length": 16384,
    "llama.embedding_length": 4096,
    "llama.feed_forward_length": 11008,
    "llama.rope.dimension_count": 128,
    "llama.rope.freq_base": 1000000,
    "tokenizer.ggml.bos_token_id": 1,
    "tokenizer.ggml.eos_token_id": 2,
    "tokenizer.ggml.model": "llama",
    "tokenizer.ggml.scores": null,
    "tokenizer.ggml.token_type": null,
    "tokenizer.ggml.tokens": null,
    "tokenizer.ggml.unknown_token_id": 0
  },
  "tensors": [
    {
      "name": "token_embd.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        32016
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.0.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.0.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.0.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.0.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.0.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.1.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.1.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.1.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.1.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.1.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.10.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.10.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.10.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.10.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.10.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.11.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.11.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.11.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.11.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.11.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.12.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.12.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.12.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.12.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.12.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.13.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.13.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.13.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.13.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.13.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.14.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.14.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.14.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.14.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.14.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.15.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.15.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.15.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.15.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.15.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.16.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.16.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.16.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.16.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.16.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.17.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.17.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.17.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.17.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.17.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.18.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.18.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.18.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.18.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.18.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.19.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.19.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.19.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.19.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.19.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.2.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.2.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.2.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.2.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.2.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.20.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.20.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "name": "blk.20.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.20.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.20.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.20.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.21.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.21.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.21.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.21.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.21.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.22.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.22.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.22.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.22.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.22.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.23.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.23.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.23.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.23.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.23.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.3.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.3.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.3.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.3.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.3.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.4.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.4.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.4.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.4.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.4.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.5.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.5.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.5.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.5.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.5.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.6.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.6.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.6.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.6.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.6.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.7.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.7.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.7.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.7.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.7.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.8.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.8.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.8.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.8.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.8.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.9.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.9.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.9.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.9.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.9.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "output.weight",
      "type": "Q6_K",
      "shape": [
        4096,
        32016
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.24.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.24.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.24.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.24.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.24.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.25.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.25.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.25.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.25.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.25.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.26.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.26.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.26.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.26.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.26.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.27.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.27.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.27.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.27.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.27.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.28.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.28.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.28.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.28.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.28.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.29.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.29.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.29.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.29.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.29.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.30.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.30.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.30.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.30.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.30.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
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
      "type": "Q4_0",
      "shape": [
        11008,
        4096
      ]
    },
    {
      "name": "blk.31.ffn_gate.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
      ]
    },
    {
      "name": "blk.31.ffn_up.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        11008
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
      "name": "blk.31.attn_k.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.31.attn_output.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.31.attn_q.weight",
      "type": "Q4_0",
      "shape": [
        4096,
        4096
      ]
    },
    {
      "name": "blk.31.attn_v.weight",
      "type": "Q4_0",
      "shape": [
        4096,
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
  "modified_at": "2025-06-08T21:36:16.944958422+02:00"
}
