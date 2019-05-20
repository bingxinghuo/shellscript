## Full resolution fluorescent image registration
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

tid0=392
tid1=394
#
SEEDDIR=/nfs/mitraweb2/mnt/disk125/main/marmosetRIKEN/NZ/
SEEDDIR+="m"$ANIMALID"/m"$ANIMALID"F/JP2/"
TFDIR=/sonas-hs/mitra/hpc/home/blee/data/
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
annoimg=$TFDIR
annoimg+=registration/M$ANIMALID/M$ANIMALID"_annotation.img"
#
date

source /sonas-hs/it/hpc/home/easybuild/lmod-setup.sh
module load foss/2016a
module load IntelPython/2.7.12
python ~/scripts/Registration/flu2nissl/applySTSCompositeTransform_fullfluo.py M$ANIMALID $SEEDDIR $fluTF1m $fluTF1f $fluTF2 $fluTF3m $fluTF3f $annoimg .00092 $tid0 $tid1 ~/M$ANIMALID/fluoreg/
date
