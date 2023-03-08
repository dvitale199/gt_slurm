#!/bin/bash
#SBATCH --job-name=callgts
#SBATCH --output=~/logs/callgts.%A_%a.out
#SBATCH --error=~/logs/callgts.%A_%a.err
#SBATCH --ntasks=12
#SBATCH --nodes=12
#SBATCH --time=01:00:00
#SBATCH --array=1-$1

echo "Starting job"
date

# Run command for file ~/data/gp2_idats/204620380001
cd ~/; mkdir ~/data/gp2_idats/204620380001; gcsfuse --dir-mode 776 --file-mode 776 --implicit-dirs gp2_uk/gp2_idats/204620380001 ~/data/gp2_idats/204620380001; ~/GenoTools/executables/iaap-cli-linux-x64-1.1.0-sha.80d7e5b3d9c1fdfc2e99b472a90652fd3848bbc7/iaap-cli/iaap-cli gencall ~/data/ilmn_files/NeuroBooster_20042459_A1.bpm ~/data/ilmn_files/recluster_09272022.egt ~/tmp/204620380001 -f ~/data/gp2_idats/204620380001 -p -t 2; gsutil cp -r ~/tmp/204620380001/ gs://gp2_uk/gp2_plink/
# Run command for file ~/data/gp2_idats/206412050154
cd ~/; mkdir ~/data/gp2_idats/206412050154; gcsfuse --dir-mode 776 --file-mode 776 --implicit-dirs gp2_uk/gp2_idats/206412050154 ~/data/gp2_idats/206412050154; ~/GenoTools/executables/iaap-cli-linux-x64-1.1.0-sha.80d7e5b3d9c1fdfc2e99b472a90652fd3848bbc7/iaap-cli/iaap-cli gencall ~/data/ilmn_files/NeuroBooster_20042459_A1.bpm ~/data/ilmn_files/recluster_09272022.egt ~/tmp/206412050154 -f ~/data/gp2_idats/206412050154 -p -t 2; gsutil cp -r ~/tmp/206412050154/ gs://gp2_uk/gp2_plink/
# Run command for file ~/data/gp2_idats/206412050160
cd ~/; mkdir ~/data/gp2_idats/206412050160; gcsfuse --dir-mode 776 --file-mode 776 --implicit-dirs gp2_uk/gp2_idats/206412050160 ~/data/gp2_idats/206412050160; ~/GenoTools/executables/iaap-cli-linux-x64-1.1.0-sha.80d7e5b3d9c1fdfc2e99b472a90652fd3848bbc7/iaap-cli/iaap-cli gencall ~/data/ilmn_files/NeuroBooster_20042459_A1.bpm ~/data/ilmn_files/recluster_09272022.egt ~/tmp/206412050160 -f ~/data/gp2_idats/206412050160 -p -t 2; gsutil cp -r ~/tmp/206412050160/ gs://gp2_uk/gp2_plink/
# Run command for file ~/data/gp2_idats/206412050162
cd ~/; mkdir ~/data/gp2_idats/206412050162; gcsfuse --dir-mode 776 --file-mode 776 --implicit-dirs gp2_uk/gp2_idats/206412050162 ~/data/gp2_idats/206412050162; ~/GenoTools/executables/iaap-cli-linux-x64-1.1.0-sha.80d7e5b3d9c1fdfc2e99b472a90652fd3848bbc7/iaap-cli/iaap-cli gencall ~/data/ilmn_files/NeuroBooster_20042459_A1.bpm ~/data/ilmn_files/recluster_09272022.egt ~/tmp/206412050162 -f ~/data/gp2_idats/206412050162 -p -t 2; gsutil cp -r ~/tmp/206412050162/ gs://gp2_uk/gp2_plink/
# Run command for file ~/data/gp2_idats/206412050175
cd ~/; mkdir ~/data/gp2_idats/206412050175; gcsfuse --dir-mode 776 --file-mode 776 --implicit-dirs gp2_uk/gp2_idats/206412050175 ~/data/gp2_idats/206412050175; ~/GenoTools/executables/iaap-cli-linux-x64-1.1.0-sha.80d7e5b3d9c1fdfc2e99b472a90652fd3848bbc7/iaap-cli/iaap-cli gencall ~/data/ilmn_files/NeuroBooster_20042459_A1.bpm ~/data/ilmn_files/recluster_09272022.egt ~/tmp/206412050175 -f ~/data/gp2_idats/206412050175 -p -t 2; gsutil cp -r ~/tmp/206412050175/ gs://gp2_uk/gp2_plink/
# Run command for file ~/data/gp2_idats/206451070064
cd ~/; mkdir ~/data/gp2_idats/206451070064; gcsfuse --dir-mode 776 --file-mode 776 --implicit-dirs gp2_uk/gp2_idats/206451070064 ~/data/gp2_idats/206451070064; ~/GenoTools/executables/iaap-cli-linux-x64-1.1.0-sha.80d7e5b3d9c1fdfc2e99b472a90652fd3848bbc7/iaap-cli/iaap-cli gencall ~/data/ilmn_files/NeuroBooster_20042459_A1.bpm ~/data/ilmn_files/recluster_09272022.egt ~/tmp/206451070064 -f ~/data/gp2_idats/206451070064 -p -t 2; gsutil cp -r ~/tmp/206451070064/ gs://gp2_uk/gp2_plink/
# Run command for file ~/data/gp2_idats/206451070070
cd ~/; mkdir ~/data/gp2_idats/206451070070; gcsfuse --dir-mode 776 --file-mode 776 --implicit-dirs gp2_uk/gp2_idats/206451070070 ~/data/gp2_idats/206451070070; ~/GenoTools/executables/iaap-cli-linux-x64-1.1.0-sha.80d7e5b3d9c1fdfc2e99b472a90652fd3848bbc7/iaap-cli/iaap-cli gencall ~/data/ilmn_files/NeuroBooster_20042459_A1.bpm ~/data/ilmn_files/recluster_09272022.egt ~/tmp/206451070070 -f ~/data/gp2_idats/206451070070 -p -t 2; gsutil cp -r ~/tmp/206451070070/ gs://gp2_uk/gp2_plink/
# Run command for file ~/data/gp2_idats/206451070071
cd ~/; mkdir ~/data/gp2_idats/206451070071; gcsfuse --dir-mode 776 --file-mode 776 --implicit-dirs gp2_uk/gp2_idats/206451070071 ~/data/gp2_idats/206451070071; ~/GenoTools/executables/iaap-cli-linux-x64-1.1.0-sha.80d7e5b3d9c1fdfc2e99b472a90652fd3848bbc7/iaap-cli/iaap-cli gencall ~/data/ilmn_files/NeuroBooster_20042459_A1.bpm ~/data/ilmn_files/recluster_09272022.egt ~/tmp/206451070071 -f ~/data/gp2_idats/206451070071 -p -t 2; gsutil cp -r ~/tmp/206451070071/ gs://gp2_uk/gp2_plink/
# Run command for file ~/data/gp2_idats/206451070072
cd ~/; mkdir ~/data/gp2_idats/206451070072; gcsfuse --dir-mode 776 --file-mode 776 --implicit-dirs gp2_uk/gp2_idats/206451070072 ~/data/gp2_idats/206451070072; ~/GenoTools/executables/iaap-cli-linux-x64-1.1.0-sha.80d7e5b3d9c1fdfc2e99b472a90652fd3848bbc7/iaap-cli/iaap-cli gencall ~/data/ilmn_files/NeuroBooster_20042459_A1.bpm ~/data/ilmn_files/recluster_09272022.egt ~/tmp/206451070072 -f ~/data/gp2_idats/206451070072 -p -t 2; gsutil cp -r ~/tmp/206451070072/ gs://gp2_uk/gp2_plink/
# Run command for file ~/data/gp2_idats/206451070101
cd ~/; mkdir ~/data/gp2_idats/206451070101; gcsfuse --dir-mode 776 --file-mode 776 --implicit-dirs gp2_uk/gp2_idats/206451070101 ~/data/gp2_idats/206451070101; ~/GenoTools/executables/iaap-cli-linux-x64-1.1.0-sha.80d7e5b3d9c1fdfc2e99b472a90652fd3848bbc7/iaap-cli/iaap-cli gencall ~/data/ilmn_files/NeuroBooster_20042459_A1.bpm ~/data/ilmn_files/recluster_09272022.egt ~/tmp/206451070101 -f ~/data/gp2_idats/206451070101 -p -t 2; gsutil cp -r ~/tmp/206451070101/ gs://gp2_uk/gp2_plink/
# Run command for file ~/data/gp2_idats/206451070115
cd ~/; mkdir ~/data/gp2_idats/206451070115; gcsfuse --dir-mode 776 --file-mode 776 --implicit-dirs gp2_uk/gp2_idats/206451070115 ~/data/gp2_idats/206451070115; ~/GenoTools/executables/iaap-cli-linux-x64-1.1.0-sha.80d7e5b3d9c1fdfc2e99b472a90652fd3848bbc7/iaap-cli/iaap-cli gencall ~/data/ilmn_files/NeuroBooster_20042459_A1.bpm ~/data/ilmn_files/recluster_09272022.egt ~/tmp/206451070115 -f ~/data/gp2_idats/206451070115 -p -t 2; gsutil cp -r ~/tmp/206451070115/ gs://gp2_uk/gp2_plink/
# Run command for file ~/data/gp2_idats/206451070117
cd ~/; mkdir ~/data/gp2_idats/206451070117; gcsfuse --dir-mode 776 --file-mode 776 --implicit-dirs gp2_uk/gp2_idats/206451070117 ~/data/gp2_idats/206451070117; ~/GenoTools/executables/iaap-cli-linux-x64-1.1.0-sha.80d7e5b3d9c1fdfc2e99b472a90652fd3848bbc7/iaap-cli/iaap-cli gencall ~/data/ilmn_files/NeuroBooster_20042459_A1.bpm ~/data/ilmn_files/recluster_09272022.egt ~/tmp/206451070117 -f ~/data/gp2_idats/206451070117 -p -t 2; gsutil cp -r ~/tmp/206451070117/ gs://gp2_uk/gp2_plink/

echo "Job finished"
date
