#!/bin/bash
letters=({A..z})
declare -a arr
read arr

let m=${#arr}
let i=0
for((;i<m;i++))
do
echo -n "${arr[0]:m-1-i:1}" 
done
echo ""


declare -a word
word=$arr

n=${#word}

for(( i=0; i<n; i++))
do
let next_=$(printf "%d\n" "'"${word[0]:m-1-i:1}"")
let next_=next_+1
echo -n "${letters[$next_-65]}"
done

echo ""

let m=${#arr}
let m=m/2

let i=0
for((;i<m;i++))
do
echo -n "${arr[0]:m-1-i:1}" 
done

for((;i<2*m;i++))
do
echo -n "${arr[0]:i:1}" 
done

echo ""
