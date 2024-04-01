import os

i: int = 5

quine: str = 'import os%c%ci: int = %d%c%cquine: str = %r%cdecrease: str = %r%cfilename: str = %r%cexecute: str = %r%c%cif os.getenv(decrease):%c    i -= 1%cif i < 0:%c    exit(0)%copen(filename %% i, "w").write(quine %% (0x0a, 0x0a, i, 0x0a, 0x0a, quine, 0x0a, decrease, 0x0a, filename, 0x0a, execute, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a))%cos.system(execute %% i)%c'
decrease: str = 'DECREASE'
filename: str = 'Sully_%d.py'
execute: str = 'DECREASE=True python3 Sully_%d.py'

if os.getenv(decrease):
    i -= 1
if i < 0:
    exit(0)
open(filename % i, "w").write(quine % (0x0a, 0x0a, i, 0x0a, 0x0a, quine, 0x0a, decrease, 0x0a, filename, 0x0a, execute, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a))
os.system(execute % i)
