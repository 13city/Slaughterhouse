cd ../
git clone git://github.com/snortadmin/snort3.git
cd snort3/
./configure_cmake.sh --prefix=/usr/local --enable-tcmalloc

# Compile Snort 3
cd build
make 
make install

# Update shared libraries
sudo ldconfig

# Create symbolic links
sudo ln -s /usr/local/bin/snort /usr/sbin/snort

# Verify installation
snort -V

echo "Snort 3 installation has finished...Oink-Oink"
echo "Please run "