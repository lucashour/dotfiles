#!/bin/bash

cd $HOME

echo -e "\e[32mStarting setup process..."
echo -e "\e[39m"
echo "Updating repos and dependencies..."
sudo apt-get -y upgrade
sudo apt-get -y update

# General utilities
echo "Installing general utilities..."
sudo apt-get -y install git git-core
sudo apt-get -y install git-flow
git config --global color.ui true
sudo apt-get -y install libgnome-keyring-dev
sudo make --directory=/usr/share/doc/git/contrib/credential/gnome-keyring
git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring
sudo apt-get -y install curl
sudo apt-get -y install nodejs
sudo apt-get -y install npm
sudo apt-get -y install libmagic-dev
sudo apt-get -y install ack-grep
sudo apt-get -y install openssh-server
sudo apt-get -y install speedcrunch
sudo add-apt-repository ppa:synapse-core/ppa
sudo apt-get update
sudo apt-get -y install synapse

# Media codecs
echo "Installing media codecs..."
sudo apt-get -y install ubuntu-restricted-extras

# Vim
echo "Installing Vim..."
sudo apt-get -y install vim vim-gtk

# Google Chrome
echo "Installing Google Chrome..."
sudo apt-get -y install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
sudo apt-get -yf install

# VLC
echo "Installing VLC..."
sudo apt-get -y install vlc

# Spotify
echo "Installing Spotify..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt-get -y install spotify-client

# Ruby and RoR
# -- rbenv and Ruby
echo "Installing rbenv and Ruby..."
sudo apt-get remove ruby
sudo apt-get -y install autoconf bison build-essential libssl-dev libyaml-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
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
sudo apt-get -y install apache2
sudo apache2ctl configtest
sudo systemctl restart apache2
# -- MySQL
echo "Installing MySQL..."
echo -e "\e[39m\n"
sudo apt-get -y install mysql-server mysql-client libmysqlclient-dev
sudo mysql_secure_installation
echo -e "\e[39m\n\n"
# -- PHP
echo "Installing PHP..."
sudo apt-get -y install php libapache2-mod-php php-mcrypt php-mysql
sudo bash -c "echo '<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>' > /etc/apache2/mods-enabled/dir.conf"
sudo systemctl restart apache2
sudo apt-get -y install php-cli

# Java
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt-get install oracle-java8-installer

echo -e "\e[32mInstallation finished! :D"
echo -e "\e[39m"
echo -e "\e[39mWait! Now we'll install the amazing Zsh, why not?"

#Zsh
echo -e "\e[39m"
echo "Installing Zsh..."
sudo apt-get -y install zsh
source ~/.zshrc
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

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
wget https://raw.githubusercontent.com/lucashour/dotfiles/master/.bashrc
wget https://raw.githubusercontent.com/lucashour/dotfiles/master/.zshrc
wget https://raw.githubusercontent.com/lucashour/dotfiles/master/.vimrc

echo -e "\e[32mFinished!"
echo -e "\e[32mEnjoy! :D"
echo -e "\e[39m"
