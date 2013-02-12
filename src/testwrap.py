#!/usr/bin/env python
#-*- coding:utf-8 -*-

"""Test wrapping routines.
"""

import numpy as np
import fortwrap

print("Multiplying a vector by 2i")
v = np.linspace(0, 1, num=10)
vPrime = fortwrap.alter_vect(v)
print("Vector v = %(v)s;\nVector v' = %(vPrime)s\n"%locals())

print("Multiplying a matrix by 2i and setting elememt 1,2 to 0 (using Fortran)")
A = np.ones((3, 3))
APrime = fortwrap.alter_array_F(np.asfortranarray(A))
print("(Square) Matrix A = %(A)s;\n Matrix A' = %(APrime)s"%locals())
print("Aprime.flags[F_CONTIGUOUS] = %s\n"%APrime.flags["F_CONTIGUOUS"])

print("Multiplying a C contiguous matrix by 2i and setting elememt 1,2 to 0 (using Fortran)")
print("Note how this fails!")
B = np.ones((3,4))
BPrime = fortwrap.alter_array_C(B)
print("Matrix B = %(B)s;\n Matrix B' = %(BPrime)s"%locals())
print("Bprime.flags[C_CONTIGUOUS] = %s\n"%BPrime.flags["C_CONTIGUOUS"])

print("Multiplying a F contiguous matrix by 2i and setting elememt 1,2 to 0 (using Fortran)")
print("This works!")
C = np.ones((3,4))
CPrime = fortwrap.alter_array_F(np.asfortranarray(C))
print("Matrix C = %(C)s;\n Matrix C' = %(CPrime)s"%locals())
print("Cprime.flags[F_CONTIGUOUS] = %s"%CPrime.flags["F_CONTIGUOUS"])
