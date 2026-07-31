$ErrorActionPreference = 'Stop'
Write-Host "smoke_exe_windows_pwsh (windows-msvc job)"
& .\build\rakupp.exe --exe tools/smoke.raku -o smoke-native.exe
& .\smoke-native.exe
$code = $LASTEXITCODE
Write-Host "native exit code: $code"
exit $code
