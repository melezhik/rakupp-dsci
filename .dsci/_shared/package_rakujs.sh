#!/bin/bash
set -euo pipefail
NAME=${1:-rakujs-wasm}
echo "Shared: package rakujs $NAME"
# package existing zip files created by rakujs build
for f in rakujs-*.zip rakujs-showcase-web-*.zip; do
  if [ -f "$f" ]; then
    sha256sum "$f" > "$f.sha256" || true
  fi
done
ls -lh rakujs-*.zip*
