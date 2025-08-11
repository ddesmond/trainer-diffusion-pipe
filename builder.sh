#!/bin/bash

mkdir -p /opt/miniconda3

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /opt/miniconda3/miniconda.sh
bash /opt/miniconda3/miniconda.sh -b -p /opt/miniconda3

source /opt/miniconda3/bin/activate  #(activates the conda)

conda init --all

cd /opt/diffusion-pipe

conda create -n diffusion-pipe python=3.12
conda activate diffusion-pipe

pip install torch==2.7.1 torchvision==0.22.1 torchaudio==2.7.1 --index-url https://download.pytorch.org/whl/cu128

pip install -r requirements.txt
pip install gradio