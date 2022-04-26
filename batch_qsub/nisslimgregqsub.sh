#!/bin/bash
# specify BASH shell
#$ -S /bin/bash
# run job in the current working directory where qsub is executed from
#$ -cwd
#  specify that the job requires 64GB of memory
#$ -l m_mem_free=64G
 
# run commands and application
pwd
date
#python ~/scripts/LGNPulvinarProj/applySTSCompositeTransform_fullnisslatlas_BH.py M820 ~/m820/m820nissl/M820_N_XForm_matrix.txt ~/m820/m820nissl/M820_N_XForm.txt ~/m820/m820nissl/M820_N_XForm_crop_matrix.txt ~/m820/m820nissl/transforms/M820_XForm_firstrotation_matrix.txt ~/m820/m820nissl/transforms/M820_XForm_matrix.txt ~/m820/m820nissl/transforms/M820_XForm.txt ~/m820/m820nissl/transforms/M820_XForm_finalrotation_matrix.txt 26435 27043 132 159 ~/m820/m820nissl/
#python ~/scripts/LGNPulvinarProj/applySTSCompositeTransform_fullnisslatlas_BH.py m822 ~/m822/m822nissl/m822_N_XForm_matrix.txt ~/m822/m822nissl/m822_N_XForm.txt ~/m822/m822nissl/m822_N_XForm_crop_matrix.txt ~/m822/m822nissl/transforms/m822_XForm_firstrotation_matrix.txt ~/m822/m822nissl/transforms/m822_XForm_matrix.txt ~/m822/m822nissl/transforms/m822_XForm.txt ~/m822/m822nissl/transforms/m822_XForm_finalrotation_matrix.txt 27826 30522 181 190 ~/m822/m822nissl/
python ~/scripts/Registration/NisslwMRI/applySTSCompositeTransform_fullnissl_BH.py M920 ~/m920/M920nissl/M920_N_XForm_matrix.txt ~/m920/M920nissl/M920_N_XForm_crop_matrix.txt ~/m920/M920nissl/transforms/M920_XForm_matrix.txt .00092 25304 26783 175 191 ~/m920/M920nissl/
matlab -nodesktop -r Nissladj
date
