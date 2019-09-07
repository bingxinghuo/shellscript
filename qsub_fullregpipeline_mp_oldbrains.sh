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

ANIMALID=852 # input
TFDIR=/sonas-hs/mitra/hpc/home/blee/data/

#
SEEDDIR=/nfs/mitraweb2/mnt/disk125/main/marmosetRIKEN/NZ/
mkdir /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/
annoimg=$TFDIR
annoimg+=registration/M$ANIMALID/M$ANIMALID"_STSpipeline_output"/M$ANIMALID"_annotation.img"
## Register Nissl sections with MRI
#SEEDDIR+="m"$ANIMALID"/m"$ANIMALID"N/JP2/"
#NisslTF1=$TFDIR
#NisslTF1+=stackalign/M$ANIMALID"N"/M$ANIMALID"_N_XForm_matrix.txt"
#NisslTF2=$TFDIR
#NisslTF2+=stackalign/M$ANIMALID"N"/M$ANIMALID"_N_XForm_crop_matrix.txt"
#NisslTF3=$TFDIR
#NisslTF3+=registration/M$ANIMALID/M$ANIMALID"_STSpipeline_output"/transforms/M$ANIMALID"_XForm_matrix.txt"
##mkdir -p /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"N/JP2-REG/"
#mkdir -p /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"N/JP2-REG/"temptif/
#
#date
#python /sonas-hs/mitra/hpc/home/bhuo/scripts/Registration/NisslwMRI/applySTSCompositeTransform_fullnissl_kdump.py M$ANIMALID $SEEDDIR $NisslTF1  $NisslTF2  $NisslTF3 $annoimg .00092 /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"N/JP2-REG/"
#date
# Register Nissl sections with atlas
SEEDDIR+="m"$ANIMALID"/m"$ANIMALID"N/JP2/"
NisslTF1m=$TFDIR
NisslTF1m+=stackalign/M$ANIMALID"N"/M$ANIMALID"_N_XForm_matrix.txt"
NisslTF1f=$TFDIR
NisslTF1f+=stackalign/M$ANIMALID"N"/M$ANIMALID"_N_XForm.txt"
NisslTF2=$TFDIR
NisslTF2+=stackalign/M$ANIMALID"N"/M$ANIMALID"_N_XForm_crop_matrix.txt"
NisslTF3=$TFDIR
NisslTF3+=registration/M$ANIMALID/M$ANIMALID"_STSpipeline_output"/transforms/M$ANIMALID"_XForm_firstrotation_matrix.txt"
NisslTF4m=$TFDIR
NisslTF4m+=registration/M$ANIMALID/M$ANIMALID"_STSpipeline_output"/transforms/M$ANIMALID"_XForm_matrix.txt"
NisslTF4f=$TFDIR
NisslTF4f+=registration/M$ANIMALID/M$ANIMALID"_STSpipeline_output"/transforms/M$ANIMALID"_XForm.txt"
NisslTF5=$TFDIR
NisslTF5+=registration/M$ANIMALID/M$ANIMALID"_STSpipeline_output"/transforms/M$ANIMALID"_XForm_finalrotation_matrix.txt"
#mkdir -p /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"N/JP2-REG/"
mkdir -p /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"N/JP2-REG/"temptif/

date
python /sonas-hs/mitra/hpc/home/bhuo/scripts/Registration/Nisslwatlas/applySTSCompositeTransform_fullnisslatlas_kdump.py M$ANIMALID $SEEDDIR $NisslTF1m $NisslTF1f $NisslTF2  $NisslTF3 $NisslTF4m $NisslTF4f $NisslTF5 $annoimg .00092 /sonas-hs/mitra/hpc/home/bhuo/M$ANIMALID/M$ANIMALID"N/JP2-REG/"
date


# Register fluorescent sections to Nissl
SEEDDIR=/nfs/mitraweb2/mnt/disk125/main/marmosetRIKEN/NZ/
SEEDDIR+="m"$ANIMALID"/m"$ANIMALID"F/JP2-8bit/"
#SEEDDIR+="m"$ANIMALID"/m"$ANIMALID"F/JP2/"
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
date
