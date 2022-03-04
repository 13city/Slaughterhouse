#!/bin/bash
# Create non-login system user
sudo useradd -r -s /usr/sbin/nologin -M -c SNORT_IDS snort

# Then, create a systemd service unit for Snort to be run as a snort user. Adjust and match to the network interface
sudo nano /etc/systemd/system/snort3.service