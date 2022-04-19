#!/bin/bash

function 3a()
{
function  size_c()
{
    wc -c $1 | awk '{print $1}'
}

declare -a line
line=$(size_c $1)
echo "${line[0]}"
}

function 3b()
{
let i=0

while IFS= read -r line || [ -n "$line" ]; 
do
    let i=i+1
done < $1
echo "$i"
}

function 3c()
{
    function  size_c()
{
    wc -w $1 | awk '{print $1}'
}

declare -a line
line=$(size_c $1)
echo "${line}"
}

function 3d()
{
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
}

function 3e()
{
    echo -n "" > temp.txt
while IFS= read -r line || [ -n "$line" ]; 
do 
   for word in $line
   do
     echo  "$word $( grep -o -i "$word" data.txt | wc -l)" >> temp.txt
   done
done < $1

echo -n "" > temp2.txt

while IFS= read -r line || [ -n "$line" ]; 
do 
   if [ $(grep -o -i "$line" temp2.txt | wc -l) == "0" ]
   then
        echo "$line"
        echo "$line" >> temp2.txt
   fi
done < temp.txt
rm temp.txt
rm temp2.txt
}

echo -n "size of file "
3a $1
echo -n "Number of lines "
3b $1
echo -n "Number of words "
3c $1
echo "Line No: <> - Count of Word "
3d $1
echo "Word count"
3e $1
