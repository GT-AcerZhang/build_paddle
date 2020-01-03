#!/bin/bash

NVCC=`which nvcc`
if [ ${NVCC} != "" ]; then
  NVCC_VERSION=`nvcc --version | tail -n 1 | grep "[0-9][0-9]*\.[0-9]" -o | uniq`
  SUFFIX=${SUFFIX}"_cuda${NVCC_VERSION}"
fi
GCC_VERSION=`gcc --version | head -n 1 | grep "[0-9]\.[0-9]\.[0-9]" -o | uniq`
SUFFIX=${SUFFIX}"_gcc${GCC_VERSION}"

BUILD_ROOT=${PROJ_ROOT}/build$SUFFIX
DEST_ROOT=$PROJ_ROOT/dist$SUFFIX
THIRD_PARTY_PATH=$PROJ_ROOT/third_party$SUFFIX

#### Set default sources root
if [ -z $SOURCES_ROOT ]; then
  SOURCES_ROOT=$PROJ_ROOT/..
fi

echo "PROJ_ROOT: ${PROJ_ROOT}"
echo "SOURCES_ROOT: ${SOURCES_ROOT}"
echo "BUILD_ROOT: ${BUILD_ROOT}"
echo "THIRD_PARTY_PATH: ${THIRD_PARTY_PATH}"
