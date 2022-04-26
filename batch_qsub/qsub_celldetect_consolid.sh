#!/bin/bash
# specify BASH shell
#$ -S /bin/bash
# run job in the current working directory where qsub is executed from
#$ -cwd
#  specify that the job requires 60GB of memory
#$ -l m_mem_free=60G
#$ -pe threads 12
 
# run commands and application
pwd
date
matlab -nodesktop -r FBdetection_consolid_allimg1_bnb
#matlab -nodesktop -r celldetect_bnb
date
