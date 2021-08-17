#!/bin/bash

cd build/siglib
cp ../../src/rdetours.cpp src/rdetours.cpp

cd make
make

# Copy final lib to the build root. 
cp siglib.so ../../siglib.so
