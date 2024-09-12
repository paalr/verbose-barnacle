# SimpleTuner Setup Script for RunPod

This script automates the setup process for training a Flux LoRA using SimpleTuner on RunPod, based on the guide by [Aitrepreneur](https://civitai.com/user/Aitrepreneur) on CivitAI.

## Credits

This setup script is based on the guide "[Training a Flux LoRA using SimpleTuner on RunPod or Locally](https://civitai.com/articles/6678/training-a-flux-lora-using-simpletuner-on-runpod-or-locally)" by Aitrepreneur. We highly recommend reading the original guide for a deeper understanding of the process.

## Quick Start

1. Start a RunPod instance with the Stable Diffusion pod.
2. Open a terminal in the RunPod instance.
3. Run the following commands:

```bash
wget https://raw.githubusercontent.com/yourusername/yourrepo/main/setup_simpletuner.sh
chmod +x setup_simpletuner.sh
./setup_simpletuner.sh
```
4. Follow the prompts to enter your trigger word and the number of images in your dataset.
5. Upload your dataset to the `datasets/[your_trigger_word]` folder.
6. Run bash `train.sh` to start training.

## What This Script Does
1. Clones the SimpleTuner repository and checks out a specific commit.
2. Sets up the Python environment with required dependencies.
3. Creates necessary directories for datasets and cache.
4. Prompts for your trigger word and creates relevant folders.
5. Asks for the number of images in your dataset and calculates the recommended number of training steps.
6. Downloads and modifies configuration files.
7. Sets up the HuggingFace CLI.

## Manual steps
After running the script, you'll need to:
1. Run huggingface-cli login and enter your token when prompted.
2. Upload your dataset to the `datasets/[your_trigger_word]` folder.
3. Review the `config/config.env` and `config/multidatabackend.json` files to ensure settings match your requirements.
4. Run bash `train.sh` to start the training process.

## Customization
You can modify the script to suit your needs. For example, you can change the default number of training steps or add additional dependencies.

## Troubleshooting
If you encounter any issues, please refer to the original guide or reach out to the RunPod community for assistance.

## Disclaimer
This script is provided as-is and may require modifications based on your specific requirements. Use at your own risk.