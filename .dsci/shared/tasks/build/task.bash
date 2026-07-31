#!/bin/bash
set -euo pipefail

echo "build task (shared)"
# Read MINGW flag from job inputs
MINGW_VAL=$(config mingw)

if [ "${MINGW_VAL:-}" = "true" ]; then
  cmake --build build -j 4
else
  cmake --build build --config Release -j 4
fi
