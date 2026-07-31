#!/bin/bash
set -euo pipefail

NAME=$(config NAME)
exec ../../../../_shared/package_rakujs.sh "$NAME"
