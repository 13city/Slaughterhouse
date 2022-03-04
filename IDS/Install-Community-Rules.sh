#!/bin/bash
# Create rules directory
mkdir /usr/local/etc/rules

# Pull down the rules
wget https://www.snort.org/downloads/community/snort3-community-rules.tar.gz

# Extract and copy to the rules folder
tar xzf snort3-community-rules.tar.gz -C /usr/local/etc/rules/