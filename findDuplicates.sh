#!/bin/bash

file=picoList_all.list

echo sorting ...
sort $file > tmp.list

echo Looking for duplicates ...

lastLine=0
nDuplicates=0
while read -r line; do
  if [ "$lastLine" = "$line" ]; then
    echo $line
    let nDuplicates++
  fi
  lastLine="$line"
done < tmp.list

echo $nDuplicates duplicates found

rm tmp.list
