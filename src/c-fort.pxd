# This file is automatically generated by fparser from 'src/fort.f90'.
# Do not edit by hand (rerun fparser instead).

from libcpp cimport bool

cdef extern from "fort.h":

    void c_set(int *n, double *x, double complex *y)
    void c_set_array(int *n, int *m, double *x, double complex *y)
