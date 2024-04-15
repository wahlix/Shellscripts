#!/bin/bash

# Prompt the user for a filename
read -p "Enter a filename: " filename

# Create the file
touch $filename

# Prompt the user to enter text
echo "Enter text (press Ctrl+D to save and exit):"

# Read text from the user and save it in the file
cat >> $filename

echo "Text saved in $filename."ls