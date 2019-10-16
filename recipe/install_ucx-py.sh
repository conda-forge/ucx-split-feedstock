#!/bin/bash

set -xeuo pipefail

cd "${SRC_DIR}/ucx-py"
$PYTHON setup.py build_ext install
