#!/bin/bash

set -xeuo pipefail

EXTRA_ARGS=" --with-rdmacm=${PREFIX} --with-verbs=${PREFIX}"

if [[ "${cuda_compiler_version}" =~ 12.* ]]; then
  EXTRA_ARGS="${EXTRA_ARGS} --with-cuda=${PREFIX}"
elif [[ "${cuda_compiler_version}" != "None" ]]; then
  EXTRA_ARGS="${EXTRA_ARGS} --with-cuda=${CUDA_HOME}"
fi

./autogen.sh
./contrib/configure-release \
    --build="${BUILD}" \
    --host="${HOST}" \
    --prefix="${PREFIX}" \
    --with-sysroot \
    --disable-static \
    --enable-cma \
    --enable-mt \
    --with-gnu-ld \
    ${EXTRA_ARGS} || { cat config.log; exit 1; }


make -j${CPU_COUNT}
make install
