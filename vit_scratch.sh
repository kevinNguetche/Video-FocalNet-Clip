#!/bin/bash
#SBATCH --job-name=vit_train
#SBATCH --account=def-mpederso
#SBATCH --mem-per-cpu=64G 
#SBATCH --nodes=1
#SBATCH --gres=gpu:4
#SBATCH --time=0-00:01
#SBATCH -o /home/smuralid/error/slurm-%j.out  # Write the log on scratch
#SBATCH -e /home/smuralid/error/slurm-%j.err

# Directories

# Environment setup
source /home/smuralid/anaconda3/bin/activate
source activate focal
# bash scripts/hmdb51/video-focalnet_base.sh
# Check if the timeout command's exit status is 124, which indicates a timeout occurred
echo $?
echo "Crossed path"
bash scripts/hmdb51/vit_base.sh
