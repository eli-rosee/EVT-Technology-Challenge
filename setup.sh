#!/bin/bash

og_config_path=/etc/nginx/nginx.conf
new_config_path="$HOME/EVT/EVT-Technology-Challenge/nginx/server.conf"

echo $new_config_path
echo $og_config_path

echo -e "\nRunning apt update and installing nginx\n"

# Install nginx
# sudo apt update && sudo apt upgrade -y && sudo apt install nginx -y

echo

# Remove default config or existing symlink
if [[ -e "$OG_CONFIG_PATH" ]]; then
    sudo rm "$OG_CONFIG_PATH"
    echo -e "Removed original nginx config\n"
fi

# Create symlink to config in repo
if [[ ! -f "$new_config_path" ]]; then
    echo -e "ERROR: Config file not found at "$new_config_path"\n"
    exit 1
fi
 
sudo ln -s "$NEW_CONFIG_PATH" "$OG_CONFIG_PATH"
echo -e "Symlink created successfully!\n"

# Validate and restart
sudo nginx -t && sudo systemctl restart nginx
echo -e "Nginx setup complete!\n"
