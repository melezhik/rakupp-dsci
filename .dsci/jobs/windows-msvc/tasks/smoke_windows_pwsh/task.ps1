$ErrorActionPreference = 'Stop'
Write-Host "smoke_windows_pwsh (windows-msvc job)"
& .\build\rakupp.exe tools/smoke.raku
