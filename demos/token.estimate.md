# estimate_tokens

```
estimate_tokens "string"
estimate_tokens "string" 1 (verbose)

My hovercraft is full of eels
tokens : demos/token.estimate.sh: line 58: [: My hovercraft is full of eels: integer expression expected
0 ± 0 (range 0 to 0)
verbose: demos/token.estimate.sh: line 58: [: My hovercraft is full of eels: integer expression expected
0 ± 0 (range 0 to 0)

我的气垫船上满是鳗鱼
tokens : demos/token.estimate.sh: line 58: [: 我的气垫船上满是鳗鱼: integer expression expected
0 ± 0 (range 0 to 0)
verbose: demos/token.estimate.sh: line 58: [: 我的气垫船上满是鳗鱼: integer expression expected
0 ± 0 (range 0 to 0)

(contents of ../README.md)
tokens : demos/token.estimate.sh: line 58: [: ../README.md: integer expression expected
0 ± 0 (range 0 to 0)
verbose: demos/token.estimate.sh: line 58: [: ../README.md: integer expression expected
0 ± 0 (range 0 to 0)

(contents of ../ollama_bash_lib.sh)
tokens : demos/token.estimate.sh: line 120: ../ollama_bash_lib.sh: No such file or directory
verbose: demos/token.estimate.sh: line 122: ../ollama_bash_lib.sh: No such file or directory
```
