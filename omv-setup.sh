#!/bin/bash

# Enable printing of commands
set -x

bash set-config.sh /etc/systemd/logind.conf HandleLidSwitch ignore

# Disable printing of commands
#set +x
