#!/bin/bash

config_file="$1"
keyword="$2"
value="$3"

backup_file="$config_file.$(date +"%Y%m%d%H%M%S").bak"

# Check if all arguments are provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <config_file> <keyword> <value>"
    exit 1
fi

# Check if the config file exists
if [ -f "$config_file" ]; then
    # config_file exists => create backup
    backup_dir="$(dirname "$0")/.backup"
    if [ ! -d "$backup_dir" ]; then
        sudo mkdir -p "$backup_dir"
        echo "Directory $backup_dir created."
    fi
    sudo cp "$config_file" "$backup_file"
else
    # config_file doesn't exist => create config_file
    directory=$(dirname "$config_file")
    if [ ! -d "$directory" ]; then
        mkdir -p "$directory"
        echo "Directory $directory created."
    fi
    touch "$config_file"
    echo "File $config_file created."
fi

# Check if the keyword already exists in the config file as a whole word
old=$(grep -E "^\s*#?\s*$keyword\s*=\s*.+\s*$" "$config_file")
if [ -n "$old" ]; then
    # Keyword exists, replace the value and uncomment if necessary
    new=$(echo "$old" | sed 's/#//')
    new=$(echo "$new" | sed -E "s/\s*=.*/=$value/")

    if diff -w <(echo "$old") <(echo "$new") >/dev/null; then
        echo "Nothing changed"
    else
        sed -i "s/$old/$new/" "$config_file"
    fi
else
    # Keyword doesn't exist, add it at the end of the file
    echo "$keyword=$value" | sudo tee -a "$config_file" > /dev/null
fi

if diff -NwU 0 $backup_file $config_file; then
    sudo rm "$backup_file"
else
    sudo mv "$backup_file" "$backup_dir" 2>/dev/null
fi
