#!/bin/bash
git clone https://github.com/dvitale199/GenoTools.git
cd GenoTools/
pip3 install --user .
cd ~/


# also run these in the compute node
# get plink
wget https://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20230116.zip
unzip plink_linux_x86_64_20230116.zip
mv plink /home/dan_datatecnica_com/bin/
rm plink_linux_x86_64_20230116.zip prettify LICENSE toy.map toy.ped 

# get plink2
wget https://s3.amazonaws.com/plink2-assets/plink2_linux_avx2_20230109.zip
unzip plink2_linux_avx2_20230109.zip
mv plink2 /home/dan_datatecnica_com/bin/
rm plink2_linux_avx2_20230109.zip

mkdir scripts
mkdir data
mkdir logs

# need to work out these versions later for VM
pip3 install --user h5py
pip3 install --user Pillow
pip3 install --user joblib
pip3 install --user matplotlib
pip3 install --user numpy
pip3 install --user pandas
pip3 install --user requests
pip3 install --user scikit_learn
pip3 install --user scipy
pip3 install --user setuptools
pip3 install --user statsmodels
pip3 install --user umap

# not working at the moment
# pip3 install --user jupyter

# mount gcs
# gcsfuse --dir-mode 777 --file-mode 777 --implicit-dirs gp2_uk ~/gcs/gp2_data

