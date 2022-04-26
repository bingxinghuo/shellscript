#!/bin/sh

#  rgbconvert_qsub.sh
#  
#
#  Created by Bingxing Huo on 10/19/17.
#
# specify BASH shell
#$ -S /bin/bash
# run job in the current working directory where qsub is executed from
#$ -cwd
#  specify that the job requires 4GB of memory
#$ -l m_mem_free=4G

# run commands and application
pwd
date
matlab -nodesktop -r rgbconvwrapper_bnb
date