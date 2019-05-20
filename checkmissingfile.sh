#!/bin/sh

#  checkmissingfile.sh
#  
#
#  Created by Bingxing Huo on 5/17/19.
#
ANIMALID=921
SEEDDIR=/nfs/mitraweb2/mnt/disk125/main/marmosetRIKEN/NZ/
SEEDDIR+="m"$ANIMALID"/m"$ANIMALID"F/JP2/"
SEEDFILE=$SEEDDIR
SEEDFILE+=filenames.txt
SAVEDIR=/sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"F/JP2-REG/"
for ID in {1..400}; do SEED=$(cat $SEEDFILE | head -n $ID | tail -n 1); SEED=$(basename $SEED); if [ ! -e $SAVEDIR/$SEED ]; then echo $SEED; fi; done
