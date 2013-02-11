#-*- coding:utf-8 -*-

cimport numpy as np
import numpy as np

cdef extern:
    void c_set(int *n, double *x, double complex *y)

def mult(np.ndarray xin):
    """Multiply an array by 2i and return.
    """

    cdef np.ndarray[double, mode="c"] x = xin
    cdef int n = int(len(x))
    cdef np.ndarray[complex, mode="c"] y = np.empty(n, dtype=complex)

    c_set(&n, &x[0], &y[0])

    return y

