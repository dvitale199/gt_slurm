#!/bin/bash
git clone https://github.com/dvitale199/GenoTools.git
cd GenoTools/
pip3 install --user .
cd ~/
# mkdir /genoslurm_nfs/bin
mkdir ~/bin

# also run these in the compute node
# get plink
wget https://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20230116.zip
unzip plink_linux_x86_64_20230116.zip
sudo mv plink ~/bin/
sudo chmod 777 ~/bin/plink 
rm plink_linux_x86_64_20230116.zip prettify LICENSE toy.map toy.ped 

# get plink2
wget https://s3.amazonaws.com/plink2-assets/alpha3/plink2_linux_avx2_20221024.zip
unzip plink2_linux_avx2_20221024.zip
sudo mv plink2 ~/bin/
sudo chmod 777 ~/bin/plink2
rm plink2_linux_avx2_20221024.zip

mkdir scripts
mkdir inputs
mkdir logs
mkdir /tmp/data
sudo chmod -r 777 /tmp/data 

# need to work out these versions later for VM
python3 -m pip install --upgrade --user pip
python3 -m pip install --upgrade --user Pillow
python3 -m pip install --upgrade --user matplotlib
pip3 install --user h5py
pip3 install --user joblib
pip3 install --user numpy
pip3 install --user pandas
pip3 install --user requests
pip3 install --user scikit_learn
pip3 install --user scipy
pip3 install --user setuptools
pip3 install --user statsmodels
pip3 install --user umap


# some notes on installing GenoTools:
# install will work but right now, importing gets stuck on downloading GCTA dynamically
# will need to download locally and upload to /$HOME/.genotools/misc/executables/ to get this running

# not working at the moment
# pip3 install --user jupyter

# mount gcs
# gcsfuse --dir-mode 777 --file-mode 777 --implicit-dirs gp2_uk ~/gcs/gp2_data


