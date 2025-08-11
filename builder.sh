#!/bin/bash


## flash attention
cd /opt
git clone https://github.com/Dao-AILab/flash-attention.git
cd flash-attention
uv pip install triton==3.2.0 --system
NUM_CPUS=$(nproc)
MAX_JOBS=$NUM_CPUS python setup.py install

