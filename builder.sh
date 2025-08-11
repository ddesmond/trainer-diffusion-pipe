#!/bin/bash

echo "Run: Get conda"
mkdir -p /opt/miniconda3

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /opt/miniconda.sh
bash /opt/miniconda.sh -b -u -p /opt/miniconda3

echo "Run: Activate conda"
source /opt/miniconda3/bin/activate  #(activates the conda)

echo "Run: Setup CONDA .bashrc PATH"
echo 'export PATH="/opt/miniconda3/bin:$PATH"' >> ~/.bashrc

source ~/.bashrc
echo "Run: INIT conda"
conda init --all
source ~/.bashrc

echo "Run: Get channels conda"
cd /opt/diffusion-pipe
conda config --add channels conda-forge
conda config --add channels defaults

echo "Run: Accept TOS channels conda"
conda tos accept --override-channels --channel defaults
conda tos accept --override-channels --channel conda-forge

echo "Run: create py3.12 + env in conda"
conda create -n diffusion-pipe python=3.12 --yes

echo "Run: Activate conda env"
conda activate diffusion-pipe

pip install --upgrade pip

pip install torch==2.7.1 torchvision==0.22.1 torchaudio==2.7.1 --index-url https://download.pytorch.org/whl/cu128

pip install -r requirements.txt
pip install gradio