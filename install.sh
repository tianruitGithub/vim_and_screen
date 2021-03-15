#! /bin/sh
############################################
# ubantu2 安装开发环境脚本
############################################

## 1. 安装vim编辑环境
#sudo apt-get update
#sudo apt-get install git
#sudo apt-get install vim universal-ctags screen
#git clone git@github.com:tianruitGithub/ubantu20_env_install.git
#cp -r ubantu20_env_install/.vim  ~/
#cp ubantu20_env_install/.vimrc  ~/
#cp ubantu20_env_install/.screenrc  ~/
#
## 2. 安装基础组建
sudo apt-get install gnupg2 curl openssl autoconf bison build-essential libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev
#
## 3. 安装rvm，为ruby2.2.10的项目使用
sudo apt-get install software-properties-common
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm
sudo usermod -a -G rvm liuyang
rvm install 2.2.10
/bin/bash --login
rvm use rubyi-2.2.10 --default

# 4. 安装rbenv，为ruby2.5及以上项目使用

