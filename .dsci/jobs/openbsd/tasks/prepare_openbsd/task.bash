#!/bin/bash
set -euo pipefail

echo "prepare_openbsd (job-specific for openbsd)"
ulimit -d 2097152 || true
# On OpenBSD you may need pkg_add cmake gmake — job wrapper should install
