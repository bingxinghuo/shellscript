#!/bin/bash
# specify BASH shell
#$ -S /bin/bash
# run job in the current working directory where qsub is executed from
#$ -cwd
#  specify that the job requires 16GB of memory
#$ -l m_mem_free=16G
 
# run commands and application
pwd
date
brainids=$1
downrate=$2
sourcedir=$3
modal=$4
if [ "${brainids:(-3)}" = "txt" ]; then
    while read F; do
    if [ "${modal,,}" = "mba" ]; then
        inputdir=$sourcedir/"${F,,}"/"${F,,}"F/JP2/
    fi
    outputdir=~/"${F^^}"
    mkdir $outputdir
    matlab -nodesktop -r "jp2tifdown(${downrate},${inputdir},${outputdir})"
    done < $brainids
else
    if [ "${modal,,}" = "mba" ]; then
        inputdir=$sourcedir/"${brainids,,}"/"${brainids,,}"F/JP2/
    fi
    outputdir=~/"${brainids^^}"
    mkdir $outputdir
    matlab -nodesktop -r "jp2tifdown(${downrate},${inputdir},${outputdir})"
fi

date
