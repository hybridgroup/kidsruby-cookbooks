#!/bin/bash
export CHOST=i686-pc-linux-gnu
export CFLAGS="-m32 -march=i686 -O3 -pipe -fomit-frame-pointer"
export CXXFLAGS="-m32 -march=i686 -O3 -pipe -fomit-frame-pointer"
/usr/bin/gcc-4.4 -m32 "$@"