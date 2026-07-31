#!/bin/bash
set -euo pipefail

echo "Shared: smoke_windows_mingw"
# intended to run in MINGW64 msys shell
./build/rakupp.exe tools/smoke.raku
