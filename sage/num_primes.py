#!/usr/local/bin/sage -python
from sage.all import *
x,y,z=var('x y z')
for prime in range(3, 1000):
  if prime in Primes():
    F = Zmod(prime)
    P2 = ProjectiveSpace(2, GF(prime), names=['x','y','z'])
    C = Curve([y**2*z-x**3-x*z**2-z**3], P2)
    E = EllipticCurve(F,[1,1])
    print(C.is_singular())
    if C.is_singular():
      print("p &= ", prime, ": M_p = 1")
    else:
      print("p &= ", prime, ": M_p = ", E.cardinality()) 

  
