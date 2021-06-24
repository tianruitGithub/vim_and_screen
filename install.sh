#! /bin/bash
########################################################
#              ubantu20 安装开发环境脚本
########################################################

echo "**************install options********************"
echo "**   1.  install base plugins                  **"
echo "**   2.  install vim and screen for edit       **"
echo "**   3.  install rvm for system ruby 2.2.10    **"
echo "**   4.  install rbenv                         **"
echo "**   5.  install mysql5.7                      **"
echo "**   6.  install redis                         **"
echo "**   10. install jdk                           **"
echo "**   0.  install all                           **"
echo "*************************************************"

################## define function #####################
install_base_plugins() {
  echo ">>> start install base plugins "
  sudo apt-get update
  sudo apt-get install git nodejs wget curl openssl autoconf bison build-essential libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev
  echo ">>> end install base plugins "
}

install_vim_screen() {
  echo ">>> start install vim and screen"
  sudo apt-get install vim universal-ctags screen
  cd ~
  git clone git@github.com:tianruitGithub/ubantu20_env_install.git
  cp -r ubantu20_env_install/.vim  ~/
  cp ubantu20_env_install/.vimrc  ~/
  cp ubantu20_env_install/.screenrc  ~/
  echo ">>> end install vim and screen"
}

install_rvm() {
  echo ">>> start install rvm"
  sudo apt-get install software-properties-common
  sudo apt-add-repository -y ppa:rael-gc/rvm
  sudo apt-get update
  sudo apt-get install rvm
  sudo usermod -a -G rvm liuyang
  echo ">>> fisrt times install finished, need reboot"
  rvm install 2.2.10
  /bin/bash --login
  rvm use ruby-2.2.10 --default
  ruby -v
  echo ">>> end install rvm"
}

install_rbenv() {
  echo ">>> start install rbenv"
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  exec $SHELL
  echo ">>> end install rbenv"
}

install_mysql() {
  echo ">>> start install mysql5.7"
  cd ~/ubantu20_env_install
  sudo apt install libmysqlclient-dev
  wget https://repo.mysql.com//mysql-apt-config_0.8.1-1_all.deb
  sudo dpkg -i mysql-apt-config_0.8.1-1_all.deb
  sudo apt update 
  sudo apt-get install mysql-server
  sudo apt install mysql-workbench-community
  echo ">>> end install mysql5.7"
}

install_redis() {
  echo ">>> start install redis"
  sudo apt install redis-server
  echo ">>> end install redis"
}

install_jdk() {
  echo ">>> start install jdk"
  sudo apt-get install openjdk-14-jdk 
  ecoh java --version
  echo ">>> end install jdk"
}

############### select install option ##################
echo -n "Enter install number:"
read number

if (( $number == 1 )); then
  install_base_plugins
elif (( $number == 2 )); then
  install_vim_screen
elif (( $number == 3 )); then
  install_rvm
elif (( $number == 4 )); then
  install_rbenv
elif (( $number == 5 )); then
  install_mysql
elif (( $number == 6 )); then
  install_redis
elif (( $number == 10 )); then
  install_jdk
elif (( $number == 0 )); then
  install_base_plugins
  install_rvm
  install_vim_screen
  install_rbenv
  install_mysql
  install_redis
  install_jdk
else
  echo "error number"
fi

exit 0
