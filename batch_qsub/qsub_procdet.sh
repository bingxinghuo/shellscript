#!/bin/sh

#  qsub_procdet.sh
#  
#
#  Created by Bingxing Huo on 8/30/19.
#  
# specify BASH shell
#$ -S /bin/bash
# run job in the current working directory where qsub is executed from
#$ -cwd
#  specify that the job requires 60GB of memory
#$ -l m_mem_free=60G
#$ -pe threads 10
#$ -V
# run commands and application
pwd
date
matlab -nodesktop -r processdet_bnb
date
