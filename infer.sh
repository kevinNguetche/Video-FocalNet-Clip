#!/bin/bash
#SBATCH --job-name=vit_train
#SBATCH --account=def-mpederso
#SBATCH --mem-per-cpu=64G 
#SBATCH --nodes=1
#SBATCH --gres=gpu:4
#SBATCH --time=0-03:00
#SBATCH -o /home/smuralid/error/slurm-%j.out  # Write the log on scratch
#SBATCH -e /home/smuralid/error/slurm-%j.err

# Directories

# Environment setup
source /home/smuralid/anaconda3/bin/activate
source activate focal
#bash scripts/hmdb51/video-focalnet_base.sh
# Check if the timeout command's exit status is 124, which indicates a timeout occurred
bash scripts/hmdb51/vit_base.sh
if [ $? -eq 124 ]; then
  echo "The script timed out after ${MAX_HOURS} hour(s). Restarting..."
  # Call the script itself again with the same configuration
  sbatch /home/smuralid/scratch/Video-FocalNets/infer.sh 
else
  echo "The script finished before timing out."
  # Exit or perform any other necessary cleanup
fi
