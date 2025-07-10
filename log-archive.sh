#!/bin/bash
INPUT=$1
if [ -z "$INPUT" ];then
	echo "no input was given"
	exit 0
fi
if [ -f "$INPUT" ]; then 
	echo "file exists"
else 
	echo "file does not exist"
	exit 0
fi
ls $INPUT
mkdir -p compressed
tar -cvzf compressed/$(date +%Y-%m-%d_%H-%M-%S).tar.gz "$INPUT"
ls compressed
