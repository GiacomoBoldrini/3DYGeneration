#!/bin/bash

cd CMSSW_10_6_19_patch3/src; cmsenv; cd -

mkdir -p LO_01J_generation
mkdir -p LO_01J_generation/runners

cp -r CMSSW_10_6_26.tar.gz LO_01J_generation
cp -r runners/2018 LO_01J_generation/runners
cp -r 2018_LO01J LO_01J_generation
cp do_nothing_cfg.py modifyCfg.py copy_gridpack.py LO_01J_generation

sed '6i mll_bin = "mll_50_100" ' crab_sub_2018_LO01J.py > LO_01J_generation/crab_sub_2018_LO_01J_mll_50_100.py
sed '6i mll_bin = "mll_100_200" ' crab_sub_2018_LO01J.py > LO_01J_generation/crab_sub_2018_LO_01J_mll_100_200.py
sed '6i mll_bin = "mll_200_400" ' crab_sub_2018_LO01J.py > LO_01J_generation/crab_sub_2018_LO_01J_mll_200_400.py
sed '6i mll_bin = "mll_400_600" ' crab_sub_2018_LO01J.py > LO_01J_generation/crab_sub_2018_LO_01J_mll_400_600.py
sed '6i mll_bin = "mll_600_800" ' crab_sub_2018_LO01J.py > LO_01J_generation/crab_sub_2018_LO_01J_mll_600_800.py
sed '6i mll_bin = "mll_800_1000" ' crab_sub_2018_LO01J.py > LO_01J_generation/crab_sub_2018_LO_01J_mll_800_1000.py
sed '6i mll_bin = "mll_1000_1500" ' crab_sub_2018_LO01J.py > LO_01J_generation/crab_sub_2018_LO_01J_mll_1000_1500.py
sed '6i mll_bin = "mll_1500_inf" ' crab_sub_2018_LO01J.py > LO_01J_generation/crab_sub_2018_LO_01J_mll_1500_inf.py

cd LO_01J_generation

if [ $# -ne 0 ]; then
   if [ "$1" -eq 1 ]; then
     crab submit crab_sub_2018_LO_01J_mll_50_100.py
     crab submit crab_sub_2018_LO_01J_mll_100_200.py
     crab submit crab_sub_2018_LO_01J_mll_200_400.py
     crab submit crab_sub_2018_LO_01J_mll_400_600.py
     crab submit crab_sub_2018_LO_01J_mll_600_800.py
     crab submit crab_sub_2018_LO_01J_mll_800_1000.py
     crab submit crab_sub_2018_LO_01J_mll_1000_1500.py
     crab submit crab_sub_2018_LO_01J_mll_1500_inf.py
   else
     echo "Pass 1 if you want to crab submit"
   fi
fi
