#!/usr/bin/bash

# handle non-option arguments
if [ $# -eq 0 ]
then
  echo "$0: Bad Argument! At least an input file (1.txt or 2.txt or 3.txt) is required."
  exit 4
fi

echo -e '\nNumber of word counts from the given file(s):\n'

for var in "$@"
  do
    touch merge.txt;
    filename=$var;
    cat $var >> merge.txt ;  
  done
    egrep -o "\b[[:alpha:]]+\b" merge.txt | \

    awk '{ count[$0]++ }
    END {printf("%-14s%s\n","Word","Repeatation") ;
    for(ind in count)
    { printf("%-14s%d\n",ind,count[ind]); }
    }'

rm merge.txt
 