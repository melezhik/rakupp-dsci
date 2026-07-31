#!/bin/bash
run_task "setup_msys2"
run_task "configure"
run_task "build"
run_task "smoke_windows_mingw"
run_task "smoke_e_windows_mingw"
run_task "smoke_exe_windows_mingw"
run_task "package"
run_task "upload_release"
