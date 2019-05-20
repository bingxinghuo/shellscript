## Full resolution Nissl image registration
## Bingxing Huo
# Specific sections
#!/bin/bash
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -l m_mem_free=64G
#$ -pe threads 1
#$ -V
ANIMALID=1146 # input
tid0=200
tid1=200
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
#

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
python ~/scripts/Registration/NisslwMRI/applySTSCompositeTransform_fullnissl_kdu.py M$ANIMALID $SEEDDIR $NisslTF1  $NisslTF2  $NisslTF3 $annoimg .00092 $tid0 $tid1 ~/M$ANIMALID/nisslreg/
date
