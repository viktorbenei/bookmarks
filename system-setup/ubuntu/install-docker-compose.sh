#!/usr/bin/env bash

#
# Source: https://docs.docker.com/compose/install/
#

set -ex

export DOCKER_COMPOSE_VERSION='1.29.2'

sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# test
docker-compose --version
