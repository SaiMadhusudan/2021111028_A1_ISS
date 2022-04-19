#!/bin/bash
letters=({A..z})
declare -a word
read word

n=${#word}

for(( i=0; i<n; i++))
do
let next_=$(printf "%d\n" "'"${word:i:1}"")
let next_=next_+1
echo -n "${letters[$next_-65]}"
done

echo ""

