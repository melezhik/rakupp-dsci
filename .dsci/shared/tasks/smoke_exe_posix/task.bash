#!/bin/bash
set -euo pipefail

echo "Shared: smoke_exe_posix"
build/rakupp --exe tools/smoke.raku -o smoke-native
./smoke-native
