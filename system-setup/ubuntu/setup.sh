#!/usr/bin/env bash
set -ex

THIS_SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export BITRISE_CLI_VERSION='1.48.0'

# Apt update and upgrade
sudo apt-get update
sudo apt-get upgrade -y

# Install Apt packages
sudo apt-get install -y \
  ca-certificates \
  vim htop curl git xclip tree \
  gnome-tweaks \
  exfat-fuse exfat-utils \
  fonts-hack \
  build-essential

# Snap packages
sudo snap install vlc
sudo snap install communitheme

# Fish
if [[ "$INSTALL_FISH" == "true" ]] ; then
  sudo apt-add-repository -y ppa:fish-shell/release-2
  sudo apt-get update
  sudo apt-get install -y fish
  # Make it the default shell
  if [[ "$SHELL" != "/usr/bin/fish" ]] ; then
    chsh -s /usr/bin/fish
  fi
  # Setup oh-my-fish
  if [ ! -d "$HOME/.local/share/omf" ] ; then
    curl -L https://get.oh-my.fish | fish
    fish -c 'omf install bobthefish'
  fi
fi

# Bitrise CLI
if ! [ -x "$(command -v bitrise)" ]; then
  echo "bitrise cli not installed - installing ..."
  curl https://gist.githubusercontent.com/viktorbenei/8900fefd8338559e4c4ccb34fbcfe37d/raw/install-bitrise-cli.sh | bash -s "${BITRISE_CLI_VERSION}"
else
  echo "bitrise cli already installed"
fi

# Install Go
if [[ "$INSTALL_GO" == "true" ]] ; then
  env GO_VERSION="1.15.2" bash "${THIS_SCRIPTDIR}/../install-go.sh"
fi

echo '=== FINISHED [OK] ==='
