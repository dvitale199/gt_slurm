#!/bin/bash
args_file=$1
line=$(sed -n "${SLURM_ARRAY_TASK_ID}p" "${args_file}")

# Parse the arguments from the line in the file
idat_dir_in=$(echo "$line" | awk '{print $1}')
gcs_idat_path=$(echo "$line" | awk '{print $2}')
gcs_plink_path=$(echo "$line" | awk '{print $3}')

echo "Starting job"
date

python3 /home/dan_datatecnica_com/scripts/call_gts.py --input ${idat_dir_in} --gcs_in ${gcs_idat_path} --gcs_out ${gcs_plink_path}

echo "Job finished"
date
