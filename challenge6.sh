#!/bin/bash

# Specify the path to your text file
file_path="path/to/your/text/file.txt"

# Read each line from the file and print it
while IFS= read -r line; do
    echo "$line"
done < "$file_path"