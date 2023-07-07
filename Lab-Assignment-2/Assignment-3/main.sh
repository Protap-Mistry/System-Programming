#!/usr/bin/bash

# passwd file are look like below
# username : password : user ID : group ID : user ID info : home directory : command shell

# handle non-option arguments
if [[ $# -ne 1 ]]; then # '$#' is always numeric. $# Denotes the number of command line arguments or positional parameters
    echo "$0: Bad Argument! A single input file (passwd) is required."
    # $0 Expands to the name of the shell or shell script.
    exit 4 # Interrupted system call
fi # Fundamental control statement that allows Shell to make decisions and execute statements conditionally
echo -e '\nDuplicate users are as follows:\n'

'''
Awk is a utility that enables a programmer to write tiny but effective programs in the form of statements that define text patterns
that are to be searched for in each line of a document and the action that is to be taken when a match is found within a line.
Awk is mostly used for pattern scanning and processing.
Syntax: awk options ''selection _criteria {action }'' input-file > output-file
-F <value> - tells awk what field separator to use. In your case, -F: means that the separator is : (colon)
$1 and $2 denote the first and second command line argument passed, respectively
'''
awk -F: '++count[$1] == 2 {uids[$1]} END {for (s in uids) print s}' $1
echo -e '\nUnique shell used among all the duplicate users above:\n'
awk -F: '++count[$1] == 2 {shell[$NF]} END {for (s in shell) print s}' $1

'''
NF is a predefined variable whose value is the number of fields in the current record.
awk automatically updates the value of NF each time it reads a record.
No matter how many fields there are, the last field in a record can be represented by $NF .
'''