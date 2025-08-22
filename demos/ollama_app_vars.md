# ollama_app_vars

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.2

```
OLLAMA_AUTH             : 	# Enables authentication between the Ollama client and server
OLLAMA_CONTEXT_LENGTH   : 	# Context length to use unless otherwise specified (default: 4096)
OLLAMA_DEBUG            : 	# Show additional debug information (e.g. OLLAMA_DEBUG=1)
OLLAMA_FLASH_ATTENTION  : 	# Enabled flash attention
OLLAMA_GPU_OVERHEAD     : 	# Reserve a portion of VRAM per GPU (bytes)
OLLAMA_HOST             : https://ollama.com	# IP Address for the ollama server (default 127.0.0.1:11434)
OLLAMA_INTEL_GPU        : 	# Enable experimental Intel GPU detection
OLLAMA_KEEP_ALIVE       : 	# The duration that models stay loaded in memory (default "5m")
OLLAMA_KV_CACHE_TYPE    : 	# Quantization type for the K/V cache (default: f16)
OLLAMA_LLM_LIBRARY      : 	# Set LLM library to bypass autodetection
OLLAMA_LOAD_TIMEOUT     : 	# How long to allow model loads to stall before giving up (default "5m")
OLLAMA_MAX_LOADED_MODELS: 	# Maximum number of loaded models per GPU
OLLAMA_MAX_QUEUE        : 	# Maximum number of queued requests
OLLAMA_MAX_VRAM         : 	
OLLAMA_MODELS           : 	# The path to the models directory
OLLAMA_MULTIUSER_CACHE  : 	# Optimize prompt caching for multi-user scenarios
OLLAMA_NEW_ENGINE       : 	# Enable the new Ollama engine
OLLAMA_NOHISTORY        : 	# Do not preserve readline history
OLLAMA_NOPRUNE          : 	# Do not prune model blobs on startup
OLLAMA_NUM_PARALLEL     : 	# Maximum number of parallel request
OLLAMA_ORIGINS          : 	# A comma separated list of allowed origins
OLLAMA_RUNNERS_DIR      : 	# Sets the location for runners
OLLAMA_SCHED_SPREAD     : 	# Always schedule model across all GPUs
OLLAMA_TEST_EXISTING    : 	
OLLAMA_TMPDIR           : 	
CUDA_VISIBLE_DEVICES    : 	# Set which NVIDIA devices are visible
GPU_DEVICE_ORDINAL      : 	# Set which AMD devices are visible by numeric ID
HIP_PATH                : 	
HIP_VISIBLE_DEVICES     : 	# Set which AMD devices are visible by numeric ID
HSA_OVERRIDE_GFX_VERSION: 	# Override the gfx used for all detected AMD GPUs
HTTP_PROXY              : 	
JETSON_JETPACK          : 	
LD_LIBRARY_PATHS        : 	
ROCR_VISIBLE_DEVICES    : 	# Set which AMD devices are visible by UUID or numeric ID
TERM                    : xterm-256color	
```
