#!/bin/bash
# specify BASH shell
#$ -S /bin/bash
# run job in the current working directory where qsub is executed from
#$ -cwd
#  specify that the job requires 4GB of memory
#$ -l m_mem_free=128G
 
# run commands and application
pwd
date
matlab -nodesktop -r cell2tif8bit_partial
date
