#!/bin/bash

set -e

sed -i.bak 's/-Werror //g' CMakeLists.txt

mkdir build-cmake
pushd build-cmake

cmake ${CMAKE_ARGS} \
  -DFLATBUFFERS_BUILD_SHAREDLIB=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -GNinja \
  ..

ninja
ctest
ninja install
popd

./build-cmake/flattests
