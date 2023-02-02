#!/bin/bash
cd ~/
git clone https://github.com/dvitale199/GenoTools.git
cd GenoTools/
pip3 install --user .
cd ~/
mkdir gcs
mkdir gcs/gp2_data

# need to work out these versions later for VM
pip3 install --user h5py
pip3 install --user joblib
pip3 install --user matplotlib
pip3 install --user numpy
pip3 install --user pandas
pip3 install --user Pillow
pip3 install --user requests
pip3 install --user scikit_learn
pip3 install --user scipy
pip3 install --user setuptools
pip3 install --user statsmodels
pip3 install --user umap

# mount gcs
gcsfuse --dir-mode 776 --file-mode 776 --implicit-dirs gp2_data ~/gcs/gp2_data
