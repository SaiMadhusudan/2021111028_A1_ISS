#!/bin/bash
 

read line
line=$(printf '%s' "$line" | tr ',' ' ')

for word in $line
do
echo "${word}"
done
