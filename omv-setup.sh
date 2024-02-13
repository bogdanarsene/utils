#!/bin/bash

# Enable printing of commands
set -x

# Disable Lid Switch
bash set-config.sh /etc/systemd/logind.conf HandleLidSwitch ignore

# Install OMV-Extras
wget -O - https://github.com/OpenMediaVault-Plugin-Developers/packages/raw/master/install | bash
# Install FlashMemory Plugin
apt-get install openmediavault-flashmemory

# Disable printing of commands
#set +x
