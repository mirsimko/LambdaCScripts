#!/bin/bash

StPicoEventFiles=StPicoEvent.h StPicoTrack.h StPicoBTofPidTraits.h

for codeFile in StRoot/*/*.h StRoot/*/*.cxx; do
  for picoEventFile in $StPicoEventFiles; do
    sed -i 's|StPicoDstMaker/'"$picoEventFile"'|StPicoEvent/'"$picoEventFile"'|g' "$codeFile"
  done
done
