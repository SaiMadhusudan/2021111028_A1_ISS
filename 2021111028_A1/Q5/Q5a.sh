#!/bin/bash

declare -a arr
read arr

let m=${#arr}
let i=0
for((;i<m;i++))
do
echo -n "${arr[0]:m-1-i:1}" 
done


echo ${rarr[*]}
