#!/bin/bash
#
#    _ _  _    ___  _  _   
#   / | || |  / _ \| || |  
#   | | || |_| | | | || |_ 
#   | |__   _| |_| |__   _|
#   |_|  |_|(_)___/   |_|  
#                          

# Enable shell debugging.
# set -x

# Echo Paths to shell profiles
# echo "[[ -s "/usr/local/rvm/bin/rvm" ]] && . "/usr/local/rvm/bin/rvm"" >> ~/.bash_profile # This loads RVM into a shell session.
echo 'Available Rubies'
rvm list

echo 'Set Default to 2.1.2'
rvm alias create default 2.1.2
source /etc/profile.d/rvm.sh
# Add login user to rvm group
sudo usermod -a -G rvm vagrant
echo 'Checking RVM is a function'
type rvm | head -n 1

echo 'check gemdir'
rvm gemdir

# Install Node and NPM
echo 'Installing Node & NPM'
sudo apt-get install --yes nodejs
sudo apt-get install --yes nodejs-dev
sudo apt-get install --yes npm

# Install n
echo 'Installing n'
npm config set registry http://registry.npmjs.org/
sudo npm install -g n
sudo n stable

echo 'Installing Bower & Grunt'
npm install -g bower grunt-cli

echo 'Installing Foundation 5'
gem install foundation

echo 'Installing compass'
gem install compass

echo 'Installing Bazaar'
sudo apt-get install --yes bzr

echo 'Bower Version Check'
bower -v
echo 'Gem Version Check'
gem -v
echo 'Ruby Version Check'
ruby -v
#echo 'Foundation Version Check - returns Compass version'
#foundation version
echo 'RVM Version Check'
rvm -v
echo 'n Version Check'
n -V
echo 'Node Version Check'
node -v
echo 'NPM Version Check'
npm -v