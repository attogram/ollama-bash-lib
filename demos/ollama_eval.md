# ollama_eval, oe

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7
## Usage
```bash
ollama_eval "task"          # generate command with random model
ollama_eval "task" "model"  # generate command with specific model
oe "task"                   # alias for ollama_eval
oe "task" "model"           # alias for ollama_eval
```

`oe "make a pretty screensaver in bash"`

```

tinyllama:latest generated the command:

#!/bin/bash
# This script creates a pretty screensaver using Pyscreensaver and PyMoviePy.
# It uses Pyscreensaver's GUI to display the screen on your monitor with your desired parameters, and PyMoviePy to capture the image of your desktop.
# You can customize the following variables:
#    PYTHON_PATH=/path/to/python (default is /usr/bin/python)
#    TARGET=desktop (default is all screens)
# Make sure to set these variables in your environment before running this script.

# Set the default screen size and resolution for the screenshot capture.
if [[ $TARGET == "all" ]]; then
  # If you want to capture the desktop, set the resolution and screen size to the full screen.
  echo "Screen size: $(xrandr | awk '{print $4}' | sed 's/[^0-9]*//g')x$(xrandr | awk '{print $3} | cut -d"/" -f1' | cut -d"x" -f2) (full screen)"
else
  echo "Screen size: $(xrandr | awk '{print $4}' | sed 's/[^0-9]*//g')x$(xrandr | awk '{print $3} | cut -d"/" -f1' | cut -d"x" -f2)"
fi

# Set up Pyscreensaver.
echo "Setting up Pyscreensaver..."
pyscreen_dir=$(dirname "$(command -v pyscreensaver)")
if ! [ -e "$pyscreen_dir/screensaver" ]; then
  mkdir -p "$pyscreen_dir"
fi

# Generate a Pygame-based interface for setting up and starting Pyscreensaver.
echo "Generating Pygame-based interface..."
pygame_path=$(command -v pygame)
if ! [ -e "$pygame_path/lib/site-packages/pygame" ]; then
  pip install pygame
fi
cd "$pyscreen_dir" || exit
python "$(which $(command -v gvim))" "$(dirname $0)/screensaver.py" > "$(pyscreen_dir)/screensaver.log" &> /dev/null

# Capture the desired screen.
echo "Capturing image..."
python "$(which $(command -v gvim))" "$(pyscreen_dir)/capture.py" &>/dev/null

# Display the screen capture on your monitor.
echo "Displaying screenshot on your monitor..."
sleep 0.5
xset s $1+0+0 screen-$1 &> /dev/null

exit

  ❌ Invalid start: #!/bin/bash
[ERROR] ollama_eval: cmd failed sanity check

```

`oe "show me all shell files in current directory"`

```

tinyllama:latest generated the command:

bash 1

  ✅ Valid start: bash
  ✅ Valid Bash Syntax
  ⚠️ WARNING: The generated command contains a potentially dangerous token: "bash"
[ERROR] ollama_eval: cmd failed danger check

```

`oe "find files larger than 1GB"`

```

tinyllama:latest generated the command:

To do the task as you stated in the prompt, you can use the following Bash one-liner:

```bash
find $(find -type f \( -newerm /dev/diskkio \) | grep -v "(size)=" | wc -l) -gt 102400000 &>/dev/null
```

In this Bash one-liner, we have:

1. We first find all files larger than 1 GB using the `find` command, which takes a directory and a filter pattern as arguments. In our case, we are searching for files smaller than the specified 1 GB size (using the `-type f` flag to include both directories and regular files).

2. We then use the `grep` command with `-v` flag to exclude files in this larger than 1 GB directory. This will display only those files which do not match our larger than 1 GB criteria.

3. We use the `wc` command with the `-l` flag to count the number of occurrences of each size (in this case, we are counting the total size of all smaller than 1 GB files in the larger than 1 GB directory).

4. Finally, we output the result (the count of larger than 1 GB files) along with the total file size to the console using `>` and `/dev/null` for stdout and stdout device.

Note that the `-gt` flag is used to search for files in this larger than 1 GB directory, but the size is ignored for this purpose (as we are counting only the file sizes). We can also change this approach to search for smaller than 1 GB files by replacing `1 GB` with some other specific value in the filter pattern.

  ❌ Invalid start: To
[ERROR] ollama_eval: cmd failed sanity check

```

