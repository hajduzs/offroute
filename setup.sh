#!/bin/bash
# Make build directory
mkdir build
cd build

# Clone SIG repository
git clone https://bitbucket.org/mkallmann/sig.git

# Install used libraries (for Debian-based distros)
apt-get update
apt-get -y install libglfw3-dev make 

# Update makefile so compiled libs contain PIC.
sed '12s/$/ -fPIC/' sig/make/makefile > mf2.txt
mv mf2.txt sig/make/makefile

# Build libs
cd sig/make
make libs
cd ../..

# Build custom lib
mkdir siglib
cd siglib
mkdir make
mkdir src

cp ../../src/makefile make/makefile
cp ../../src/rdetours.cpp src/rdetours.cpp

cd make
make

# Copy final lib to the build root. 
cp siglib.so ../../siglib.so
