#!/bin/bash

#SBATCH -o ./logs/joint.out

#SBATCH -e ./logs/joint.err

#SBATCH -J joint

#SBATCH -p gpu_p

#SBATCH --qos=gpu_normal

#SBATCH --gres=gpu:1

#SBATCH -c 4

#SBATCH --mem=90G

#SBATCH -t 2-00:00

#SBATCH --nice=10000

# Train autoencoder with joint latent space  
python train_encoder.py dataset=openproblem training_config=default +dataset.encoder_type=learnt_autoencoder \
dataset.dataset_path=/stor/lep/diffusion/multiome/openproblem_filtered.h5mu \
training_config.chekpoint_path=/stor/lep/workspace/scDiffusion-X/script/training_autoencoder/outputs/checkpoints \
encoder=encoder_multimodal encoder.is_binarized=True logger.project=my_autoencoder2 trainer.max_epochs=300
