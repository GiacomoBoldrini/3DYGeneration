#!/bin/bash

# Binds for singularity containers
# Mount /afs, /eos, /cvmfs, /etc/grid-security for xrootd
export APPTAINER_BINDPATH='/afs,/cvmfs,/cvmfs/grid.cern.ch/etc/grid-security:/etc/grid-security,/eos,/etc/pki/ca-trust,/run/user,/var/run/user'

#############################################################
#   This script is used by McM when it performs automatic   #
#  validation in HTCondor or submits requests to computing  #
#                                                           #
#      !!! THIS FILE IS NOT MEANT TO BE RUN BY YOU !!!      #
# If you want to run validation script yourself you need to #
#     get a "Get test" script which can be retrieved by     #
#  clicking a button next to one you just clicked. It will  #
# say "Get test command" when you hover your mouse over it  #
#      If you try to run this, you will have a bad time     #
#############################################################



# Dump actual test code to a GEN-Run3Summer23DRPremix-00237_test.sh file that can be run in Singularity
cat <<'EndOfTestFile' > GEN-Run3Summer23DRPremix-00237_test.sh
#!/bin/bash

export SCRAM_ARCH=el8_amd64_gcc11

source /cvmfs/cms.cern.ch/cmsset_default.sh
if [ -r CMSSW_13_0_14/src ] ; then
  echo release CMSSW_13_0_14 already exists
else
  scram p CMSSW CMSSW_13_0_14
fi
cd CMSSW_13_0_14/src
eval `scram runtime -sh`

mv ../../Configuration .
scram b
cd ../..

# Maximum validation runtime: 28800s
# Minimum validation runtime: 600s
# Output events to run for the validation job (from application's setting): 100
# Event efficiency: Computed using the request efficiency and its error.
# Event efficiency: `efficiency - (2 * efficiency_error)`: `1 - (2 * 0)` = 1
# Input events: `int(output_events / event_efficiency)`: `int(100 / 1)` = 100
# Time per event (s): Computed adding all the time_per_event values on every sequence
# Time per event (s): 4.84
# Initial target input events: 100
# Initial target output events: 100
# Validation runtime will not run for long enough than expected, extending the time
# Target input events changed to: `minimum_runtime / time_per_event * number_of_threads`: `600 / 4.84 * 1` = 124
# Target output events changed to: `target_input_events * event_efficiency`: `124 * 1` = 124
# Final target input events: 123
# Final target output events: 123
# This validation will be computed based on the target output events!
EVENTS=123


# cmsDriver command
cmsDriver.py  --era Run3_2023 --customise Configuration/DataProcessing/Utils.addMonitoring --procModifiers premix_stage2 --datamix PreMix --step DIGI,DATAMIX,L1,DIGI2RAW,HLT:2023v12 --geometry DB:Extended --conditions 130X_mcRun3_2023_realistic_v14 --datatier GEN-SIM-RAW --eventcontent PREMIXRAW --python_filename GEN-Run3Summer23DRPremix-00237_1_cfg.py --fileout file:GEN-Run3Summer23DRPremix-00237_0.root --filein file:GEN-Run3Summer23wmLHEGS-00327.root --number 123 --number_out 123 --pileup_input "dbs:/Neutrino_E-10_gun/Run3Summer21PrePremix-Summer23_130X_mcRun3_2023_realistic_v13-v1/PREMIX" --no_exec --mc || exit $? ;

# cmsDriver command
cmsDriver.py  --era Run3_2023 --customise Configuration/DataProcessing/Utils.addMonitoring --step RAW2DIGI,L1Reco,RECO,RECOSIM --geometry DB:Extended --conditions 130X_mcRun3_2023_realistic_v14 --datatier AODSIM --eventcontent AODSIM --python_filename GEN-Run3Summer23DRPremix-00237_2_cfg.py --fileout file:GEN-Run3Summer23DRPremix-00237.root --filein file:GEN-Run3Summer23DRPremix-00237_0.root --number 123 --number_out 123 --no_exec --mc || exit $? ;

# End of GEN-Run3Summer23DRPremix-00237_test.sh file
EndOfTestFile

# Make file executable
chmod +x GEN-Run3Summer23DRPremix-00237_test.sh

if [ -e "/cvmfs/unpacked.cern.ch/registry.hub.docker.com/cmssw/el8:amd64" ]; then
  CONTAINER_NAME="el8:amd64"
elif [ -e "/cvmfs/unpacked.cern.ch/registry.hub.docker.com/cmssw/el8:x86_64" ]; then
  CONTAINER_NAME="el8:x86_64"
else
  echo "Could not find amd64 or x86_64 for el8"
  exit 1
fi
export SINGULARITY_CACHEDIR="/tmp/$(whoami)/singularity"
singularity run --no-home /cvmfs/unpacked.cern.ch/registry.hub.docker.com/cmssw/$CONTAINER_NAME $(echo $(pwd)/GEN-Run3Summer23DRPremix-00237_test.sh)
