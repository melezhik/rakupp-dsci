#!/bin/bash
set -euo pipefail
NAME=$(config NAME)
echo "Shared: package for $NAME"
cp README.md LICENSE dist/rakupp/ 2>/dev/null || true
tar -C dist -czf rakupp-${NAME}.tar.gz rakupp
if command -v shasum >/dev/null; then
  shasum -a 256 rakupp-${NAME}.tar.gz > rakupp-${NAME}.tar.gz.sha256
else
  sha256sum rakupp-${NAME}.tar.gz > rakupp-${NAME}.tar.gz.sha256
fi
