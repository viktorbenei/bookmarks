#!/usr/bin/env bash

#
# Usage example: env GO_VERSION='1.13.5' ./system-setup/install-go.sh
#

set -ex

OS_ID=''
case "$OSTYPE" in
  darwin*)  OS_ID='darwin' ;;
  linux*)   OS_ID='linux' ;;
esac
if [ -z "$OS_ID" ]; then echo "Unsupported OS: $OSTYPE"; exit 1; fi

ARCH_ID=''
archs=`uname -m`
case "$archs" in
  x86_64)  ARCH_ID='amd64' ;;
esac

if [ -z "$GO_VERSION" ]; then echo "No GO_VERSION" specified ; exit 1; fi


go_version_tar_gz="go${GO_VERSION}.${OS_ID}-${ARCH_ID}.tar.gz"

# download
cd /tmp
curl -O "https://storage.googleapis.com/golang/${go_version_tar_gz}"

# uncompress
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "${go_version_tar_gz}"
