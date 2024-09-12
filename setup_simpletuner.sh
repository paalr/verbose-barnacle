#!/bin/bash

# Clone SimpleTuner
git clone --branch=release https://github.com/bghira/SimpleTuner.git
cd SimpleTuner
git checkout a2b170ef4e41bab6269110189f86f297a9484d96

# Set up Python environment
python -m venv .venv
source .venv/bin/activate
pip install -U poetry pip
poetry install --no-root
pip install optimum-quanto

# Create necessary directories
mkdir -p datasets cache/vae cache/text

# Prompt user for trigger word
read -p "Enter your trigger word: " trigger

# Create dataset folder with trigger name
mkdir -p "datasets/$trigger"

# Create cache subfolders with trigger name
mkdir -p "cache/vae/$trigger" "cache/text/$trigger"

# Ask user for number of images in dataset
read -p "Enter the number of images in your dataset: " num_images

# Calculate recommended number of steps (assuming 150 steps per image)
recommended_steps=$((num_images * 150))

# Download and modify config files
wget -O config/config.env https://raw.githubusercontent.com/paalr/verbose-barnacle/main/config.env
wget -O config/multidatabackend.json https://raw.githubusercontent.com/paalr/verbose-barnacle/main/multidatabackend.json

# Replace placeholder with actual trigger word and calculated steps
sed -i "s/m0del/$trigger/g" config/config.env
sed -i "s/m0del/$trigger/g" config/multidatabackend.json
sed -i "s/MAX_NUM_STEPS=.*/MAX_NUM_STEPS=$recommended_steps/" config/config.env

# Set up HuggingFace CLI
#pip install -U "huggingface_hub[cli]"
echo "Please run 'huggingface-cli login' and enter your token when prompted."

echo "Setup complete. Please upload your dataset to the datasets/$trigger folder."
echo "The recommended number of training steps ($recommended_steps) has been set in the config file."
echo "To start training, run the following commands:"
echo "cd /workspace/SimpleTuner"
echo "source /workspace/SimpleTuner/.venv/bin/activate"
echo "bash train.sh"