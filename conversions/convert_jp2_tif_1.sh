#!/bin/bash                                                                                                                                          
# This script accepts any directory with jp2 files
st_tif=".jp2"
SEEDDIR=$1
dsrate=$2

#SEEDDIR=~/marmosetRIKEN/NZ/"$num"/"$num$braintype"
#DIR="/media/mamo/Analysis-8TB/ImageData2/"$num"/jp2/"$num$braintype"-JP2"
#DIR=$3

#Parentdir="$(dirname "$(dirname "$DIR")")"

#echo $Parentdir
mkdir -p $SEEDDIR/STIF-$dsrate
#mkdir -p $Parentdir/small_tif
#mkdir -p $Parentdir/small_tif/${num}${braintype}-STIF

for entry in $(ls $SEEDDIR/*jp2 -v); do
  filename="${entry##*/}"
  new_entry2=${entry}

  real_file=${filename%.jp2}
  new_entry2_left=${entry#*.}
#  echo "Original: "$real_file".jp2"
#  echo "Converted: "$real_file".tif"

kdu_expand -i $SEEDDIR/$real_file".jp2" -o $SEEDDIR/STIF-$dsrate/$real_file".tif" -reduce $dsrate
#  echo "FINISH..........."
done
