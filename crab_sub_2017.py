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
config.JobType.outputFiles = ['SMP-RunIISummer20UL17NanoAODv9-00124.root']
config.JobType.inputFiles = [
    'modifyCfg.py',
    'runners/2017/run_chain_test.sh',
    'runners/2017/chain_step_0_test.sh',
    'runners/2017/chain_step_1_test.sh',
    'runners/2017/chain_step_2_test.sh',
    'runners/2017/chain_step_3_test.sh',
    'runners/2017/chain_step_4_test.sh',
    'runners/2017/chain_step_5_test.sh',
    '2017/SMP-RunIISummer20UL17wmLHEGEN-00065_1_cfg.py',
    '2017/SMP-RunIISummer20UL17SIM-00030_1_cfg.py',
    '2017/SMP-RunIISummer20UL17DIGIPremix-00030_1_cfg.py',
    '2017/SMP-RunIISummer20UL17HLT-00029_1_cfg.py',
    '2017/SMP-RunIISummer20UL17RECO-00029_1_cfg.py',
    '2017/SMP-RunIISummer20UL17MiniAODv2-00180_1_cfg.py',
    '2017/SMP-RunIISummer20UL17NanoAODv9-00124_1_cfg.py'
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
config.Site.whitelist = []
config.Site.storageSite = 'T3_CH_CERNBOX'
