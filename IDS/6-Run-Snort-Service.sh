#!/bin/bash
# Create non-login system user
sudo useradd -r -s /usr/sbin/nologin -M -c SNORT_IDS snort

# Then, create a systemd service unit for Snort to be run as a snort user. Adjust and match to the network interface - Add 6.txt
sudo nano /etc/systemd/system/snort3.service

# Prep log permissions
sudo chmod -R 5775 /var/log/snort && sudo chown -R snort:snort /var/log/snort

# Start and enable Snort at boot
sudo systemctl enable --now snort3

# Check status
sudo systemctl status snort3