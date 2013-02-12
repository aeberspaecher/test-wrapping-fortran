#!/usr/bin/env python
#-*- coding:utf-8 -*-

"""Test wrapping routines.
"""

import numpy as np
import fortwrap

v = np.linspace(0, 1, num=100)
vPrime = fortwrap.mult_vect(v)
print("Vector v = %(v)s;\nVector v' = %(vPrime)s\n"%locals())

A = np.ones((20, 20))
APrime = fortwrap.mult_array(A)
print("(Square) Matrix A = %(A)s;\n Matrix A' = %(APrime)s"%locals())

B = np.ones((5,9))
BPrime = fortwrap.mult_array(B)
print("Matrix B = %(B)s;\n Matrix B' = %(BPrime)s"%locals())

