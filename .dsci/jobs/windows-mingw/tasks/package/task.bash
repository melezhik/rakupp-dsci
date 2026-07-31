#!/bin/bash
set -euo pipefail

NAME=$(config NAME)
exec ../../../../_shared/package_windows_mingw.sh "$NAME"
