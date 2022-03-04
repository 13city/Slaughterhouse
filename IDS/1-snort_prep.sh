#!/bin/bash
#Prep the OS
sudo apt-get update && sudo apt-get dist-upgrade -y && sudo apt -y autoremove

# Snort 3 dependencies
sudo apt install build-essential libpcap-dev libpcre3-dev libnet1-dev zlib1g-dev luajit hwloc libdnet-dev libdumbnet-dev bison flex liblzma-dev openssl libssl-dev pkg-config libhwloc-dev cmake cpputest libsqlite3-dev uuid-dev libcmocka-dev libnetfilter-queue-dev libmnl-dev autotools-dev libluajit-5.1-dev libunwind-dev

# Create working directory 
mkdir snort-source-files && cd snort-source-files

# Pull down and install LibDaQ
git clone https://github.com/snort3/libdaq.git && cd libdaq && ./bootstrap && ./configure && make && make install

# Pull down and install Tcmalloc
cd ../ && wget https://github.com/gperftools/gperftools/releases/download/gperftools-2.9/gperftools-2.9.tar.gz && tar xzf gperftools-2.9.tar.gz  && cd gperftools-2.9/ && ./configure && make && make install

echo "The prep script has completed..."
echo "Run the configuration script..."