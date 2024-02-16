#!/bin/bash

# Enable printing of commands
set -x

# Disable Lid Switch
bash set-config.sh /etc/systemd/logind.conf HandleLidSwitch ignore

sudo apt-get update

# Install OMV-Extras
wget -O - https://github.com/OpenMediaVault-Plugin-Developers/packages/raw/master/install | bash
# Install FlashMemory Plugin
apt-get install openmediavault-flashmemory

sudo apt-get install lm-sensors
sudo sensors-detect

# Disable printing of commands
#set +x
