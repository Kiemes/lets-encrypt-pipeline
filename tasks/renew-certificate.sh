#!/usr/bin/env bash

set -e -x

echo 'Installing certbot...'
apt-get -y update
apt-get -y install software-properties-common
add-apt-repository -y ppa:certbot/certbot
apt-get -y update
echo "Europe/Berlin" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata
apt-get -y install certbot

certbot --help