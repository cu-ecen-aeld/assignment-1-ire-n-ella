#!/bin/sh

#echo "Script name: $0"

# checking the number of args
expectedArgs=2
numArgs=$#

if [ $numArgs -lt $expectedArgs ];
then
	echo "ERROR: missing input args";
	exit 1;
fi 

# saving args into variables
filesdir=$1 
searchstr=$2

# checking if the filesdir args is a directory
if  [ ! -d "$filesdir" ];
then
	echo "ERROR: First argument is not an existing directory"
fi

# count the number of files in filesdir
# find <dir> -type f -> finds all files
# wx -l -> returns the number of lines 
numFiles=$(find "$filesdir" -type f | wc -l)
numMatchLines=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are ${numFiles} and the number of matching lines are ${numMatchLines}"

exit 0;
