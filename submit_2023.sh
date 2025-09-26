#!/bin/bash

cd CMSSW_13_0_14/src; cmsenv; cd -

mkdir -p MINNLO_2023_generation
mkdir -p MINNLO_2023_generation/runners

cp -r runners/2023 MINNLO_2023_generation/runners
cp -r 2023 MINNLO_2023_generation
cp do_nothing_cfg.py modifyCfg.py copy_gridpack.py MINNLO_2023_generation
cp crab_sub_2023.py MINNLO_2023_generation

cd MINNLO_2023_generation

if [ $# -ne 0 ]; then
   if [ "$1" -eq 1 ]; then
     crab submit crab_sub_2023.py 
   else
     echo "Pass 1 if you want to crab submit"
   fi
fi
