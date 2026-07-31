$ErrorActionPreference = 'Stop'
Write-Host "smoke_e_windows_pwsh (windows-msvc job)"
$out = & .\build\rakupp.exe -e "say 6 * 7"
Write-Host "got: [$out]"
if ($out -ne '42') { exit 1 }
