#!/bin/bash
set -euo pipefail
NAME=$(config NAME)
echo "package windows mingw $NAME"
zip -q -r "rakupp-${NAME}.zip" dist/rakupp || true
sha256sum "rakupp-${NAME}.zip" > "rakupp-${NAME}.zip.sha256" || true
