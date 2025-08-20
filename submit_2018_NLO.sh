#!/bin/bash

cd CMSSW_10_6_19_patch3/src; cmsenv; cd -

mkdir -p NLO_generation
mkdir -p NLO_generation/runners

cp -r CMSSW_10_6_26.tar.gz NLO_generation 
cp -r runners/2018 NLO_generation/runners
cp -r 2018_NLO NLO_generation
cp do_nothing_cfg.py modifyCfg.py copy_gridpack.py NLO_generation

sed '6i mll_bin = "mll_50_100" ' crab_sub_2018_NLO.py > NLO_generation/crab_sub_2018_NLO_mll_50_100.py
sed '6i mll_bin = "mll_100_200" ' crab_sub_2018_NLO.py > NLO_generation/crab_sub_2018_NLO_mll_100_200.py
sed '6i mll_bin = "mll_200_400" ' crab_sub_2018_NLO.py > NLO_generation/crab_sub_2018_NLO_mll_200_400.py
sed '6i mll_bin = "mll_400_600" ' crab_sub_2018_NLO.py > NLO_generation/crab_sub_2018_NLO_mll_400_600.py
sed '6i mll_bin = "mll_600_800" ' crab_sub_2018_NLO.py > NLO_generation/crab_sub_2018_NLO_mll_600_800.py
sed '6i mll_bin = "mll_800_1000" ' crab_sub_2018_NLO.py > NLO_generation/crab_sub_2018_NLO_mll_800_1000.py
sed '6i mll_bin = "mll_1000_1500" ' crab_sub_2018_NLO.py > NLO_generation/crab_sub_2018_NLO_mll_1000_1500.py
sed '6i mll_bin = "mll_1500_inf" ' crab_sub_2018_NLO.py > NLO_generation/crab_sub_2018_NLO_mll_1500_inf.py

cd NLO_generation

if [ $# -ne 0 ]; then
   if [ "$1" -eq 1 ]; then
     crab submit crab_sub_2018_NLO_mll_50_100.py
     crab submit crab_sub_2018_NLO_mll_100_200.py
     crab submit crab_sub_2018_NLO_mll_200_400.py
     crab submit crab_sub_2018_NLO_mll_400_600.py
     crab submit crab_sub_2018_NLO_mll_600_800.py
     crab submit crab_sub_2018_NLO_mll_800_1000.py
     crab submit crab_sub_2018_NLO_mll_1000_1500.py
     crab submit crab_sub_2018_NLO_mll_1500_inf.py
   else
     echo "Pass 1 if you want to crab submit"
   fi
fi
