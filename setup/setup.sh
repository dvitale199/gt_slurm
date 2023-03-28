#!/bin/bash
git clone https://github.com/dvitale199/GenoTools.git
cd GenoTools/
pip3 install --user .
cd ~/
mkdir /genoslurm_nfs/bin

# also run these in the compute node
# get plink
wget https://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20230116.zip
unzip plink_linux_x86_64_20230116.zip
mv plink /genoslurm_nfs/bin/
rm plink_linux_x86_64_20230116.zip prettify LICENSE toy.map toy.ped 

# get plink2
wget https://s3.amazonaws.com/plink2-assets/plink2_linux_avx2_20230303.zip
unzip plink2_linux_avx2_20230303.zip
mv plink2 /genoslurm_nfs/bin/
rm plink2_linux_avx2_20230109.zip

mkdir scripts
mkdir inputs
mkdir logs

# need to work out these versions later for VM
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade Pillow
python3 -m pip install --upgrade matplotlib
pip3 install --user h5py
pip3 install --user Pillow
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