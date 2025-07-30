#!/bin/bash


##################################################
# Author : Adrin Noronha
# Date   : 29/07/2025
#
# Version : V1
#
set -x
set -e
set -o pipefail
df -h 
free -m 
nproc
ps -elf | grep "amazon" | awk '{print $4}'


