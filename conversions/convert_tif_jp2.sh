#!/bin/bash                                                                                                                                                                       
st_tif=".tif"
num=$1
braintype=$2

DIRTIF="/home/mamo/32T/convert/"$num$braintype"/"$num$braintype"-TIF"
DIRJP2="/home/mamo/32T/convert/"$num$braintype"/"$num$braintype"-JP2"

for entry in $(ls $DIRTIF/*tif -v); do
  filename="${entry##*/}"
  real_file=${filename%.tif}

  echo "Original: "$real_file".tif"
  echo "Converted: "$real_file".jp2"
  
  /home/mamo/KakaduSP/build/./kdu_compress -i $DIRTIF/$real_file".tif" -o $DIRJP2/$real_file".jp2" -full -precise -num_threads 8 -rate 1.0 Creversible=yes Clevels=7 Clayers=8 
#  /home/mamo/KakaduSP/build/./kdu_compress -i $DIRTIF/$real_file".tif" -o $DIRJP2/$real_file".jp2" -full -precise -num_threads 8 -rate 1.0 Creversible=yes Clevels=7 Clayers=8 "Cprecincts={256,256},{256,256},{256,256},{128,128},{128,128},{64,64},{64,64},{32,32},{16,16}" Stiles=\{512,512\} Corder=RPCL Cuse_sop=yes ORGgen_plt=yes ORGtparts=R Cblk=\{64,64\}
  echo "FINISH..........."                                                                                                                               
done
