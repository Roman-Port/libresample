#!/usr/bin/env bash

# Based on https://github.com/Roman-Port/nrsc5/blob/master/support/win-cross-compile

set -e

if [ "$1" == 32 ]; then
    prefix=build-win32
    host=i686-w64-mingw32
elif [ "$1" == 64 ]; then
    prefix=build-win64
    host=x86_64-w64-mingw32
else
    echo "Usage: $0 (32|64) [make flags]"
    exit 1
fi
shift

mkdir -p ${prefix}

cd ${prefix}
cmake \
    -D CMAKE_SYSTEM_NAME=Windows \
    -D CMAKE_C_COMPILER=${host}-gcc \
    -D CMAKE_INSTALL_PREFIX=${prefix} \
    ..
