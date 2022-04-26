#!/bin/sh

#  qsub_cellsum.sh
#  
#
#  Created by Bingxing Huo on 2/14/2020.
#  
# specify BASH shell
#$ -S /bin/bash
# run job in the current working directory where qsub is executed from
#$ -cwd
#  specify that the job requires at least 60GB of memory
#$ -l m_mem_free=80G
#$ -pe threads 1
#$ -V
# run commands and application
pwd
date
matlab -nodesktop -r cellsummary
date
