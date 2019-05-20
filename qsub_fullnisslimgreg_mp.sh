#!/bin/bash
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -l m_mem_free=59G
#$ -pe threads 10
#$ -V
ANIMALID=1147 # input
#
SEEDDIR=/nfs/mitraweb2/mnt/disk125/main/marmosetRIKEN/NZ/
SEEDDIR+="m"$ANIMALID"/m"$ANIMALID"N/JP2/"
TFDIR=/sonas-hs/mitra/hpc/home/blee/data/
NisslTF1=$TFDIR
NisslTF1+=stackalign/M$ANIMALID"N"/M$ANIMALID"_N_XForm_matrix.txt"
NisslTF2=$TFDIR
NisslTF2+=stackalign/M$ANIMALID"N"/M$ANIMALID"_N_XForm_crop_matrix.txt"
NisslTF3=$TFDIR
NisslTF3+=registration/M$ANIMALID/transforms/M$ANIMALID"_XForm_matrix.txt"
annoimg=$TFDIR
annoimg+=registration/M$ANIMALID/M$ANIMALID"_annotation.img"

date
source /sonas-hs/it/hpc/home/easybuild/lmod-setup.sh
#module load GCC/4.9.3-binutils-2.25
#module load OpenMPI/.1.8.8
#module load Python/2.7.10
module load foss/2016a
module load IntelPython/2.7.12
#python ~/code/mouseRegistration_bnb.py $targetnumber
#echo $targetnumber
#/opt/hpc/pkg/MATLAB/R2015b/bin/matlab -nodesktop -r "MRI_alignment_bnb;exit"
#echo $targetnumber

#python ~/scripts/Registration/NisslwMRI/applySTSCompositeTransform_fullnissl_mp.py M$ANIMALID $SEEDDIR $NisslTF1  $NisslTF2  $NisslTF3 $annoimg .00092 ~/M$ANIMALID/nisslreg/
python ~/scripts/Registration/NisslwMRI/applySTSCompositeTransform_fullnissl_kdump.py M$ANIMALID $SEEDDIR $NisslTF1  $NisslTF2  $NisslTF3 $annoimg .00092 ~/M$ANIMALID/nisslreg/
date
