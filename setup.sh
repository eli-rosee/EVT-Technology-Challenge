#!/bin/bash

og_config_path=/etc/nginx/nginx.conf
new_config_path=$HOME/EVT/EVT-Technology-Challenge/nginx/test.conf

echo -e "\nRunning apt update and installing nginx\n"

# Install nginx
sudo apt update && sudo apt install nginx -y

echo

# Remove default config
if [[ -f $og_config_path ]]; then
    sudo rm $og_config_path
    echo -e "Removed original nginx config\n"
fi

# Symlink to config in repo
sudo ln -s $new_config_path $og_config_path

if [[ -L $og_config_path ]]; then
    echo -e "Symlink constructed correctly!\n"
fi
