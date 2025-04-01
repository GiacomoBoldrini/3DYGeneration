import CRABClient
from CRABClient.UserUtilities import config 

config = config()

config.General.requestName = 'tutorial_Aug2021_MC_generation'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True

config.JobType.pluginName = 'PrivateMC'
config.JobType.psetName = 'SMP-RunIISummer20UL17wmLHEGEN-00065_1_cfg.py'

config.JobType.outputFiles = ['SMP-RunIISummer20UL17wmLHEGEN-00065.root']
config.JobType.disableAutomaticOutputCollection = False
config.JobType.allowUndistributedCMSSW = True
config.Data.outputPrimaryDataset = 'MinBias'
config.Data.splitting = 'EventBased'
config.Data.unitsPerJob = 10
NJOBS = 1  # This is not a configuration parameter, but an auxiliary variable that we use in the next line.
config.Data.totalUnits = config.Data.unitsPerJob * NJOBS
config.Data.publication = False
config.Data.outputDatasetTag = 'CRAB3_tutorial_Aug2021_MC_generation'

config.Site.storageSite = 'T2_FR_GRIF' 
