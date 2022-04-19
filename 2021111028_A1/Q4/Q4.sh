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

let s=1
while (($s))
do 
  s=0
   for((i=0;i<n;i++))
   {  
      let a=${arr[i]}
      let b=${arr[i+1]}

      if [ $a -gt $b ]
      then
         arr[i+1]=$a
         arr[i]=$b
         s=$s+1
      fi
   }
done

echo ${arr[@]}
