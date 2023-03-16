#!/bin/bash
#SBATCH --job-name=myjob
#SBATCH --output=myjob.out
#SBATCH --error=myjob.err
#SBATCH --ntasks=1
#SBATCH --time=01:00:00
#SBATCH --array=1-1

echo "Starting job"
date

# Run command for file /home/dan_datatecnica_com/data/gp2_idats/204620380001
/home/dan_datatecnica_com/GenoTools/executables/iaap-cli-linux-x64-1.1.0-sha.80d7e5b3d9c1fdfc2e99b472a90652fd3848bbc7/iaap-cli/iaap-cli gencall /home/dan_datatecnica_com/data/ilmn_files/NeuroBooster_20042459_A1.bpm /home/dan_datatecnica_com/data/ilmn_files/recluster_09272022.egt /home/dan_datatecnica_com/data/ilmn_files/gp2_plink -f /home/dan_datatecnica_com/data/gp2_idats/204620380001 -p -t 8

echo "Job finished"
date
