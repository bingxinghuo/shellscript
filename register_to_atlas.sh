#!/bin/bash
#$ -cwd
#$ -j y
#$ -S /bin/bash

#  register_to_atlas.sh
#  
#
#  Created by Bingxing Huo on 12/30/19.
#

source /sonas-hs/it/hpc/home/easybuild/lmod-setup.sh
module load foss/2016a
module load IntelPython/2.7.12

echo $targetnumber
echo $channel
#workdir=/Dropbox\ \(Marmoset\)/BingxingHuo/Marmoset\ Brain\ Architecture/MotorCortex/
workdir=/sonas-hs/mitra/hpc/home/blee/data/registration/
#workdir=~/scripts/Registration/Marmoset_Pipeline_2019/data/registration/
codedir=/sonas-hs/mitra/hpc/home/blee/code/marmoset/
#workdir=~/CSHLservers/BNB/blee/data/registration/
#codedir=~/CSHLservers/BNB/blee/code/marmoset
#dataoutputdir=~/Dropbox\ \(Marmoset\)/BingxingHuo/Marmoset\ Brain\ Architecture/MotorCortex/$targetnumber
dataoutputdir=~/$targetnumber
# 1. Apply the section alignment transforms to the target image
#
#registeredimg=$workdir/$targetnumber/fluoro/$targetnumber"_fluoro_STS_padded.img"
registeredimg=$targetnumber"_mapinject_"$channel".img"
#registeredimg=$targetnumber"_annotation.img"
#
# 2.  Apply the inverse diffeomorphism to the aligned target image
$codedir/IMG_apply_lddmm_tform1 $dataoutputdir/$registeredimg $workdir/$targetnumber/$targetnumber"_lddmm"/Kimap000.vtk $dataoutputdir/$targetnumber"_alignedtargetinv.img" 1
#$codedir/IMG_apply_lddmm_tform1 $dataoutputdir/$registeredimg $workdir/$targetnumber/$targetnumber"_STSpipeline_output"/Kimap_composed.vtk $dataoutputdir/$targetnumber"_alignedtargetinv.img" 1
#$codedir/IMG_apply_lddmm_tform1 $dataoutputdir/$registeredimg $workdir/$targetnumber/Kimap_composed.vtk $dataoutputdir/$targetnumber"_alignedtargetinv.img" 1
#
# 3. Apply an inverse of the global affine transform to that image to get to the atlas space
#atlasimgfile=~/Dropbox\ \(Marmoset\)/BingxingHuo/Marmoset\ Brain\ Architecture/Marmoset\ Atlases/2015\ RIKEN/Brian\ transformed\ atlas/mask_80_flip_refined.img
atlasimgfile=/sonas-hs/mitra/hpc/home/blee/data/atlas_images/marmoset/atlas_80_flip_masked_eroded_refined.img
python ~/scripts/Registration/inverse_transform.py $dataoutputdir/$targetnumber"_alignedtargetinv.img" $atlasimgfile $workdir/$targetnumber/$targetnumber"_globalaffinetrans.txt" $dataoutputdir/${registeredimg%.*}"_inatlas.img"
#python ~/scripts/Registration/inverse_transform.py $dataoutputdir/$targetnumber"_alignedtargetinv.img" $atlasimgfile $workdir/$targetnumber/$targetnumber"_STSpipeline_output"/$targetnumber"_globalaffinetrans.txt" $dataoutputdir/${registeredimg%.*}"_inatlas.img"
