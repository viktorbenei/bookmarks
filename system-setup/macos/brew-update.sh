#!/usr/bin/env bash
set -ex

brew prune
brew cleanup
brew update
brew outdated
brew upgrade

