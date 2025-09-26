import CRABClient
from WMCore.Configuration import Configuration
from multiprocessing import Process
config = Configuration()


events_per_job = 1000
PROD='MiNNLO_Zj-nanoaod23'

config.section_('General')
config.General.workArea=PROD
config.General.requestName=PROD

config.section_('JobType')
config.JobType.scriptExe = 'runners/2023/run_chain_test.sh'
config.JobType.psetName = 'do_nothing_cfg.py'
config.JobType.pluginName = 'PrivateMC'
config.JobType.outputFiles = ['GEN-Run3Summer23NanoAODv12-00237.root']
config.JobType.inputFiles = [
    'modifyCfg.py',
    'copy_gridpack.py',
    'get_disk_files.py',
    'runners/2023/run_chain_test.sh',
    'runners/2023/chain_step_0_test.sh',
    'runners/2023/chain_step_1_test.sh',
    'runners/2023/chain_step_2_test.sh',
    'runners/2023/chain_step_3_test.sh',
    '2023/GEN-Run3Summer23wmLHEGS-00327_1_cfg.py',
    '2023/GEN-Run3Summer23DRPremix-00237_1_cfg.py',
    '2023/GEN-Run3Summer23DRPremix-00237_2_cfg.py',
    '2023/GEN-Run3Summer23MiniAODv4-00237_1_cfg.py',
    '2023/GEN-Run3Summer23NanoAODv12-00237_1_cfg.py',
    ]
config.JobType.disableAutomaticOutputCollection = False
config.JobType.allowUndistributedCMSSW = True
config.JobType.maxMemoryMB = 8000
config.JobType.numCores = 4

config.section_('Data')
config.Data.unitsPerJob = events_per_job
NJOBS = 2000
config.Data.totalUnits = config.Data.unitsPerJob * NJOBS
config.Data.splitting = 'EventBased'
config.Data.publication = False
config.Data.outputPrimaryDataset = PROD
config.Data.outputDatasetTag = PROD
config.Data.outLFNDirBase = '/store/user/gboldrin/Zj_MINNLO_Run3_Summer2023NanoAODv12/'
#config.Data.inputDBS = 'phys03'

config.section_('User')

config.section_('Site')
config.Site.storageSite = 'T2_FR_GRIF_LLR'


config.JobType.scriptArgs = ['nEvents=' + str(config.Data.unitsPerJob)]
config.JobType.scriptArgs.append('nThreads='+str(config.JobType.numCores))

print ('Submitting jobs with script args --> '+' '.join(config.JobType.scriptArgs))
print ('Submitting jobs with unitsPerJob --> '+str(config.Data.unitsPerJob)+' totalUnits --> '+str(config.Data.totalUnits),' primary dataset --> ',str(config.Data.outputPrimaryDataset))
