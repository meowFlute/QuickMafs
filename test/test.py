from ctypes import *

QuickMafs = cdll.LoadLibrary('../lib/libquickmafs.so.1.0.0')
QuickMafs.dAdd.restype = c_double
QuickMafs.dAdd.argtypes = [c_double, c_double]

if __name__=="__main__":
    print(QuickMafs.dAdd(25.0, 100.0))
