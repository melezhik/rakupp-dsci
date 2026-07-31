#!/bin/bash
set -euo pipefail
TAG="${TAG_NAME:-}${GITHUB_REF_NAME:-}${GITHUB_REF##*/:-}"
# choose the artifact pattern based on presence of artifacts
echo "Shared: upload_release (TAG_NAME=${TAG_NAME:-}, GITHUB_REF=${GITHUB_REF:-})"

if [ -z "${GITHUB_TOKEN:-}" ]; then
  echo "GITHUB_TOKEN not set; skipping release attach."
  exit 0
fi

if [ -z "${TAG_NAME:-}" ]; then
  echo "TAG_NAME not set; skipping release attach."
  exit 0
fi

# Use gh if present
if command -v gh >/dev/null 2>&1; then
  echo "Attaching any rakupp-*${NAME:-}* artifacts to release ${TAG_NAME}"
  gh auth status >/dev/null 2>&1 || gh auth login --with-token < <(printf "%s" "$GITHUB_TOKEN")
  gh release upload "$TAG_NAME" rakupp-*${NAME:-}*.* || true
  exit 0
fi

# Fallback: nothing else implemented here (opt-in)
echo "gh CLI not available; please install gh or implement API upload in this script."
