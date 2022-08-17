#!/bin/bash


#script global variables
VAR=1
OTHER_VAR=other
#OTHER_WITH_SPACES=with spaces               #will not work
WITH_SPACES_QUOTED="with spaces"

echo "script global variables VAR=$VAR TEXT=$OTHER_VAR WITH_SPACES_QUOTED=$WITH_SPACES_QUOTED"

#SUBJECT="Test Subject" ./l03_variables_functions.sh first_param
#> first parameter: 'first_param', environment variable SUBJECT: 'Test Subject'
echo "first parameter: '$1', environment variable SUBJECT: '$SUBJECT'"

_FIRST_PARAM=$1
my_function() {
    #script local variable
    local SUBJECT=12345   #do not overwrite
    echo "my_function first parameter: '$1', bash script first param: $_FIRST_PARAM, local SUBJECT:'$SUBJECT'"
    echo $SUBJECT
}
my_function 'fun_param'

echo "env value '$SUBJECT' has not changed"


echo "call native linux ls function"
ls

#overwrite ls in this script, and still call native "local"
ls() {
    echo "call overwritten ls"
    command ls
}
ls


# arrays does not seem to work in a /bin/sh script
MY_ARRAY=(2 "ab c" true 1.0)
echo $MY_ARRAY          #>2                 first item
echo ${MY_ARRAY[0]}     #>2                 again first item
echo ${MY_ARRAY[1]}     #>ab c              again first item
echo ${MY_ARRAY[-1]}    #>1.0               last item
echo ${MY_ARRAY[5]}     #>                  empty
echo ${MY_ARRAY[@]}     #> 2 ab c true 1.0  all values

echo ${#MY_ARRAY[@]}    #>4                  array length

MY_ARRAY+=(111,222)
echo ${#MY_ARRAY[@]}    
echo ${MY_ARRAY[@]}     

echo ${MY_ARRAY[@]:2:2}  #>true 1.0         take two items, starting from index 2
echo ${MY_ARRAY[@]::1}   #1                 take one from the beginning
echo ${MY_ARRAY[@]:3}    #111,222           take from index 3 till the end
