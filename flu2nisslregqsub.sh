#!/bin/bash
# specify BASH shell
#$ -S /bin/bash
# run job in the current working directory where qsub is executed from
#$ -cwd
#  specify that the job requires 128GB of memory
#$ -l m_mem_free=64G
 
# run commands and application
pwd
date
#python ~/scripts/LGNPulvinarProj/2_fluocell2nissl/applySTSCompositeTransform_fullfluo_marmoset_BH.py M820 ~/m820/cellmasks8bit_A1V1/ ~/m820/m820F2N/M820_F_XForm_matrix.txt ~/m820/m820F2N/M820_F_XForm.txt ~/m820/m820F2N/M820_F_XForm_crop_matrix.txt ~/m820/m820F2N/fluoro_transforms/M820_fluoro_XForm_matrix.txt ~/m820/m820F2N/fluoro_transforms/M820_fluoro_XForm.txt 26435 27043 136 161 ~/m820/m820_cells/cell2Nissl/
#python ~/scripts/LGNPulvinarProj/2_fluocell2nissl/applySTSCompositeTransform_fullfluo_marmoset_BH.py M822 ~/m822/cellmasks8bit_A1V1/ ~/m822/m822F2N/M822_F_XForm_matrix.txt ~/m822/m822F2N/M822_F_XForm.txt ~/m822/m822F2N/M822_F_XForm_crop_matrix.txt ~/m822/m822F2N/fluoro_transforms/M822_fluoro_XForm_matrix.txt ~/m822/m822F2N/fluoro_transforms/M822_fluoro_XForm.txt 26435 27043 136 161 ~/m822/m822_cells/cell2Nissl/
python ~/scripts/Registration/flu2nissl/applySTSCompositeTransform_fullfluo_marmoset_BH.py M920 ~/m920/cellmasks8bit/ ~/m920/M920F2N/M920_F_XForm_matrix.txt ~/m920/M920F2N/M920_F_XForm.txt ~/m920/M920F2N/M920_F_XForm_crop_matrix.txt ~/m920/M920F2N/fluoro_transforms/M920_fluoro_XForm_matrix.txt ~/m920/M920F2N/fluoro_transforms/M920_fluoro_XForm.txt 25304 26783 176 192 ~/m920/M920_cells/cell2Nissl/
matlab -nodesktop -r cell2Nissltransform
date
