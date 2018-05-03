#!/bin/bash

jobArrayNumber="$1"
nJobs=`let $2 - 1`
memory=${3:-3500}

for id in $( seq 0 $nJobs );
do
  scontrol update job="$jobArrayNumber"_"$id" MinMemoryCPU="$memory"; 
done
