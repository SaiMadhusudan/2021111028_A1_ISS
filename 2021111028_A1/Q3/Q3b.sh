#!/bin/bash

let i=0

while IFS= read -r line || [ -n "$line" ]; 
do
    let i=i+1
done < $1



echo "$i"