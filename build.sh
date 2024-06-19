#!/bin/bash
mkdir target -p
mkdir build -p
cd build
cmake ..
make
cp -f libmysql.so ../target
