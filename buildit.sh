#!/bin/sh
CFLAGS="-O2 -march=native -msse2" ./configure --enable-scrypt --enable-opencl
make

if [ -a exeminer.exe ]
then
  echo "stripping exeminer.exe"
  strip exeminer.exe
else
  echo "stripping exeminer"
  strip exeminer
fi

