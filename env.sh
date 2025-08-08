# add envs here
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIP_ROOT_USER_ACTION=ignore

source ~/.bashrc

echo "Run: Eval pyenv and set global"
eval "$(pyenv init -)"
pyenv global 3.12


echo "LOAD env vars"

# Setup envs here
export HF_TOKEN=""
export HF_ENDPOINT="https://huggingface.co"
export HF_HUB_ENABLE_HF_TRANSFER=true
export HF_HUB_ENABLE_HF_TRANSFER_NO_AUTH=true
export HF_HUB_DOWNLOAD_TIMEOUT=60

#COMFY
export COMFYUI_PATH=/opt/ComfyUI

