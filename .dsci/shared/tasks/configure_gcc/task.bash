#!/bin/bash
set -euo pipefail

echo "configure_gcc task (shared)"
export CC=gcc
export CXX=g++
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
