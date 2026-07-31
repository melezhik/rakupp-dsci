#!/bin/bash
# job only calls run_task (each task is a step)
run_task "configure"
run_task "build"
run_task "smoke_posix"
run_task "smoke_e_posix"
run_task "smoke_exe_posix"
run_task "install_layout"
run_task "package"
run_task "upload_release"
