yum update && \
    yum install -y icu-devtools && \
    yum install -y git && \
    yum install -y python3.9 && \
    yum install -y python3-pip

pip install --upgrade pip

cd ~/ && git clone https://github.com/dvitale199/GenoTools.git
cd ~/GenoTools && \
    pip install . && \
    pip install -r requirements.txt

ln -s ~/GenoTools/executables/iaap-cli-linux-x64-1.1.0-sha.80d7e5b3d9c1fdfc2e99b472a90652fd3848bbc7/iaap-cli/iaap-cli /bin/iaap-cli