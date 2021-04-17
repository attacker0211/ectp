#!/usr/local/bin/sage -python
# 2.4
from sage.all import *

for prime in range(5, 200):
    if prime in Primes() and prime % 3 == 1:
      print("F_{}:".format(prime))
      cubs = {0}
      quad = {0}
      for i in range(prime):
        cubs.add((i*i*i + 1)%prime)
        quad.add((i*i)%prime)
      for num in cubs:
        print(num, end = ' ')
      print()
      for num in quad:
        print(num, end = ' ')
      print()
      for i in range(0, prime):
        print(i, (i*i)%prime, (i*i*i+1)%prime)
      E = EllipticCurve(GF(prime), [0,0,0,0,1])
      ps = E.points()
      print("M_p = {}".format(len(ps)))
      for p in ps:
        print(p, p.order())
        
