#!/bin/bash

# folder setup
cd /opt
echo "-------------------------------"
echo "Creating folders in /opt"

mkdir -p ./workspace \
&& mkdir -p ./workspace/models \
&& mkdir -p ./workspace/models/loras \
&& mkdir -p ./workspace/configs \
&& mkdir -p ./workspace/training_models \
&& mkdir -p ./scripts \
&& mkdir -p ./scripts/download_training_transformers

cd /
