# PowerShell job only calls run_task
run_task "configure"
run_task "build"
run_task "smoke_windows_pwsh"
run_task "smoke_e_windows_pwsh"
run_task "smoke_exe_windows_pwsh"
run_task "package"
run_task "upload_release"
