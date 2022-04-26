#!/bin/bash                                                                                                                                          

st_tif=".jp2"
num=$1
braintype=$2

SEEDDIR=~/marmosetRIKEN/NZ/"$num"/"$num$braintype"
#DIR="/media/mamo/Analysis-8TB/ImageData2/"$num"/jp2/"$num$braintype"-JP2"
#DIR=$3

Parentdir="$(dirname "$(dirname "$DIR")")"

#echo $Parentdir
mkdir -p $SEEDDIR/${num}${braintype}-STIF
#mkdir -p $Parentdir/small_tif
#mkdir -p $Parentdir/small_tif/${num}${braintype}-STIF

for entry in $(ls $SEEDDIR/JP2/*jp2 -v); do
  filename="${entry##*/}"
  new_entry2=${entry}

  real_file=${filename%.jp2}
  new_entry2_left=${entry#*.}
#  echo "Original: "$real_file".jp2"
#  echo "Converted: "$real_file".tif"

  kdu_expand -i $SEEDDIR/JP2/$real_file".jp2" -o $SEEDDIR/${num}${braintype}-STIF/$real_file".tif" -reduce 6
#  echo "FINISH..........."
done
