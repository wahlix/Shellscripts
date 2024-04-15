#!/bin/bash

# Hämta namnet från kommandoraden
name=$1

# Kontrollera om namnet är tomt
if [ -z "$name" ]; then
    echo "No name provided."
    exit 1
fi

# Hälsa användaren
echo "Hello, $name! Nice to meet you."