#! /bin/sh
############################################
# develop environment install for ubantu20
############################################

# 1. update and install base plugins.
sudo apt-get update
sudo apt-get install autoconf bison build-essential libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev

# 2. install vim and screen for base use.
sudo apt-get install vim universal-ctags screen
git clone git@github.com:tianruitGithub/vim_screen.git
cp -r vim_screen/.vim  ~/
cp vim_screen/.vimrc  ~/
cp vim_screen/.screenrc  ~/

# 3. 安装ruby2.3.0，作为系统ruby
cd vim_screen
### 3.1 必须安装libssl1.0.0，否则ruby2.3.0安装不上
sudo dpkg -i libssl1.0.0_1.0.2n-1ubuntu5.6_amd64.deb
### 3.2 安装openssl
cd openssl-1.0.0s
sudo ./config -fPIC --prefix=/usr/local --openssldir=/usr/local/ssl shared
sudo make
sudo make install
which openssl
### 3.3 安装ruby2.3.0
cd ruby-2.3.0
./configure
sudo make
sudo make install
