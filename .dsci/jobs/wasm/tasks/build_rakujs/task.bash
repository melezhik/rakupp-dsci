#!/bin/bash
set -euo pipefail

echo "build_rakujs (job-specific for wasm)"
rakujs/build.sh
