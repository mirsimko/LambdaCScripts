#/bin/bash

fileList=picoList_all.list
# output file
cleanedList=$( echo "$fileList" | sed 's/.list//g' )_cleaned.list

cp "$fileList" "$cleanedList"
for dayNumber in $( seq -w 107 ); do
  grep -v '/P16id/'"$dayNumber"'/' "$cleanedList" > temp.list # remove lines with this day number
  mv temp.list "$cleanedList"
done
  

