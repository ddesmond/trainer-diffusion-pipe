#!/bin/bash

# written by ddesmond / Aleks Katunar
# RUN THIS FROM CLI OR DATACRUNCH DASHBOARD as a script!

echo "----------------------------------"
echo "Setup work ENVS"
# SYSTEM
export HOME="/root"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIP_ROOT_USER_ACTION=ignore

echo "----------------------------------"
echo "Setting up YUM YUM !"
cd /opt
echo "Run: Clone repo"
git clone --depth 1 https://github.com/ddesmond/trainer-diffusion-pipe.git
cd /opt/trainer-diffusion-pipe.git
git pull

source structure.sh
source setup.sh


cp gradio_app.py /opt/diffusion-pipe/gradio_app.py
cd /opt/diffusion-pipe

python3 gradio_app.py