#!/usr/bin/env bash

set -e -x

echo 'Installing certbot...'
apt-get -y update
apt-get -y install software-properties-common
add-apt-repository ppa:certbot/certbot
apt-get -y update
apt-get -y install certbot