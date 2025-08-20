# python3.9 make_filelist.py /store/user/gboldrin/3DY_SMEFTsim_NLO/ZDYEFT-nanoaod18_NLOSMTESTS_DYToLL_01J_SM_5f_NLO_FXFX/ZDYEFT-nanoaod18_NLOSMTESTS_DYToLL_01J_SM_5f_NLO_FXFX/250627_144919/0000 500
import gfal2
import sys

base = "root://eos.grif.fr:1094//eos/grif/cms/llr/" + sys.argv[1]
num = -1
if len(sys.argv) > 2:
    num = int(sys.argv[2])

ctx = gfal2.creat_context()
files = ctx.listdir(base)[:num]
ct = []
for file in files:
    ct.append({"path": base + "/" + file, "nevents": 300})
print(ct)
