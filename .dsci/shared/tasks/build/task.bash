#!/bin/bash
set -euo pipefail

echo "build task (shared)"
if [ "${MINGW:-}" = "true" ] || [ "${mingw:-}" = "true" ]; then
  cmake --build build -j 4
else
  cmake --build build --config Release -j 4
fi