`oe "what version of bash am I using?"`

```

tinyllama:latest generated the command:

Here is a one-line Bash script that performs the given task:

```bash
#!/bin/bash
echo "What version of bash am I using?"
echo "Your current Bash version is $(awk '{print $4}' /etc/issue | sed 's/[^0-9.]//g')."
if ! echo "$(awk '{print $4}' /etc/issue | sed 's/[^0-9.]//g')" | grep -qvF "5\.2\|1\|[0-9]+\.\d+" ; then
    echo "You are on a Linux system, with Bash version 5.2.21 (1 - Release)."
elif ! echo "$(awk '{print $4}' /etc/issue | sed 's/[^0-9.]//g')" | grep -qvF "5\.2\|1\|[0-9]+\.\d+" ; then
    echo "You are on a Linux system, with Bash version 5.2.21 (1)."
else
    echo "Unable to determine your current Bash version."
fi
```

This script uses the `awk` command to check if the current Bash version is in the appropriate range (`5.2\|1\.\d+`). If so, it outputs a message that indicates the current version and the operating system it runs on. If not, it outputs an error message indicating the incorrect version of Bash was detected.

  ❌ Invalid start: Here
[ERROR] ollama_eval: cmd failed sanity check

```

`oe "am I on windows, mac, linux, or what?"`

```

tinyllama:latest generated the command:

bash: On Linux, run this command to install a Bash version.

To do this on Linux, open a terminal and type the following command:

```bash
sudo apt update && sudo apt upgrade
```

This will check for updates and download and install any necessary packages. Once it is done, you should see the text message 'Bash 5.2.21(1)-relayout (x86_64-pc-linux-gnu)' displayed in your terminal.

If you don't see this message or if there are other updates available, go to https://www.microsoft.com/en-us/software-download/windowsinsiderpreviewsbs and run the installer for Windows Insider Preview. Once complete, restart your computer, and you should now have Bash 5.2.21 installed on your system.

If you can't do this task, please provide more information about the Linux system and its version, such as the distribution, the kernel version, and any other relevant details to assist me in identifying an error.

  ❌ Invalid start: bash:
[ERROR] ollama_eval: cmd failed sanity check

```

`oe "get system load"`

```

tinyllama:latest generated the command:

bash

  ✅ Valid start: bash
  ✅ Valid Bash Syntax
  ⚠️ WARNING: The generated command contains a potentially dangerous token: "bash"
[ERROR] ollama_eval: cmd failed danger check

```

`oe ""`

```
Error: -t <task> is required

Usage: ollama_eval [-t <task>] [-m <model>] [<task>] [<model>]

```

`oe "erase all files"`

```

tinyllama:latest generated the command:

I can’t execute a program but I can write a bash one-line command that does the following task: erase all files. Here's the bash one-line command for your convenience:

```bash
$ echo "erase all files" >&2
```

replying with this command will display an error message on standard output and then exit the script with no further action taken. You can modify this command to match your specific requirements or replace it entirely with another command that does something similar.

  ❌ Invalid start: I
[ERROR] ollama_eval: cmd failed sanity check

```

`oe "destroy this computer!"`

```

tinyllama:latest generated the command:

bash $

  ✅ Valid start: bash
  ✅ Valid Bash Syntax
  ⚠️ WARNING: The generated command contains a potentially dangerous token: "bash"
[ERROR] ollama_eval: cmd failed danger check

```
