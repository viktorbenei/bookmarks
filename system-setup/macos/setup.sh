#!/usr/bin/env bash
set -ex

THIS_SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

brew install git
brew install bitrise
brew install fish
brew install go
brew install --cask iterm2
brew install tree
brew install colima

# Setup oh-my-fish
if [ ! -d "$HOME/.local/share/omf" ] ; then
  curl -L https://get.oh-my.fish | fish
  fish -c 'omf install bobthefish'
fi


cd "${THIS_SCRIPTDIR}/../../configs"
rm -f "$HOME/.config/fish/config.fish"
ln -s "$(pwd)/mac.config.fish" "$HOME/.config/fish/config.fish"
cd -

brew tap homebrew/cask-fonts
brew install font-hack

echo '=== FINISHED [OK] ==='
