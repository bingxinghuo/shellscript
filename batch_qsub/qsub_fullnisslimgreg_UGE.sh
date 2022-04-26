## Full resolution Nissl image registration
## Bingxing Huo
## Use BNB job arrays
#!/bin/bash
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -l m_mem_free=64G
#$ -pe threads 1
#$ -V
#$ -t 4-275
ANIMALID=823 # input
#
SEEDDIR=/nfs/mitraweb2/mnt/disk125/main/marmosetRIKEN/NZ/
SEEDDIR+="m"$ANIMALID"/m"$ANIMALID"N/JP2/"
N=$(ls $SEEDDIR"M"*.jp2 | wc -l)
SEEDFILE=$SEEDDIR
SEEDFILE+=filenames.txt
if [ ! -e $SEEDFILE ]
then
SEEDFILE=~/M$ANIMALID/nisslfiles.txt
ls -h $SEEDDIR"M"*.jp2 | sort -t'_' -k3 > $SEEDFILE
fi

#
date
SEED=$(cat $SEEDFILE | head -n $SGE_TASK_ID | tail -n 1)
SEED=$(basename $SEED)
SAVEDIR=/sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"N/JP2-REG/"
if [ ! -e $SAVEDIR ]; then mkdir -p $SAVEDIR ; fi
if (($SGE_TASK_ID<$N+1)); then  # process files within range
if [ ! -e $SAVEDIR/$SEED ]; then # process only the missing files
source /sonas-hs/it/hpc/home/easybuild/lmod-setup.sh
module load foss/2016a
module load IntelPython/2.7.12
TFDIR=/sonas-hs/mitra/hpc/home/blee/data/
NisslTF1=$TFDIR
NisslTF1+=stackalign/M$ANIMALID"N"/M$ANIMALID"_N_XForm_matrix.txt"
NisslTF2=$TFDIR
NisslTF2+=stackalign/M$ANIMALID"N"/M$ANIMALID"_N_XForm_crop_matrix.txt"
NisslTF3=$TFDIR
NisslTF3+=registration/M$ANIMALID/transforms/M$ANIMALID"_XForm_matrix.txt"
annoimg=$TFDIR
annoimg+=registration/M$ANIMALID/M$ANIMALID"_annotation.img"

#python ~/scripts/Registration/NisslwMRI/applySTSCompositeTransform_fullnissl.py M$ANIMALID $SEEDDIR $NisslTF1  $NisslTF2  $NisslTF3 $annoimg .00092 $SGE_TASK_ID $SGE_TASK_ID ~/M$ANIMALID/nisslreg/
python ~/scripts/Registration/NisslwMRI/applySTSCompositeTransform_fullnissl_kdu.py M$ANIMALID $SEEDDIR $NisslTF1  $NisslTF2  $NisslTF3 $annoimg .00092 $SGE_TASK_ID $SGE_TASK_ID $SAVEDIR
fi
fi
date
