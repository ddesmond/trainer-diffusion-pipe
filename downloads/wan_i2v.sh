# CONFIG:
# {
#   "model_type": "wan",
#   "model_name": "Wan2.1-T2V-14B",
#   "ckpt_path": "/workspace/training_models/Wan2.1-T2V-14B",
#   "dtype": "bfloat16",
#   "transformer_dtype": "float8",
#   "timestep_sample_method": "logit_normal"
# }

cd /opt/workspace/training_models

bash /opt/trainer-diffusion-pipe/hugface.sh Wan-AI/Wan2.1-I2V-14B