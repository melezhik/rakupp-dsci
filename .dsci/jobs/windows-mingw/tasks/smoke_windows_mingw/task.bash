#!/bin/bash
set -euo pipefail

echo "smoke_windows_mingw (job-specific)"
# intended to run in MINGW64 msys shell
./build/rakupp.exe tools/smoke.raku
