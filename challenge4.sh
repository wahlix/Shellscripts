#!/bin/bash

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <number1> <number2>"
    exit 1
fi

# Assign the arguments to variables
number1=$1
number2=$2

# Compare the numbers
if [ $number1 -gt $number2 ]; then
    echo "$number1 is greater than $number2"
elif [ $number1 -lt $number2 ]; then
    echo "$number2 is greater than $number1"
else
    echo "Both numbers are equal"
