#!/bin/bash
usage="usage: buildi [{Debug|Release} {all|clean}]"

if [ -z "$1" ]; then
  build_type="Debug"
  target="all"
else
  if [ -z "$2" ]; then
    echo "$usage"
    exit 1
  fi
  build_type="$1"
  target="$2"
fi

ws_root="/home/bilel_j/STM32CubeIDE/workspace_1.12.1/test_jenkins"
build_dir="$ws_root/$build_type"

"$ws_root/ci-cd-tools/build.sh" "$build_dir" "$build_type" "$target"
