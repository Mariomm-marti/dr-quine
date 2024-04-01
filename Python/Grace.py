# One comment
DEFINE1 = '# One comment%cDEFINE1 = %r%cDEFINE2 = %r%cDEFINE3 = lambda: open(%r, "w").write(DEFINE1 %% (0x0a, DEFINE1, 0x0a, DEFINE2, 0x0a, DEFINE2, 0x0a, 0x0a, 0x0a))%c%cDEFINE3()%c'
DEFINE2 = 'Grace_kid.py'
DEFINE3 = lambda: open('Grace_kid.py', "w").write(DEFINE1 % (0x0a, DEFINE1, 0x0a, DEFINE2, 0x0a, DEFINE2, 0x0a, 0x0a, 0x0a))

DEFINE3()
