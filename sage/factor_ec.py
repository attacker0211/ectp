#!/usr/local/bin/sage -python
from sage.all import *

n = 199843247
done = 0

for b in range(1, int(sqrt(199843247) + 1)):
    E = EllipticCurve(Integers(n),[0,0,0,b,-b])
    P = E(1,1)
    for d in range(2, 21):
        #  try:
        Q = d*P
        print(d,"!P &= (",Q[0],"," ,Q[1],")\\\\")
        P = Q
        #  except:
            #  T = P
            #  for i in range(1, int(log(d,2)) + 1):
                #  try:
                    #  print(


