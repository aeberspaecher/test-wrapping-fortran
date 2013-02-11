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

def build(bld):
    bld(features="fc fshlib", source="src/fort.f90", target="fort")
    bld(features="c cshlib pyext", source="src/fortwrap.pyx", target="fortwrap", use="fort")
