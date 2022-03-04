#!/bin/bash
source config_nic
# Find the interface on which Snort is listening for network traffic and enable promiscuous mode to be able to see all the network traffic sent to it.
ip link set dev eh0 promisc on

# Verify with the following command.
ip add sh eth0

# Disable interface Offloading, orevents snort from truncating large packets, 
ethtool -k eth0 | grep receive-offload

# Disable
ethtool -K eth0 gro off lro off

# Check for config and create if not here
if [ -e $1 ]; then
  echo "File $1 already exists!"
else
  cp config_nic.sh /etc/systemd/system/snort3-nic.service
fi

# Reload systemd config settings
sudo systemctl daemon-reload

# Start and enable the servive on boot
sudo systemctl enable --now snort3-nic.service

# Verify service
sudo systemctl status snort3-nic.service