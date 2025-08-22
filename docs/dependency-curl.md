# Dependency: curl

`curl` is used for making API requests. It is an optional dependency, but required for most functions.

## Installation

`curl` is pre-installed on most Linux and macOS systems.

### Linux (apt)
```bash
sudo apt-get install curl
```

### Linux (yum)
```bash
sudo yum install curl
```

### macOS (Homebrew)
`curl` is pre-installed on macOS. If you need to install it:
```bash
brew install curl
```

### Windows
Windows 10 and later include `curl`. For older versions, you can download it from the official website: [https://curl.se/windows/](https://curl.se/windows/)

### Cygwin
```bash
setup-x86_64.exe -q -P curl
```

## Updating

Follow the instructions for your package manager to update `curl`. For example, on a Debian-based system:
```bash
sudo apt-get update
sudo apt-get upgrade curl
```
