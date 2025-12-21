#!/bin/bash  -x

set  -ue

mkdir -p /p/Program/Build/ffmpeg
pushd    /p/Program/Build/ffmpeg

time  ~/Program/DTV/Build-FFmpeg/FFmpeg/configure  \
    --disable-shared  --enable-static   \
    --enable-gpl --enable-version3      \
    --toolchain=msvc                    \
; echo $?

time  make  ;  echo $?
time  make  install  ; echo $?

popd
