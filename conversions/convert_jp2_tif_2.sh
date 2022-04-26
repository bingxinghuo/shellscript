#!/bin/bash                                                                                                                                          
# This script accepts any directory with jp2 files
st_tif=".jp2"
INPUTDIR=$1
OUTPUTDIR=$2
dsrate=$3

#SEEDDIR=~/marmosetRIKEN/NZ/"$num"/"$num$braintype"
#DIR="/media/mamo/Analysis-8TB/ImageData2/"$num"/jp2/"$num$braintype"-JP2"
#DIR=$3

#Parentdir="$(dirname "$(dirname "$DIR")")"

#echo $Parentdir
#mkdir -p $OUTPUTDIR/STIF-$dsrate
#mkdir -p $Parentdir/small_tif
#mkdir -p $Parentdir/small_tif/${num}${braintype}-STIF

for entry in $(ls $INPUTDIR/*jp2 -v); do
  filename="${entry##*/}"
  new_entry2=${entry}

  real_file=${filename%.jp2}
  new_entry2_left=${entry#*.}
#  echo "Original: "$real_file".jp2"
#  echo "Converted: "$real_file".tif"

kdu_expand -i $INPUTDIR/$real_file".jp2" -o $OUTPUTDIR/$real_file".tif" -reduce $dsrate
#  echo "FINISH..........."
done
