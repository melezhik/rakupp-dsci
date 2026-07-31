#!/bin/bash
run_task "configure"
run_task "build"
run_task "smoke_posix"
run_task "install_layout"
run_task "package"
run_task "upload_release"
