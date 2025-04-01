#!/bin/bash
export EOS_MGM_URL=root://eosuser.cern.ch
echo "Starting job on " `date` #Date/time of start of job
echo "Running on: `uname -a`" #Condor job is running on this node
echo "System software: `cat /etc/redhat-release`" #Operating System on that node
source /cvmfs/cms.cern.ch/cmsset_default.sh
#Working on lhe step

sed -i 's#^.*hoppetweights-ymax20.tgz.*$#    args = cms.vstring("zee_dim6_mll50-100_slc7_amd64_gcc700_CMSSW_10_6_19_tarball.tar.xz"),#' -i SMP-RunIISummer20UL17wmLHEGEN-00065_1_cfg.py
sed -i 's#^.*input[^=]*=[^=]*cms.untracked.int32.*$#    input = cms.untracked.int32(10)#g' -i SMP-RunIISummer20UL17wmLHEGEN-00065_1_cfg.py
sed -i "s/^.*nEvents = .*$/    nEvents = cms.untracked.uint32(10),/g" -i SMP-RunIISummer20UL17wmLHEGEN-00065_1_cfg.py
sed -i "s/^process.RandomNumberGeneratorService.externalLHEProducer.initialSeed.*$/process.RandomNumberGeneratorService.externalLHEProducer.initialSeed=int($(($1+1)))/g" -i SMP-RunIISummer20UL17wmLHEGEN-00065_1_cfg.py 
echo "Opening CMSSW_10_6_19_patch3"
tar -xzvf CMSSW_10_6_19_patch3.tgz
# rm CMSSW_10_6_19_patch3.tgz
cd CMSSW_10_6_19_patch3/src/
scramv1 b ProjectRename # this handles linking the already compiled code - do NOT recompile
eval `scramv1 runtime -sh` # cmsenv is an alias not on the workers
echo $CMSSW_BASE "is the CMSSW we have on the local worker node"
cd ../../
date
cmsRun SMP-RunIISummer20UL17wmLHEGEN-00065_1_cfg.py



#Working on sim step

# rm -rf CMSSW_10_6_19_patch3
echo "Opening CMSSW_10_6_17_patch1"
tar -xzvf CMSSW_10_6_17_patch1.tgz
# rm CMSSW_10_6_17_patch1.tgz
cd CMSSW_10_6_17_patch1/src/
scramv1 b ProjectRename # this handles linking the already compiled code - do NOT recompile
eval `scramv1 runtime -sh` # cmsenv is an alias not on the workers
echo $CMSSW_BASE "is the CMSSW we have on the local worker node"
cd ../../
date
cmsRun SMP-RunIISummer20UL17SIM-00030_1_cfg.py


#Working on digipremix step

date
cmsRun SMP-RunIISummer20UL17DIGIPremix-00030_1_cfg.py


#Working on hlt step

# rm -rf CMSSW_10_6_17_patch1
echo "Opening CMSSW_9_4_14_UL_patch1"
tar -xzvf CMSSW_9_4_14_UL_patch1.tgz
# rm CMSSW_9_4_14_UL_patch1.tgz
cd CMSSW_9_4_14_UL_patch1/src/
scramv1 b ProjectRename # this handles linking the already compiled code - do NOT recompile
eval `scramv1 runtime -sh` # cmsenv is an alias not on the workers
echo $CMSSW_BASE "is the CMSSW we have on the local worker node"
cd ../../
date
cmsRun SMP-RunIISummer20UL17HLT-00029_1_cfg.py


#Working on reco step

# rm -rf CMSSW_9_4_14_UL_patch1
echo "Opening CMSSW_10_6_17_patch1"
tar -xzvf CMSSW_10_6_17_patch1.tgz
# rm CMSSW_10_6_17_patch1.tgz
cd CMSSW_10_6_17_patch1/src/
scramv1 b ProjectRename # this handles linking the already compiled code - do NOT recompile
eval `scramv1 runtime -sh` # cmsenv is an alias not on the workers
echo $CMSSW_BASE "is the CMSSW we have on the local worker node"
cd ../../
date
cmsRun SMP-RunIISummer20UL17RECO-00029_1_cfg.py


#Working on miniAOD step

# rm -rf CMSSW_10_6_17_patch1
echo "Opening CMSSW_10_6_20"
tar -xzvf CMSSW_10_6_20.tgz
# rm CMSSW_10_6_20.tgz
cd CMSSW_10_6_20/src/
scramv1 b ProjectRename # this handles linking the already compiled code - do NOT recompile
eval `scramv1 runtime -sh` # cmsenv is an alias not on the workers
echo $CMSSW_BASE "is the CMSSW we have on the local worker node"
cd ../../
date
cmsRun SMP-RunIISummer20UL17MiniAODv2-00180_1_cfg.py


#Working on nanoAOD step

# rm -rf CMSSW_10_6_20
echo "Opening CMSSW_10_6_26"
tar -xzvf CMSSW_10_6_26.tgz
# rm CMSSW_10_6_26.tgz
cd CMSSW_10_6_26/src/
scramv1 b ProjectRename # this handles linking the already compiled code - do NOT recompile
eval `scramv1 runtime -sh` # cmsenv is an alias not on the workers
echo $CMSSW_BASE "is the CMSSW we have on the local worker node"
cd ../../
date
cmsRun SMP-RunIISummer20UL17NanoAODv9-00124_1_cfg.py


# rm zee_dim6_mll50-100_slc7_amd64_gcc700_CMSSW_10_6_19_tarball.tar.xz SMP-RunIISummer20UL17wmLHEGEN-00065.root SMP-RunIISummer20UL17wmLHEGEN-00065_inLHE.root SMP-RunIISummer20UL17MiniAODv2-00180.root
# rm -rf CMSSW_10_6_26 *py
date
