#!/bin/bash


## flash attention
#cd /opt
#git clone https://github.com/Dao-AILab/flash-attention.git
#cd flash-attention
#uv pip install triton==3.2.0 --system
#NUM_CPUS=$(nproc)
#MAX_JOBS=$NUM_CPUS python setup.py install

uv pip install https://github.com/Dao-AILab/flash-attention/releases/download/v2.8.2/flash_attn-2.8.2+cu12torch2.7cxx11abiTRUE-cp312-cp312-linux_x86_64.whl --system
# cleanup
