#!/bin/bash

char_="~"
let n=0

while read line
do 
let   n=n+1
done < "${1:-/dev/stdin}" 

let j=0

for(( i=0; i<n;i++ )) 
do
    read line
    linetemp="$line"
    for word in $linetemp;
    do
        if [ "${word[0]:0:1}" = "$char_" ];
        then
        {
           let j=1        
        }
        fi
        
        if [ "$j" = "1" ];
        then
        {
           echo -n "${word[0]:1} " >> speech.txt
           let j=2
           continue
        }
        fi

        if [ "$j" = "2" ];
        then
        {
           echo -n "${word} " >> speech.txt
           let j=2
        }
       fi
    done

   if [ "$j" = "2" ];
   then
        {
            echo -n "once said,\"" >> speech.txt
        }
   fi

   let j=0;

   for word in $linetemp;
   do
      if [ "${word[0]:0:1}" = "$char_" ];
      then
      {
         let j=2
      }
      fi
        
      if [ "${word[0]:0:1}" != "$char_" ] && [ "$j" = "0" ];
      then
      {  
         if [[ "${word}" == *"."* ]]; 
         then
         word="${word[*]/"."/\"}"
         echo -n "${word}" >> speech.txt
         echo -n "." >> speech.txt
         else
         echo -n "${word} " >> speech.txt
         fi
      }
      fi
   done

   if [ "$j" = "2" ];
   then
   {
      echo "" >> speech.txt
   }
   fi
   
   if [ "$j" = "0" ];
   then
   {
      echo "" >> speech.txt
   }
   fi

   let j=0
done < $1
