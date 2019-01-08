#!/bin/bash

## dependencies at
## https://github.com/particle-iot/firmware/blob/develop/docs/dependencies.md#1-download-and-install-dependencies

sudo apt-get update

sudo apt-get install git
sudo apt-get install wget
sudo apt-get install node
sudo apt-get install npm

# grap the main particle firmware repository and put it in the present folder
git clone https://github.com/particle-iot/firmware.git


echo "Cloned the repository. Enter to continue"
echo "Next: install gcc-arm-embedded"
echo ""
##read

## goofy way to install gcc-arm older version that works with the firmware
wget https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q1-update/+download/gcc-arm-none-eabi-5_3-2016q1-20160330-linux.tar.bz2
bzip2 -d gcc-arm-none-eabi-5_3-2016q1-20160330-linux.tar.bz2
tar xf gcc-arm-none-eabi-5_3-2016q1-20160330-linux.tar

sudo mv gcc-arm-none-eabi-5_3-2016q1 /usr/gcc-arm

#just incase you have a 64 bit computer. This makes it like a 32 bit which is needed
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386




## Should make this more permanent, will need to run this path every time you open a terminal
export PATH=$PATH:/usr/gcc-arm/bin

arm-none-eabi-gcc --version
echo "enter to continue"
echo "Next: install dfu-util"
echo ""
##read


sudo apt-get install dfu-util

wget https://docs.particle.io/assets/files/50-particle.rules
sudo cp 50-particle.rules /etc/udev/rules.d/

dfu-util -V
echo "Enter to continue"
echo "next install libarchive-zip-perl"
echo ""
##read

sudo apt-get install libarchive-zip-perl

echo "Enter to continue"
echo "Next: install the particle client"
echo ""
##read


npm install -g particle-cli
particle --version
echo "Enter to continue"
echo "Next: Changing to firmware main folder and make all PLATFORM=argon"
echo ""
##read



echo "using git checkout v0.8.0-rc.27"

cd firmware     

## change this for higher versions
git checkout v0.8.0-rc.27 
git submodule update --init --recursive



cd main

make all PLATFORM=argon
