'''
https://wiki.omv-extras.org/doku.php?id=omv7:new_user_guide
https://docs.openmediavault.org/en/latest/administration/general/notifications.html
https://forum.openmediavault.org/index.php?thread/14919-guide-use-telegram-as-notification-service/
'''


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

sudo apt install curl

# Disable printing of commands
#set +x
