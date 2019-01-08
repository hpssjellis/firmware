#!/bin/bash


## dependencies at
##https://github.com/particle-iot/firmware/blob/develop/docs/dependencies.md#1-download-and-install-dependencies

sudo apt-get update

sudo apt-get install git
sudo apt-get install wget
sudo apt-get install node
sudo apt-get install npm

# grap the main particle firmware repository
git clone https://github.com/particle-iot/firmware.git





echo "Cloned the repository. Enter to continue"
echo "Next: install gcc-arm-embedded"
read





##sudo add-apt-repository ppa:team-gcc-arm-embedded/ppa




##sudo apt-get install gcc-arm-embedded




wget https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q1-update/+download/gcc-arm-none-eabi-5_3-2016q1-20160330-linux.tar.bz2
bzip2 -d gcc-arm-none-eabi-5_3-2016q1-20160330-linux.tar.bz2
tar xf gcc-arm-none-eabi-5_3-2016q1-20160330-linux.tar

sudo mv gcc-arm-none-eabi-5_3-2016q1 /usr/gcc-arm


## Should make this more permanent.
export PATH=$PATH:/usr/gcc-arm/bin

arm-none-eabi-gcc --version
echo "enter to continue"
echo "Next: install dfu-util"
read





sudo apt-get install dfu-util

wget https://docs.particle.io/assets/files/50-particle.rules
sudo cp 50-particle.rules /etc/udev/rules.d/

dfu-util -V
echo "Enter to continue"
echo "next install libarchive-zip-perl"
read






sudo apt-get install libarchive-zip-perl


echo "Enter to continue"
echo "Next: install the particle client"
read



npm install -g particle-cli
particle --version
echo "Enter to continue"
echo "Next: Changing to firmware main folder and make clean"
read



echo "using git checkout v0.8.0-rc.27"


## change this for higher versions
git checkout v0.8.0-rc.27 
git submodule update --init


cd firmware

cd main

make all PLATFORM=argon
