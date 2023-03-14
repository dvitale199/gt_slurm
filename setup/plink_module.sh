#!/bin/bash

# Set the PLINK version
PLINK_VERSION="1.9"

# Set the URL for the latest PLINK 1.9 release
PLINK_URL="https://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20230116.zip"

# Set the directory where PLINK will be installed
PLINK_INSTALL_DIR="/home/dan_datatecnica_com/bin/plink"

# Create the PLINK installation directory
mkdir -p $PLINK_INSTALL_DIR

# Download and unzip the latest PLINK release
curl -L $PLINK_URL -o plink.zip
unzip plink.zip -d $PLINK_INSTALL_DIR

# Create the module file
mkdir -p /etc/modulefiles/plink
cat <<EOF > /etc/modulefiles/plink/${PLINK_VERSION}
#%Module
set plink_root ${PLINK_INSTALL_DIR}/plink
prepend-path PATH $plink_root
prepend-path LD_LIBRARY_PATH $plink_root
EOF