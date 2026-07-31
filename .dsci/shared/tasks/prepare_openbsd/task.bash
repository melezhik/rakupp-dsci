#!/bin/bash
set -euo pipefail

echo "Shared: prepare_openbsd"
ulimit -d 2097152 || true
