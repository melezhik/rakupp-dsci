#!/bin/bash
set -euo pipefail

echo "configure_gcc (job-specific for gcc-portability)"
export CC=gcc
export CXX=g++
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
