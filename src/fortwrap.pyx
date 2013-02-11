#-*- coding:utf-8 -*-

cimport numpy as np
import numpy as np

cdef extern:
    void c_set(int *n, double *x, double *y)

def mult(np.ndarray xin):
    cdef np.ndarray[double, mode="c"] x = xin
    cdef int n = int(len(x))
    cdef np.ndarray[double, mode="c"] y = np.empty(n, dtype="double")

    c_set(&n, &x[0], &y[0])

    return y

