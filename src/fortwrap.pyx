#-*- coding:utf-8 -*-

cimport numpy as np
import numpy as np

# TODO: what is Cython's 'mode'?

# interfaces for external C code (here: Fortran exposed via iso_c_binding)
cdef extern:
    void c_set(int *n, double *x, double complex *y)
    void c_set_array(int *n, int *m, double *x, double complex *y)


def alter_vect(np.ndarray xin):
    """Multiply a 1d array by 2i.
    """

    cdef np.ndarray[double, mode="fortran"] x = xin
    cdef int n = int(len(x))
    cdef np.ndarray[dtype=complex, mode="fortran"] y = np.empty(n, dtype=complex, order="F")

    c_set(&n, &x[0], &y[0])

    return y


def alter_array_F(np.ndarray[dtype=double, mode="fortran", ndim=2] xin):
    """Multiply a 2d array by 2i. The input and the output are F-contiguous
    arrays.
    """

    cdef np.ndarray[dtype=double, ndim=2, mode="fortran"] x = xin
    cdef int n = int(np.shape(xin)[0])
    cdef int m = int(np.shape(xin)[1])
    cdef np.ndarray[dtype=complex, ndim=2, mode="fortran"] y = np.empty([n, m], dtype=complex, order="F")

    c_set_array(&n, &m, &x[0,0], &y[0,0])

    return y

def alter_array_C(np.ndarray[dtype=double, mode="c", ndim=2] xin):
    """Multiply a 2d array by 2i. The input and the output are C-contiguous
    arrays.
    """

    cdef np.ndarray[dtype=double, ndim=2, mode="c"] x = xin
    cdef int n = int(np.shape(xin)[0])
    cdef int m = int(np.shape(xin)[1])
    cdef np.ndarray[dtype=complex, ndim=2, mode="c"] y = np.empty([n, m], dtype=complex, order="C")

    c_set_array(&n, &m, &x[0,0], &y[0,0])

    return y
