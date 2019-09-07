## Full resolution fluorescent image registration
## Bingxing Huo
# Specific sections
#!/bin/bash
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -l m_mem_free=60G
#$ -pe threads 10
#$ -V
ANIMALID=921 # input

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
#python ~/scripts/Registration/flu2nissl/applySTSCompositeTransform_fullfluo_kdump.py M$ANIMALID $SEEDDIR $fluTF1m $fluTF1f $fluTF2 $fluTF3m $fluTF3f $annoimg .00092 ~/M$ANIMALID/fluoreg/
python ~/scripts/Registration/flu2nissl/applySTSCompositeTransform_fullfluo_kdump.py M$ANIMALID $SEEDDIR $fluTF1m $fluTF1f $fluTF2 $fluTF3m $fluTF3f $annoimg .0014 ~/M$ANIMALID/fluoreg/  # 920, 921, 821
date
