#!/bin/bash
 
read line
line=$(printf '%s' "$line" | tr ',' ' ')

declare -a arr
let i=0
for word in $line
do
arr[i]="${word}"
let i=i+1
done

let n=${#arr[*]} 
let n--

let swap_count=1
while (($swap_count))
do 
  swap_count=0
   for((i=0;i<n;i++))
   {  
      if [ ${arr[i]} -gt ${arr[i+1]} ]
      then
         let temp=${arr[i]}
         arr[i]=${arr[i+1]}
         arr[i+1]=$temp
         swap_count=$swap_count+1
      fi
   }
done

echo ${arr[@]}
