#!/bin/bash

# This is a sample of the constants file. Please write any env variables here
# and rename the file to constants.sh

CACHE=/scratch/tli104/.cache
DOREMI_DIR=/home/tli104/doremi
RP_DIR=/scratch/tli104/slimpajama-split
PREPROCESSED_RP_DIR=/scratch/tli104/slimpajama-split/rp_preprocessed  # will be created by scripts/run_filter_domains.sh

MODEL_OUTPUT_DIR=/scratch/tli104/rm_model_output_dir
WANDB_API_KEY=ffa04cba19ef3ea0e69dcd5c38837c2634f03c82  # Weights and Biases key for logging
PARTITION=defq # for slurm
mkdir -p ${CACHE}
mkdir -p ${MODEL_OUTPUT_DIR}

#source ~/.bashrc
conda activate /scratch/tli104/doremi_env
#source ${DOREMI_DIR}/venv/bin/activate  # if you installed doremi in venv
export WANDB_API_KEY=${WANDB_API_KEY}
