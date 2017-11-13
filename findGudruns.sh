#!/bin/bash

filename="$1"
listsDir="$2"
goodRuns="${3:-goodRuns.txt}"

if [ ! -f "$filename" ]; then
  echo Filelist not found
  echo Exitting ...
  exit 1
fi

if [ ! -f "$listsDir" ]; then
  echo listsDir not found
  echo Exitting ...
  exit 1
fi

touch "$goodRuns"

while read -r run; do
  grep "$line" "$listsDir" >> "$goodRuns"
done < "$filename"



