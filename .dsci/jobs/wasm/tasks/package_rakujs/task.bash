#!/bin/bash
set -euo pipefail
NAME=$(config NAME)
echo "package rakujs $NAME"
for f in rakujs-*.zip rakujs-showcase-web-*.zip; do
  if [ -f "$f" ]; then
    sha256sum "$f" > "$f.sha256" || true
  fi
done
ls -lh rakujs-*.zip*
