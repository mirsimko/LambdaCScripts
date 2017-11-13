#!/bin/bash

# script for finding good runFiles from good run file list


filename="$1"
# list of good runs
listsDir="$2"
# fileList
goodRuns="${3:-goodRuns.txt}"
# fileList with sorted runs

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



