#!/bin/bash

echo "Downloads file..."
cd ~
wget https://github.com/Xanprojects/apmrepo/raw/refs/heads/main/install/src/apmlinux
mv apmlinux /usr/local/bin/apm
echo "Success"
