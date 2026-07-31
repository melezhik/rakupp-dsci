#!/bin/bash
#!/bin/bash
set -euo pipefail

echo "Shared: configure"

# If CC/CXX provided, export them (jobs can set env before calling task)
if [ -n "${CC:-}" ]; then
  export CC
fi
if [ -n "${CXX:-}" ]; then
  export CXX
fi

# Special handling for macOS or mingw can be driven by env flags:
if [ "${OS:-}" = "macos" ] || [ "${NAME:-}" = "macos-universal" ]; then
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release "-DCMAKE_OSX_ARCHITECTURES=arm64;x86_64" -DCMAKE_OSX_DEPLOYMENT_TARGET=11.0
  exit 0
fi

if [ "${MINGW:-}" = "true" ] || [ "${mingw:-}" = "true" ]; then
  # invoked from windows-mingw wrapper in an MSYS2 shell
  cmake -S . -B build -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release "-DCMAKE_EXE_LINKER_FLAGS=-static"
  exit 0
fi

# Default Linux/posix configure (supports static libstdc++ when requested)
if [ "${CC:-}" = "clang" ] || [ "${CXX:-}" = "clang++" ]; then
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release "-DCMAKE_EXE_LINKER_FLAGS=-static-libgcc -static-libstdc++"
else
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
fi
