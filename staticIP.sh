#!/bin/bash
#This file will be used to create a static IP.
#This is useful in the future because it will allow for .shh connection protocol 

if (( $EUID != 0 )); then 
   echo "This must be run as root. Try 'sudo bash $0'." 
   exit 1 
fi

