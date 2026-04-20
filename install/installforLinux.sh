#!/bin/bash

echo "Downloads file..."
cd ~
wget https://github.com/Xanprojects/apmrepo/raw/refs/heads/main/install/src/apmlinux --quiet
mv apmlinux /usr/local/bin/apm
sudo chmod +x /usr/local/bin/apm
echo "Success"
