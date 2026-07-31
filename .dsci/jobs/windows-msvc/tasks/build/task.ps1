$ErrorActionPreference = 'Stop'
Write-Host "build (windows-msvc job)"
cmake --build build --config Release
