#!/bin/bash

cd $HOME

echo -e "\e[32mStarting setup process..."
echo -e "\e[39m"
echo "Updating repos and dependencies..."
sudo apt-get -y update
sudo apt-get -y upgrade

# General utilities
echo "Installing general utilities..."
sudo apt-get -y install git git-core
git config --global color.ui true
sudo apt-get -y install libgnome-keyring-dev
sudo make --directory=/usr/share/doc/git/contrib/credential/gnome-keyring
git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring
sudo apt-get -y install curl
sudo apt-get -y install nodejs
sudo apt-get -y install libmagic-dev
sudo apt-get -y install ack-grep
sudo apt-get -y install openssh-server

# Media codecs
echo "Installing media codecs..."
sudo apt-get -y install ubuntu-restricted-extras

# Vim
echo "Installing Vim..."
sudo apt-get -y install vim vim-gtk
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# VLC and DVD support
echo "Installing VLC..."
sudo apt-get -y install vlc
sudo apt-get -y install libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg

# Ruby and RoR
# -- rbenv and Ruby
echo "Installing rbenv and Ruby..."
sudo apt-get remove ruby
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
exec $SHELL
rbenv install 2.7.4
rbenv global 2.7.4
echo "gem: --no-document" > ~/.gemrc
gem install bundler
# -- Ruby on Rails
echo "Installing Ruby on Rails..."
gem install rails
sudo apt-get -y install libpq-dev

# nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

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
rm .bashrc &> /tmp/set_up_log
rm .zshrc &> /tmp/set_up_log
rm .vimrc &> /tmp/set_up_log
# -- Download config files
echo "Downloading configuration files..."
wget https://raw.githubusercontent.com/lucashour/dotfiles/main/.bashrc
wget https://raw.githubusercontent.com/lucashour/dotfiles/main/.zshrc
wget https://raw.githubusercontent.com/lucashour/dotfiles/main/.vimrc

echo -e "\e[32mFinished!"
echo -e "\e[32mEnjoy! :D"
echo -e "\e[39m"
