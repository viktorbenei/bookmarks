#!/usr/bin/env bash
set -ex

sudo apt-get update
sudo apt-get upgrade -y

# Apt packages
sudo apt-get install -y \
  vim htop curl git xclip \
  gnome-tweaks \
  exfat-fuse exfat-utils

# Snap packages
sudo snap install \
  vlc keepassxc communitheme

# Fish
sudo apt-add-repository -y ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install -y fish
# Make it the default shell
if [[ "$SHELL" != "/usr/bin/fish" ]] ; then
  chsh -s /usr/bin/fish
fi
# Setup oh-my-fish
curl -L https://get.oh-my.fish | fish
fish -c 'omf install bobthefish'

# Bitrise CLI
if ! [ -x "$(command -v bitrise)" ]; then
  echo "bitrise cli not installed - installing ..."
  curl https://gist.githubusercontent.com/viktorbenei/8900fefd8338559e4c4ccb34fbcfe37d/raw/install-bitrise-cli.sh | bash -s 1.26.0
else
  echo "bitrise cli already installed"
fi

