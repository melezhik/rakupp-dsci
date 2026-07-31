#!/bin/bash
set -euo pipefail
echo "Shared: smoke_posix"
./build/rakupp tools/smoke.raku
