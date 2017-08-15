#!/bin/bash

PROJ_ROOT=$PWD
SUFFIX=_android

SOURCES_ROOT=$PROJ_ROOT/..

source common.sh

cd $BUILD_ROOT
cmake -DCMAKE_INSTALL_PREFIX=$DEST_ROOT \
      -DTHIRD_PARTY_PATH=$THIRD_PARTY_PATH \
      -DCMAKE_SYSTEM_NAME=Android \
      -DANDROID_STANDALONE_TOOLCHAIN=$ANDROID_ARM_TOOLCHAIN_ROOT \
      -DANDROID_ABI=armeabi-v7a \
      -DANDROID_ARM_NEON=ON \
      -DANDROID_ARM_MODE=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DWITH_C_API=ON \
      -DWITH_SWIG_PY=OFF \
      -DWITH_STYLE_CHECK=OFF \
      -DWITH_GOLANG=OFF \
      -DCMAKE_PREFIX_PATH="$JUMBO_ROOT" \
      $SOURCES_ROOT

cd $PROJ_ROOT

