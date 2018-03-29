#!/bin/bash

StPicoEventFiles=(StPicoEvent.h StPicoTrack.h StPicoBTofPidTraits.h)
echo changing \#include path for ${StPicoEventFiles[*]}

for codeFile in StRoot/*/*.h StRoot/*/*.cxx StRoot/*/*.C; do
  for picoEventFile in ${StPicoEventFiles[*]}; do
    sed -i 's|StPicoDstMaker/'"$picoEventFile"'|StPicoEvent/'"$picoEventFile"'|g' "$codeFile"
  done
done
