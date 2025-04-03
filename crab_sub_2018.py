import CRABClient
from WMCore.Configuration import Configuration
from multiprocessing import Process
config = Configuration()

PROD='ZDYEFT-nanoaod18'

config.section_('General')
config.General.workArea=PROD
config.General.requestName=PROD

config.section_('JobType')
config.JobType.scriptExe = 'runners/2018/run_chain_test.sh'
config.JobType.psetName = 'do_nothing_cfg.py'
config.JobType.pluginName = 'PrivateMC'
config.JobType.outputFiles = ['SMP-RunIISummer20UL17NanoAODv9-00124.root']
config.JobType.inputFiles = [
    'modifyCfg.py',
    'get_disk_files.py',
    'runners/2018/run_chain_test.sh',
    'runners/2018/chain_step_0_test.sh',
    'runners/2018/chain_step_1_test.sh',
    'runners/2018/chain_step_2_test.sh',
    'runners/2018/chain_step_3_test.sh',
    'runners/2018/chain_step_4_test.sh',
    'runners/2018/chain_step_5_test.sh',
    '2018/SMP-RunIISummer20UL18wmLHEGEN-00061_1_cfg.py',
    '2018/SMP-RunIISummer20UL18SIM-00035_1_cfg.py',
    '2018/SMP-RunIISummer20UL18DIGIPremix-00035_1_cfg.py',
    '2018/SMP-RunIISummer20UL18HLT-00035_1_cfg.py',
    '2018/SMP-RunIISummer20UL18RECO-00035_1_cfg.py',
    '2018/SMP-RunIISummer20UL18MiniAODv2-00051_1_cfg.py',
    '2018/SMP-RunIISummer20UL18NanoAODv9-00051_1_cfg.py'
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
config.Site.whitelist = ['T2_CH_CERN']
config.Site.storageSite = 'T3_CH_CERNBOX'
