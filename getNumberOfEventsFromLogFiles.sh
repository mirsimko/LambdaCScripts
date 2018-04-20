#!/bin/bash

nEvents=0
for logFile in *.log;
do
  # get the last word in the 5th line from the back
  eventsInFile=`tail -n 5 "$logFile" | head -n 1 | grep -oE '[^ ]+$'`
  let nEvents+=eventsInFile
done

echo $nEvents
