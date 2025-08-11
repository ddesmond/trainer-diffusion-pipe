#!/bin/bash
export DIPIPE="/opt/diffusion-pipe"
export HOME="/root"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIP_ROOT_USER_ACTION=ignore

# OS
apt update -y
apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev libffi-dev liblzma-dev tk-dev \
libncurses5-dev libncursesw5-dev libgdbm-dev libc6-dev ninja-build make
apt install -y plocate nano screen zip curl wget busybox
apt-get install -y --no-install-recommends \
    curl ffmpeg ninja-build git aria2 git-lfs wget vim \
    libgl1 libglib2.0-0 build-essential gcc


echo "----------------------------------"
echo "Run: curl pyenv"
# python
curl https://pyenv.run | bash

echo "Run: Setup .bashrc"
echo 'export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"' >> ~/.bashrc

source ~/.bashrc

echo "Run: Eval pyenv"
eval "$(pyenv virtualenv-init -)"


echo "Run: setup python 3.12"
# install 3.12
pyenv install 3.12

echo "Run: Set global python 3.12"
pyenv global 3.12

echo "Run: Verify python version"
# verify
python3 --version

source ~/.bashrc

echo "----------------------------------"
echo "Run: Eval pyenv and set global"
eval "$(pyenv init -)"
pyenv global 3.12

echo "Run: Setup UV"
curl -LsSf https://astral.sh/uv/install.sh | sh

echo "Run: Setup UV .bashrc PATH"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

source ~/.bashrc
source $HOME/.local/bin/env

uv pip install packaging wheel setuptools --system


cd /opt
git clone --recurse-submodules https://github.com/tdrussell/diffusion-pipe.git
cd diffusion-pipe

git fetch origin && git reset --hard origin/main
git submodule foreach --recursive git fetch origin
git submodule foreach --recursive git reset --hard

#
## Set appropriate PyTorch index URL
#if [[ "$CUDA_VERSION" == "12.8" ]]; then
#    TORCH_INDEX_URL="https://download.pytorch.org/whl/cu128"
#elif [[ "$CUDA_VERSION" == "12.6" ]]; then
#    TORCH_INDEX_URL="https://download.pytorch.org/whl/cu126"
#elif [[ "$CUDA_VERSION" == "12.5" ]]; then
#    TORCH_INDEX_URL="https://download.pytorch.org/whl/cu125"
#elif [[ "$CUDA_VERSION" == "12.4" ]]; then
#    TORCH_INDEX_URL="https://download.pytorch.org/whl/cu124"
#else
#    TORCH_INDEX_URL="https://download.pytorch.org/whl/cu128"
#fi
#uv pip install torch torchvision torchaudio --index-url $TORCH_INDEX_URL --system
#
#wget -c https://huggingface.co/TheArtOfficialTrainer/container_whls/resolve/main/flash_attn-2.7.4.post1-cp312-cp312-linux_x86_64.whl
#uv pip install flash_attn-2.7.4.post1-cp312-cp312-linux_x86_64.whl --system
#
#sed -i '/^torch$/d' requirements.txt
#sed -i '/^torchaudio$/d' requirements.txt
#sed -i '/^torchvision$/d' requirements.txt
#sed -i '/^flash-attn==2.8.1$/d' requirements.txt
#
#uv pip install -r requirements.txt --system
#uv pip install gradio toml --system
## Start Diffusion Pipe UI
#
#uv pip install packaging setuptools wheel --system
#uv pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu128 --system
#uv pip install opencv-python pyyaml gdown triton comfy-cli PyOpenGL-accelerate sageattention --system

