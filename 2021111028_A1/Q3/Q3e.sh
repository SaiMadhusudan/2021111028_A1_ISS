#!/bin/bash

#grep -o 'this' data.txt | wc -l
echo -n "" > temp.txt
echo -n "" > temp2.txt
echo -n "" > temp3.txt
echo -n "" > output.txt

while IFS= read -r line || [ -n "$line" ]; 
do 
   for word in $line
   do
    echo "$word" >> temp3.txt
   done
done < $1



sort temp3.txt >> temp2.txt
rm temp.txt
rm temp3.txt


declare -a beforeline
beforeline="_"

while IFS= read -r line || [ -n "$line" ]; 
do 
    if [ "$line" != "$beforeline" ]
    then
        echo -n "$line " 
        grep -w -o "$line" temp2.txt | wc -l 
    fi
    beforeline="$line"
done < temp2.txt



