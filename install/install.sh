#!/bin/bsah

if [ "$(id -u)" -ne 0 ]; then
    echo "❌ ERROR: This script requires superuser (root) privileges."
    echo "Please run it using 'sudo'."
    exit 1
fi

echo "Check OS..."

OS_NAME=$(uname -s)
OS_VERSION=$(uname -r)
URL="https://raw.githubusercontent.com/Xanprojects/apmrepo/refs/heads/main/install"
if [[ "$OS_NAME" == "Linux" ]]; then
	echo "This is a Linux-based OS."
	echo "Kernel version: $OS_VERSION"
	OS=Linux
elif [[ "$OS_NAME" == "Darwin" ]]; then
	echo "This is macOS."
	echo "Version: $OS_VERSION"
	OS=Darwin
else
	echo "This is an unknown OS."
	echo "OS Name: $OS_NAME"
	echo "Kernel version: $OS_VERSION"
	exit 1
fi

if [[ "$OS_NAME" == "Linux" ]]; then
    if [ -f /etc/os-release ]; then
	. /etc/os-release
	echo "OS: $NAME"
	echo "Version: $VERSION"
    else
	echo "Could not find /etc/os-release to determine distribution."
    fi
fi

echo "clean ..."
rm -rf ./installforLinux.sh
rm -rf ./installforDarwin.sh

if [[ "$OS" == "Linux" ]]; then
	cd ~
	echo "download..."
	wget "$URL/installforLinux.sh" > /dev/null 2>&1
	sh installforLinux.sh
elif [[ "$OS" == "Darwin" ]]; then
	cd ~
	echo "download..."
	wget "$URL/installforDarwin.sh" > /dev/null 2>&1
	sh installforDarwin.sh
fi
