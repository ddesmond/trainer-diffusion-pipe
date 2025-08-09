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

echo "--------------- pre aria -------------------"
apt update -y && apt install -y aria2

echo "----------------------------------"
echo "Run: Clone repo"
cd /opt
git clone --depth 1 https://github.com/ddesmond/trainer-diffusion-pipe.git
cd /opt/trainer-diffusion-pipe
git pull


echo "----------------------------------"
echo "Setting up YUM YUM !"


echo "----------------------------------"
echo "Setting up structure !"
cd /opt/trainer-diffusion-pipe
source ./structure.sh
ls -la /opt/

echo "----------------------------------"
cd /opt/trainer-diffusion-pipe
source ./wan_download.sh &

echo "----------------------------------"
echo "Run: setup.sh"
cd /opt/trainer-diffusion-pipe
source ./setup.sh

echo "----------------------------------"
echo "Run: copy configs"
cp -r ./configs/ /opt/workspace/configs/

echo "----------------------------------"
echo "Run: Setup Gradio"
cp /opt/trainer-diffusion-pipe/gradio_app.py /opt/diffusion-pipe/gradio_app.py
cd /opt/diffusion-pipe

# run gradio
python3 gradio_app.py