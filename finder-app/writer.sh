#!/bin/bash

if [ $# -ne 2 ];
then
	echo "ERROR: Missing input args"
	exit 1
fi

writeFile="$1"  # full path, including filename
writeStr="$2"

writeDir=$(dirname "$writeFile")

# the -p options, returns flag different from  if any error occurs
mkdir -p "$writeDir"

# the variable $? contains the exit status of the last command
if [ $? -ne 0 ]; 
then
	echo "ERROR: File not created"
	exit 1
fi

echo "$writeStr" > "$writeFile"
if [ $? -ne 0 ]; 
then
	echo "ERROR: File not edited"
	exit 1
fi

