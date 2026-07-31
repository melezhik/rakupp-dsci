#!/bin/bash
set -euo pipefail

echo "configure task (shared)"

# Prefer job-provided params via config(), fallback to environment variables
CC_CONF=$(config CC 2>/dev/null || true)
CXX_CONF=$(config CXX 2>/dev/null || true)
MINGW_CONF=$(config MINGW 2>/dev/null || true)
OS_CONF=$(config OS 2>/dev/null || true)

if [ -n "${CC_CONF:-}" ]; then
  export CC="$CC_CONF"
elif [ -n "${CC:-}" ]; then
  export CC
fi
if [ -n "${CXX_CONF:-}" ]; then
  export CXX="$CXX_CONF"
elif [ -n "${CXX:-}" ]; then
  export CXX
fi

# Resolve MINGW/OS flags used below
MINGW_VAL="${MINGW_CONF:-${MINGW:-${mingw:-}}}"
OS_VAL="${OS_CONF:-${OS:-}}"

# Special handling for macOS or mingw can be driven by the resolved OS/NAME flags:
if [ "${OS_VAL:-}" = "macos" ] || [ "${NAME:-}" = "macos-universal" ]; then
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release "-DCMAKE_OSX_ARCHITECTURES=arm64;x86_64" -DCMAKE_OSX_DEPLOYMENT_TARGET=11.0
  exit 0
fi

if [ "${MINGW_VAL:-}" = "true" ]; then
  cmake -S . -B build -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release "-DCMAKE_EXE_LINKER_FLAGS=-static"
  exit 0
fi

# Default Linux/posix configure (supports static libstdc++ when requested)
if [ "${CC:-}" = "clang" ] || [ "${CXX:-}" = "clang++" ]; then
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release "-DCMAKE_EXE_LINKER_FLAGS=-static-libgcc -static-libstdc++"
else
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
fi
