#!/usr/bin/env bash

set -e

BUILD_DIR=build_dir_tmp

rm -rf "$BUILD_DIR"
mkdir "$BUILD_DIR"
cd "$BUILD_DIR"

PACK_ROOT="deb"
DEBIAN_FOLDER="$PACK_ROOT/DEBIAN"
LOCAL_INSTALL="$PACK_ROOT/usr/local"
mkdir -p "$LOCAL_INSTALL"
LOCAL_INSTALL_FULL="$(pwd)"/"$LOCAL_INSTALL"

cmake .. \
-DWITH_LFS=OFF \
-DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$LOCAL_INSTALL_FULL" \
-DCMAKE_MACOSX_RPATH=1

make -j8
make install

open "$LOCAL_INSTALL_FULL"

