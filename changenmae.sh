#!/bin/bash

for file in `find -name "*C*.jp2" -type f`; do
  mv "$file" "${file/$1/$2}"
  echo "${file/$1/$2}"
  #echo "${file/\/C/\/M}"
done
