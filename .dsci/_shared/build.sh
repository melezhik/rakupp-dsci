#!/bin/bash
set -euo pipefail
echo "Shared: build"
if [ "${MINGW:-}" = "true" ] || [ "${mingw:-}" = "true" ]; then
  cmake --build build -j 4
else
  cmake --build build --config Release -j 4
fi
