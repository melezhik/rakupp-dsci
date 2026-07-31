#!/bin/bash
run_task "build_native"
run_task "setup_emsdk"
run_task "build_rakujs"
run_task "bundle_showcase"
run_task "package"
run_task "upload_release"
