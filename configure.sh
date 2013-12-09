#!/bin/bash
#Raspberry Pi software for Limbeck Engineering's current project.


if (( $EUID != 0 )); then 
   echo "$(tput setaf 6)This must be run as root. Try 'sudo bash $0'.$(tput sgr0)" 
   exit 1 
fi

