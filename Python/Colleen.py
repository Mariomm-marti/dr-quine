# One comment
def quine(): return '# One comment%cdef quine(): return %r # Two comments%cdef iamthequine(): return quine()%cprint(iamthequine() %% (0x0a, quine(), 0x0a, 0x0a))' # Two comments
def iamthequine(): return quine()
print(iamthequine() % (0x0a, quine(), 0x0a, 0x0a))
