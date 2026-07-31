$ErrorActionPreference = 'Stop'

# Read NAME and TAG_NAME and GITHUB_TOKEN
$NAME = & config NAME
$TAG_NAME = & config TAG_NAME
if (-not $NAME) { $NAME = 'windows-msvc' }
Write-Host "upload_release (windows-msvc) NAME=$NAME TAG_NAME=$TAG_NAME"

if (-not $env:GITHUB_TOKEN) {
  Write-Host "GITHUB_TOKEN not set; skipping release attach."
  exit 0
}
if (-not $TAG_NAME) {
  Write-Host "TAG_NAME not set; skipping release attach."
  exit 0
}

# Prefer gh CLI if available
if (Get-Command gh -ErrorAction SilentlyContinue) {
  Write-Host "Attaching artifacts to release $TAG_NAME via gh"
  # Ensure gh is authenticated; gh auth status returns non-zero if not auth'd
  try {
    gh auth status | Out-Null
  } catch {
    gh auth login --with-token < $env:GITHUB_TOKEN
  }
  gh release upload $TAG_NAME "rakupp-*${NAME}*.*" -y
  exit 0
}

Write-Host "gh CLI not available; please install gh or implement API upload in this task."
