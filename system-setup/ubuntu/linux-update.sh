#!/bin/bash
set -ex

# remove previous
sudo apt-get autoremove -y

# do update
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y
