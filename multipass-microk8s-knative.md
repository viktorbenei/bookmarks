#!/usr/bin/env bash
set -ex

# based on https://ubuntu.com/blog/getting-started-with-knative-1

# install multipass
# macOS:
brew cask install multipass

# create the base VM with multipass
multipass launch --mem 10G --cpus 2 --disk 20G --name knative

# install microk8s
multipass exec knative -- sudo snap install --classic microk8s
multipass exec knative -- sudo usermod -a -G microk8s multipass
multipass exec knative -- microk8s.status --wait-ready
multipass exec knative -- sudo snap alias microk8s.kubectl kubectl

# install knative
multipass exec knative -- bash -lc "echo 'N;' | microk8s.enable knative"
