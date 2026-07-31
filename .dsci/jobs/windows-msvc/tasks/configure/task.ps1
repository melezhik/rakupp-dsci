$ErrorActionPreference = 'Stop'
Write-Host "configure (windows-msvc job)"

# Use Visual Studio generator for MSVC x64
# The job runner should have appropriate Visual Studio environment available
cmake -S . -B build -A x64 -DCMAKE_BUILD_TYPE=Release
