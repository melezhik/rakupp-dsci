#!/bin/bash
set -euo pipefail
echo "Shared: prepare_openbsd"
ulimit -d 2097152 || true
# On OpenBSD you may need pkg_add cmake gmake — job wrapper should install
