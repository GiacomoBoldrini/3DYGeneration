import CRABClient
from WMCore.Configuration import Configuration
from multiprocessing import Process
config = Configuration()


events_per_job = 10
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
config.JobType.maxMemoryMB = 5000
config.JobType.numCores = 1

config.section_('Data')
config.Data.unitsPerJob = events_per_job
NJOBS = 100
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

gp_path = "/eos/user/g/gboldrin/MiNNLO_Run3_gridpacks/Zj_slc7_amd64_gcc10_CMSSW_12_3_1_ZJToMuMu-13p6TeV-suggested-nnpdf31-ncalls-doublefsr-q139-powheg-MiNNLO31-svn3900-ew-rwl6-j200-st2fix-ana-hoppetweights-ymax20-pdf3.tgz"

config.JobType.scriptArgs = ['inputGridpack='+gp_path]
config.JobType.scriptArgs.append('nEvents=' + str(config.Data.unitsPerJob))
config.JobType.scriptArgs.append('nThreads='+str(config.JobType.numCores))

print ('Submitting jobs with script args --> '+' '.join(config.JobType.scriptArgs))
print ('Submitting jobs with unitsPerJob --> '+str(config.Data.unitsPerJob)+' totalUnits --> '+str(config.Data.totalUnits),' primary dataset --> ',str(config.Data.outputPrimaryDataset))
