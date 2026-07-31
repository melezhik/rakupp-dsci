#!/bin/bash
set -euo pipefail

NAME=$(config NAME)
export NAME
exec ../../../../_shared/upload_release.sh
