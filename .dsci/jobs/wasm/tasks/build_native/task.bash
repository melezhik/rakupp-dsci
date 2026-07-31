#!/bin/bash
set -euo pipefail

# build_native (job-specific for wasm)
exec rakujs/build.sh
