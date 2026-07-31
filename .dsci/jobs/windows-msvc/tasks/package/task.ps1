$ErrorActionPreference = 'Stop'

# Read job parameter NAME via config helper
$NAME = & config NAME
if (-not $NAME) { $NAME = 'windows-msvc' }
Write-Host "package (windows-msvc job) for $NAME"

$dest = "rakupp-$NAME.zip"
if (Test-Path -Path "dist\rakupp") {
  # Compress-Archive requires wildcarding; include files inside dist\rakupp
  Remove-Item -ErrorAction SilentlyContinue -Path $dest
  Compress-Archive -Path "dist\rakupp\*" -DestinationPath $dest -Force
} else {
  Write-Host "dist\\rakupp not found; skipping packaging"
  exit 0
}

# Compute SHA256
$hash = Get-FileHash -Algorithm SHA256 -Path $dest
$hash.Hash | Out-File -Encoding ascii "${dest}.sha256"
Write-Host "Created $dest and ${dest}.sha256"
