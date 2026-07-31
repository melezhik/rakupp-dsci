#!/bin/bash
set -euo pipefail

echo "smoke_exe_windows_mingw (job-specific)"
build/rakupp.exe --exe tools/smoke.raku -o smoke-native.exe
./smoke-native.exe
code=$?
echo "native exit code: $code"
exit $code
