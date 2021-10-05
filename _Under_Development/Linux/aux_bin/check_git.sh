#!/bin/bash

echo "Git command is missing! Installation requires sudo grants."

read -p "Update apt/yum? (y/[N])" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt-get update || sudo yum update
fi

sudo apt-get install git || sudo yum install git
