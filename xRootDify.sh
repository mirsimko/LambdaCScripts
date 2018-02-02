#!/bin/bash

fileName=${1:-test_pico.list}

sed -i -e 's|^/home/starlib|root://xrdstar.rcf.bnl.gov:1095//home/starlib|g' "$fileName"
