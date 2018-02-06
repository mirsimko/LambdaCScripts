#!/bin/bash

fileName=${1:-pico.list}
numberOfLines=${2:-100000}

split -d --additional-suffix='.list' -l "$numberOfLines" "$fileName"
