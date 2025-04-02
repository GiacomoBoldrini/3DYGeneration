import CRABClient
from WMCore.Configuration import Configuration
from multiprocessing import Process
config = Configuration()

PROD='ZDYEFT-nanoaod17'

config.section_('General')
config.General.workArea=PROD
config.General.requestName=PROD

config.section_('JobType')
config.JobType.scriptExe = 'runners/run_chain_test.sh'
config.JobType.psetName = 'do_nothing_cfg.py'
config.JobType.pluginName = 'PrivateMC'
config.JobType.outputFiles = ['NANOAODEFT17.root']
config.JobType.inputFiles = [
    'modifyCfg.py',
    'runners/run_chain_test.sh',
    'runners/chain_step_0_test.sh',
    'SMP-RunIISummer20UL17wmLHEGEN-00065_1_cfg.py'
    ]
config.JobType.disableAutomaticOutputCollection = False
config.JobType.allowUndistributedCMSSW = True
config.JobType.maxMemoryMB = 2499
config.JobType.numCores = 4

config.section_('Data')
config.Data.unitsPerJob = 10
NJOBS = 1
config.Data.totalUnits = config.Data.unitsPerJob * NJOBS
config.Data.splitting = 'EventBased'
config.Data.publication = False
#config.Data.ignoreLocality = True
config.Data.outputPrimaryDataset = PROD
config.Data.outputDatasetTag = PROD
config.Data.outLFNDirBase = '/store/user/gboldrin/prova'
#config.Data.inputDBS = 'phys03'

config.section_('User')

config.section_('Site')
config.Site.storageSite = 'T3_CH_CERNBOX'
