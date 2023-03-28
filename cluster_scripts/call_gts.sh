#!/bin/bash
args_file=$1
line=$(sed -n "${SLURM_ARRAY_TASK_ID}p" "${args_file}")

# Parse the arguments from the line in the file
idat_dir_in=$(echo "$line" | awk '{print $1}')
out_path=$(echo "$line" | awk '{print $2}')

echo "Starting job"
date

python3 ~/scripts/call_gts.py --input ${idat_dir_in} --output ${out_path}

echo "Job finished"
date
