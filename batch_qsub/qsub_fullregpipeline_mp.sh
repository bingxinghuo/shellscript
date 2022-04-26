## Full resolution section registration pipeline
## Bingxing Huo
# All sections
#!/bin/bash
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -l m_mem_free=60G
#$ -pe threads 10
#$ -V
source /sonas-hs/it/hpc/home/easybuild/lmod-setup.sh
module load foss/2016a
module load IntelPython/2.7.12

ANIMALID=917 # input
TFDIR=/sonas-hs/mitra/hpc/home/blee/data/

#
SEEDDIR=/nfs/mitraweb2/mnt/disk125/main/marmosetRIKEN/NZ/
mkdir /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/
annoimg=$TFDIR
annoimg+=registration/M$ANIMALID/M$ANIMALID"_annotation.img"
# Register Nissl sections with MRI
SEEDDIR+="m"$ANIMALID"/m"$ANIMALID"N/JP2/"
NisslTF1=$TFDIR
NisslTF1+=stackalign/M$ANIMALID"N"/M$ANIMALID"_N_XForm_matrix.txt"
#NisslTF2=$TFDIR
#NisslTF2+=stackalign/M$ANIMALID"N"/M$ANIMALID"_N_XForm_crop_matrix.txt"
NisslTF2=/sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"_N_XForm_crop_matrix.txt" # M917
NisslTF3=$TFDIR
NisslTF3+=registration/M$ANIMALID/transforms/M$ANIMALID"_XForm_matrix.txt"
#mkdir -p /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"N/JP2-REG/"
mkdir -p /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"N/JP2-REG/"temptif/

date
python /sonas-hs/mitra/hpc/home/bhuo/scripts/Registration/NisslwMRI/applySTSCompositeTransform_fullnissl_kdump.py M$ANIMALID $SEEDDIR $NisslTF1  $NisslTF2  $NisslTF3 $annoimg .00092 /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"N/JP2-REG/"
date

# Register fluorescent sections to Nissl
SEEDDIR=/nfs/mitraweb2/mnt/disk125/main/marmosetRIKEN/NZ/
SEEDDIR+="m"$ANIMALID"/m"$ANIMALID"F/JP2/"
fluTF1m=$TFDIR
fluTF1m+=stackalign/M$ANIMALID"F_maskimg"/M$ANIMALID"_F_XForm_matrix.txt"
fluTF1f=$TFDIR
fluTF1f+=stackalign/M$ANIMALID"F_maskimg"/M$ANIMALID"_F_XForm.txt"
fluTF2=$TFDIR
fluTF2+=stackalign/M$ANIMALID"F_maskimg"/M$ANIMALID"_F_XForm_crop_matrix.txt"
fluTF3m=$TFDIR
fluTF3m+=registration/M$ANIMALID/fluoro/fluoro_transforms/M$ANIMALID"_fluoro_XForm_matrix.txt"
fluTF3f=$TFDIR
fluTF3f+=registration/M$ANIMALID/fluoro/fluoro_transforms/M$ANIMALID"_fluoro_XForm.txt"
#mkdir /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"F/JP2-REG/"
mkdir -p /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"F/JP2-REG/"temptif/
#
date

python /sonas-hs/mitra/hpc/home/bhuo/scripts/Registration/flu2nissl/applySTSCompositeTransform_fullfluo_kdump.py M$ANIMALID $SEEDDIR $fluTF1m $fluTF1f $fluTF2 $fluTF3m $fluTF3f $annoimg .00092 /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"F/JP2-REG/"
#python /sonas-hs/mitra/hpc/home/bhuo/scripts/Registration/flu2nissl/applySTSCompositeTransform_fullfluo_kdump.py M$ANIMALID $SEEDDIR $fluTF1m $fluTF1f $fluTF2 $fluTF3m $fluTF3f $annoimg .0014 /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"F/JP2-REG/" # 920, 921
date

# Register myelin sections to Nissl
#SEEDDIR=/nfs/mitraweb2/mnt/disk125/main/marmosetRIKEN/NZ/
#SEEDDIR+="m"$ANIMALID"/m"$ANIMALID"M/JP2/"
#myelinTF1m=$TFDIR
#myelinTF1m+=stackalign/M$ANIMALID"M"/M$ANIMALID"_M_XForm_matrix.txt"
#myelinTF1f=$TFDIR
#myelinTF1f+=stackalign/M$ANIMALID"M"/M$ANIMALID"_M_XForm.txt"
#myelinTF2=$TFDIR
#myelinTF2+=stackalign/M$ANIMALID"M"/M$ANIMALID"_M_XForm_crop_matrix.txt"
#myelinTF3m=$TFDIR
#myelinTF3m+=registration/M$ANIMALID/myelin/fluoro_transforms/M$ANIMALID"_fluoro_XForm_matrix.txt"
#myelinTF3f=$TFDIR
#myelinTF3f+=registration/M$ANIMALID/myelin/fluoro_transforms/M$ANIMALID"_fluoro_XForm.txt"
##mkdir /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"F/JP2-REG/"
#mkdir -p /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"M/JP2-REG/"temptif/
##
#date
#
#python /sonas-hs/mitra/hpc/home/bhuo/scripts/Registration/flu2nissl/applySTSCompositeTransform_fullfluo_kdump.py M$ANIMALID $SEEDDIR $myelinTF1m $myelinTF1f $myelinTF2 $myelinTF3m $myelinTF3f $annoimg .00092 /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"M/JP2-REG/"
##python /sonas-hs/mitra/hpc/home/bhuo/scripts/Registration/flu2nissl/applySTSCompositeTransform_fullfluo_kdump.py M$ANIMALID $SEEDDIR $myelinTF1m $myelinTF1f $myelinTF2 $myelinTF3m $myelinTF3f $annoimg .0014 /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"F/JP2-REG/" # 920
#date
