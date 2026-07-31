#!/bin/bash
run_task "configure_gcc"
run_task "build"
run_task "smoke_posix"
