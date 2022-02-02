#!/usr/bin/env bash
set -ex

THIS_SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

brew install git
brew install bitrise
brew install fish
brew install go
brew install --cask iterm2
brew install tree

# Setup oh-my-fish
if [ ! -d "$HOME/.local/share/omf" ] ; then
  curl -L https://get.oh-my.fish | fish
  fish -c 'omf install bobthefish'
fi

cp "${THIS_SCRIPTDIR}/../../configs/config.fish" ~/.config/fish/config.fish

brew tap homebrew/cask-fonts
brew install font-hack

echo '=== FINISHED [OK] ==='
