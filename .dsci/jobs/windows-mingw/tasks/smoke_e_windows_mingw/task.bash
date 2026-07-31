#!/bin/bash
set -euo pipefail

echo "smoke_e_windows_mingw (job-specific)"
out=$(./build/rakupp.exe -e 'say 6 * 7')
echo "got: [$out]"
if [ "$out" != "42" ]; then exit 1; fi
