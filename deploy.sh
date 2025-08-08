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

apt update -y && apt install -y aria2

echo "----------------------------------"
echo "Setting up YUM YUM !"
source ./structure.sh
cd /opt


echo "Run: Clone repo"
git clone --depth 1 https://github.com/ddesmond/trainer-diffusion-pipe.git
cd /opt/trainer-diffusion-pipe
git pull

source ./wan_download.sh &
cd /opt/trainer-diffusion-pipe
source ./setup.sh

cp -r ./configs/ /opt/workspace/configs

cp ./gradio_app.py /opt/diffusion-pipe/gradio_app.py
cd /opt/diffusion-pipe

python3 gradio_app.py