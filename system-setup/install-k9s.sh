#!/usr/bin/env bash

#
# Usage example: env K9S_VERSION='0.9.3' ./system-setup/install-k9s.sh
#

set -ex

OS_ID=''
case "$OSTYPE" in
#   darwin*)  OS_ID='darwin' ;;
  linux*)   OS_ID='Linux' ;;
esac
if [ -z "$OS_ID" ]; then echo "Unsupported OS: $OSTYPE"; exit 1; fi

ARCH_ID=''
archs=`uname -m`
case "$archs" in
  x86_64)  ARCH_ID='x86_64' ;;
esac

if [ -z "$K9S_VERSION" ]; then echo "No K9S_VERSION" specified ; exit 1; fi

# download
cd /tmp
curl -fL -o /tmp/k9s.tar.gz "https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_${K9S_VERSION}_${OS_ID}_${ARCH_ID}.tar.gz"

# uncompress
mkdir -p /tmp/k9s-install
tar -C /tmp/k9s-install -xzf /tmp/k9s.tar.gz

# move binary to final path
sudo mv /tmp/k9s-install/k9s /usr/local/bin/k9s
