#!/bin/bash

cd $HOME

echo -e "\e[32mStarting setup process..."
echo -e "\e[33mYou can tail '/tmp/set_up_log' in order to follow the installation process."
echo -e "\e[39m"
echo "Updating repos and dependencies..."
sudo apt-get -y upgrade &> /tmp/set_up_log
sudo apt-get -y update &> /tmp/set_up_log

# General utilities
echo "Installing general utilities..."
sudo apt-get -y install git git-core &> /tmp/set_up_log
sudo apt-get -y install git-flow &> /tmp/set_up_log
git config --global color.ui true
sudo apt-get -y install curl &> /tmp/set_up_log
sudo apt-get -y install wget &> /tmp/set_up_log
sudo apt-get -y install nodejs &> /tmp/set_up_log
sudo apt-get -y install npm &> /tmp/set_up_log
sudo apt-get -y install libmagic-dev &> /tmp/set_up_log
sudo apt-get -y install ack-grep &> /tmp/set_up_log
sudo apt-get -y install openssh-server &> /tmp/set_up_log

# Media codecs
echo "Installing media codecs..."
sudo apt-get -y install ubuntu-restricted-extras

# Vim
echo "Installing Vim..."
sudo apt-get -y install vim vim-gtk &> /tmp/set_up_log

# Google Chrome
echo "Installing Google Chrome..."
sudo apt-get -y install libxss1 libappindicator1 libindicator7 &> /tmp/set_up_log
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &> /tmp/set_up_log
sudo dpkg -i google-chrome*.deb &> /tmp/set_up_log
sudo apt-get -yf install &> /tmp/set_up_log

# VLC
echo "Installing VLC..."
sudo apt-get -y install vlc &> /tmp/set_up_log

# Spotify
echo "Installing Spotify..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 &> /tmp/set_up_log
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list &> /tmp/set_up_log
sudo apt update &> /tmp/set_up_log
sudo apt-get -y install spotify-client &> /tmp/set_up_log

# Ruby and RoR
# -- rbenv and Ruby
echo "Installing rbenv and Ruby..."
sudo apt-get -y install autoconf bison build-essential libssl-dev libyaml-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev &> /tmp/set_up_log
git clone https://github.com/rbenv/rbenv.git ~/.rbenv &> /tmp/set_up_log
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build &> /tmp/set_up_log
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
rbenv install 2.3.0
rbenv global 2.3.0
echo "gem: --no-document" > ~/.gemrc
gem install bundler
# -- Ruby on Rails
echo "Installing Ruby on Rails..."
gem install rails


# LAMP
# -- Apache2
echo "Installing Apache2..."
sudo apt-get -y install apache2 &> /tmp/set_up_log
sudo apache2ctl configtest &> /tmp/set_up_log
sudo systemctl restart apache2 &> /tmp/set_up_log
# -- MySQL
echo "Installing MySQL..."
echo -e "\e[39m\n"
sudo apt-get -y install mysql-server mysql-client libmysqlclient-dev
sudo mysql_secure_installation
echo -e "\e[39m\n\n"
# -- PHP
echo "Installing PHP..."
sudo apt-get -y install php libapache2-mod-php php-mcrypt php-mysql &> /tmp/set_up_log
sudo bash -c "echo '<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>' > /etc/apache2/mods-enabled/dir.conf"
sudo systemctl restart apache2 &> /tmp/set_up_log
sudo apt-get -y install php-cli &> /tmp/set_up_log

echo -e "\e[32mInstallation finished! :D"
echo -e "\e[39m"
echo -e "\e[39mWait! Now we'll install the amazing Zsh, why not?"

#Zsh
echo -e "\e[39m"
echo "Installing Zsh..."
sudo apt-get -y install zsh &> /tmp/set_up_log
source ~/.zshrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo -e "\e[39m"
echo -e "\e[32mInstallation finished! Wait just a moment..."
echo -e "\e[39m"

# Post-installation tasks
# -- Remove useless files
echo "Removing temporal files..."
rm google-chrome*.deb
rm /tmp/set_up_log
rm .bashrc &> /tmp/set_up_log
rm .zshrc &> /tmp/set_up_log
rm .vimrc &> /tmp/set_up_log
# -- Download config files
echo "Downloading configuration files..."
wget https://raw.githubusercontent.com/lucashour/dotfiles/master/.bashrc &> /tmp/set_up_log
wget https://raw.githubusercontent.com/lucashour/dotfiles/master/.zshrc &> /tmp/set_up_log
wget https://raw.githubusercontent.com/lucashour/dotfiles/master/.vimrc &> /tmp/set_up_log

echo -e "\e[32mFinished!"
echo -e "\e[32mEnjoy! :D"
echo -e "\e[39m"
