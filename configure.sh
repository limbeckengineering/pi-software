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







