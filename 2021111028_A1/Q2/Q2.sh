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
           echo -n "${word[0]:1} "
           let j=2
           continue
        }
        fi

        if [ "$j" = "2" ];
        then
        {
           echo -n "${word} "
           let j=2
        }
       fi
    done

   if [ "$j" = "2" ];
   then
        {
            echo -n "once said \""
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
         echo -n "${word} "
      }
      fi
   done
   
   if [ "$j" = "2" ];
   then
   {
      echo "\" "
   }
   fi
   
   if [ "$j" = "0" ];
   then
   {
      echo ""
   }
   fi

   let j=0

done < $1

