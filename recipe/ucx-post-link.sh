#!/bin/bash

cat << EOF >> "${PREFIX}/.messages.txt"

To enable CUDA support, UCX requires the CUDA Runtime library (libcudart).
The library can be installed with the appropriate command below:

* For CUDA 12, run:    conda install cuda-cudart cuda-version=12
* For CUDA 13, run:    conda install cuda-cudart cuda-version=13

If any of the packages you requested use CUDA then CUDA should already
have been installed for you.

EOF
