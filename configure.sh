#!/bin/bash
#Raspberry Pi software for Limbeck Engineering's current project.


if (( $EUID != 0 )); then 
   echo "$(tput setaf 6)This must be run as root. Try 'sudo bash $0'.$(tput sgr0)" 
   exit 1 
fi

echo "$(tput setaf 6) This scripts will configure your Raspberry Pi for _________________________.$(tput sgr0)"

echo "$(tput setaf 6)Software currently compatible with RASPBIAN only.$(tput sgr0)"
echo "$(tput setaf 6)MUST be installed directly to /home/pi$(tput sgr0)"

read -p "$(tput bold ; tput setaf 2)Press [Enter] to begin, [Ctrl-C] to abort...$(tput sgr0)"

echo "$(tput setaf6)Creating directories needed in installation...$(tput sgr0)"
cd /home/pi
mkdir scripts
cd scripts
mkdir java

echo "$(tput setaf 6)Moving motorcontrol.sh into /home/pi/scripts $(tput sgr0)"
mv /home/pi/pi-software/software/motorcontrol.sh /home/pi/scripts
echo "$(tput setaf 6)Done.$(tput sgr0)"

echo "$(tput setaf 6)Moving Java exectutbles into /home/pi/scripts/java $(tput sgr0)"
mv /home/pi/pi-software/software/Init.jar /home/pi/scripts/java
mv /home/pi/pi-software/software/Server.jar /home/pi/scripts/java
mv /home/pi/pi-software/software/Razor.jar /home/pi/scripts/java
mv /home/pi/pi-software/software/ArduinoTemp.jar /home/pi/scripts/java
echo "$(tput setaf 6)Done.$(tput sgr0)"

echo "$(tput setaf 6)Updating Raspbian Packages....$(tput sgr0)"
apt-get update -q -y

echo "$(tput setaf 6)Installing Java 7...$(tput sgr0)"
apt-get install openjdk-7-jre
apt-get install openjdk-7-jdk

echo "$(tput setaf 6)Installing the latest RXTX Libraries...$(tput sgr0)"
apt-get install librxtx-java

echo "$(tput setaf 6)Moving files located in: RPiSerial...$(tput sgr0)"

cd RPiSerial
mv /home/pi/pi-software/RPiSerial/i686-unknown-linux-gnu /usr/lib/jvm/java-7-openjdk-common/jre/lib
mv /home/pi/pi-software/RPiSerial/RXTXcomm.jar /usr/lib/jvm/java-7-openjdk-common/jre/lib

echo "$(tput setaf 6)Serial communication software installed sucessfully.$(tput sgr0)"

echo "$(tput setaf 6)Downloading ServoBlaster (in /home/pi/PiBits)...$(tput sgr0)"
cd /home/pi
git clone git://github.com/richardghirst/PiBits.git

echo "$(tput setaf 6)Making the userspace version of ServoBlaster...$(tput sgr0)" 
cd /home/pi/PiBits/ServoBlaster/user
make 

echo "$(tput setaf 6)ServoBlaster sucessfully installed.$(tput sgr0)"


