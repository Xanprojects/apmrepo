#!/bin/bash

echo "Downloads file..."
cd ~
wget https://github.com/Xanprojects/apmrepo/raw/refs/heads/main/install/src/apmlinux > /dev/null 2>&1
mv apmlinux /usr/local/bin/apm
echo "Success"
