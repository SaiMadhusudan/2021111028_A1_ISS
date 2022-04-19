#!/bin/bash

out="$(awk 'NF' $1)"
echo -n "$out" > $1 

echo -n "" > temp.txt

while IFS= read -r line || [ -n "$line" ]; 
do 
   if [ $(grep -o -i "$line" temp.txt | wc -l) == "0" ]
   then 
        echo "$line"
        echo "$line" >> temp.txt
   fi
done < $1

rm temp.txt
