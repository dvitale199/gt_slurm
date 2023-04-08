#!/bin/bash
# the following runs any python script with arguments from a file in an sbatch job which can be submitted to the gcp slurm cluster
# Get the name of the input file, the task ID, and the Python script
script=$1
args_file=$2
task_id=$SLURM_ARRAY_TASK_ID


# Get the arguments for this task from the input file
line=$(sed -n "${task_id}p" "${args_file}")
args=( $line )

echo "Starting job $task_id"
date

# Run the Python script with the arguments for this task
python3 "$script" "${args[@]}"

echo "Job $task_id finished"
date