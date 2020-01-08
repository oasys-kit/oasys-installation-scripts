#!/bin/bash

echo "Git command is missing! Installation requires sudo grants."

read -p "Update apt/yum? [y/N]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    apt-get update || yum update
fi

apt-get install git || yum install git
