#!/bin/bash
#Raspberry Pi software for Limbeck Engineering's current project.


if (( $EUID != 0 )); then 
   echo "$(tput setaf 6)This must be run as root. Try 'sudo bash $0'.$(tput sgr0)" 
   exit 1 
fi

echo "$(tput setaf 6) This scripts will configure your Raspberry Pi for _________________________.$(tput sgr0)"

echo "$(tput setaf 6)Software currently compatible with RASPBIAN only.$(tput sgr0)"

read -p "$(tput bold ; tput setaf 2)Press [Enter] to begin, [Ctrl-C] to abort...$(tput sgr0)"

echo "$(tput setaf 6)Updating Raspbian Packages....$(tput sgr0)"
apt-get update -q -y

echo "$(tput setaf 6)Installing Java 7...$(tput sgr0)"
apt-get install openjdk-7-jre
apt-get install openjdk-7-jdk

echo "$(tput setaf 6)Installing the latest RXTX Libraries...$(tput sgr0)"
apt-get install librxtx-java


