#!/bin/bash
set -euo pipefail

echo "Shared: smoke_e_posix"
out=$(build/rakupp -e 'say 6 * 7')
echo "got: [$out]"
test "$out" = "42"
