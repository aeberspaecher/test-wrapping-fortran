#!/usr/bin/env python
#-*- coding:utf-8 -*-

top = "."
out = "build"

def options(opt):
    opt.load("compiler_fc")
    opt.load("compiler_c")
    opt.load("python")
    opt.load("cython")

def configure(conf):
    conf.load("compiler_fc")
    conf.load("compiler_c")
    conf.load("python")
    conf.load("cython")
    conf.check_python_headers()
    conf.check_python_module("numpy")
    conf.env["FCFLAGS"] = ["-g", "-fPIC"]
    conf.env["CFLAGS"] = ["-g", "-fPIC"]

def build(bld):
    bld(features="fc fcstlib", source="src/fort.f90", target="fort")
    bld(features="c cshlib pyext", source="src/fortwrap.pyx", target="fortwrap", use="fort", lib="gfortran")
    # FIXME: why do we have to link against libgfortran manually? This seems wrong.
    bld(features="pyext", source="src/testwrap.py")
