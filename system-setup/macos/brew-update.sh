#!/usr/bin/env bash
set -ex

brew cleanup
brew update
brew outdated
brew upgrade

