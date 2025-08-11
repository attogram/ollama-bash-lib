# estimate_tokens

```
estimate_tokens "string"
estimate_tokens "string" 1 (verbose)

My hovercraft is full of eels
tokens : ./token.estimate.sh: line 58: [: My hovercraft is full of eels: integer expression expected
0 ± 0 (range 0 to 0)
verbose: ./token.estimate.sh: line 58: [: My hovercraft is full of eels: integer expression expected
0 ± 0 (range 0 to 0)

我的气垫船上满是鳗鱼
tokens : ./token.estimate.sh: line 58: [: 我的气垫船上满是鳗鱼: integer expression expected
0 ± 0 (range 0 to 0)
verbose: ./token.estimate.sh: line 58: [: 我的气垫船上满是鳗鱼: integer expression expected
0 ± 0 (range 0 to 0)

(contents of ../README.md)
tokens : ./token.estimate.sh: line 58: [: ../README.md: integer expression expected
0 ± 0 (range 0 to 0)
verbose: ./token.estimate.sh: line 58: [: ../README.md: integer expression expected
0 ± 0 (range 0 to 0)

(contents of ../ollama_bash_lib.sh)
tokens : 8579
verbose: 8579 ± 2534 (range 6045 to 8579)
```
