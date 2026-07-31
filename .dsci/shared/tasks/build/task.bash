#!/bin/bash
set -euo pipefail

echo "build task (shared)"
# Prefer job-provided MINGW flag via config
MINGW_CONF=$(config MINGW 2>/dev/null || true)
MINGW_VAL="${MINGW_CONF:-${MINGW:-${mingw:-}}}"

if [ "${MINGW_VAL:-}" = "true" ] || [ "${mingw:-}" = "true" ]; then
  cmake --build build -j 4
else
  cmake --build build --config Release -j 4
fi
