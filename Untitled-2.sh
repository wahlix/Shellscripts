#!/bin/bash
 
word_list=("Barn" "Bil" "Hus" "Gräsmatta" "Träd" "Äpple" "Brevlåda")
 
random_word() {
        local random_index=$((RANDOM % ${#word_list[@]}))
        echo "${word_list[random_index]}"
}
 
echo $(random_word)