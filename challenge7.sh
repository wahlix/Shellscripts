#!/bin/bash

# Define the list of words
words=("apple" "banana" "carrot" "dog" "elephant")

# Define the function to print a random word
print_random_word() {
    # Get the length of the words array
    length=${#words[@]}

    # Generate a random index within the range of the array length
    index=$((RANDOM % length))

    # Print the word at the random index
    echo "${words[index]}"
}

# Call the function to print a random word
print_random_word