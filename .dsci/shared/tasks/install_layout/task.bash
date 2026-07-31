#!/bin/bash
set -euo pipefail

echo "Shared: install_layout"
cmake --install build --config Release --prefix dist/rakupp
