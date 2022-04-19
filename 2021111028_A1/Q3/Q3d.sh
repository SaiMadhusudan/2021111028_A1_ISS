#!/bin/bash

let i=0

declare -a line

 wordcount_()
{
    wc -w $1 | awk '{print $1}'
}

while IFS= read -r line || [ -n "$line" ]; 
do
let i=i+1
echo "$line" > temp.txt
words=$(wordcount_ temp.txt);
echo  "$i $words" 
done < $1

rm temp.txt