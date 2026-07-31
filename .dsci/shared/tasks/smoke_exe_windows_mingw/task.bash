#!/bin/bash
set -euo pipefail

echo "Shared: smoke_exe_windows_mingw"
build/rakupp.exe --exe tools/smoke.raku -o smoke-native.exe
./smoke-native.exe
code=$?
echo "native exit code: $code"
exit $code
