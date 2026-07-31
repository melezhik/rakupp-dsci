#!/bin/bash
set -euo pipefail
if command -v em++ >/dev/null 2>&1; then
  echo "emsdk already available"
  exit 0
fi
echo "Bootstrapping emsdk (may take a while)."
git clone https://github.com/emscripten-core/emsdk.git emsdk || true
pushd emsdk
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh || true
popd
