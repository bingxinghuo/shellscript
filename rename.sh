#!/bin/sh
num=1
for file in $(ls -v); do
    #echo "$file"
    #echo "$(printf "m819n_%03u" $num).tif"
    ls "$(printf $file "," $num)" > textfile.txt
    #mv "$file" "$(printf "m819n_%03u" $num).tif"
    #let num=$num+1
    num=$(($num+1))
done



