#!/usr/bin/env bash

set -e -x

echo 'Downloading certbot...'
apt-get update
apt-get install software-properties-common
add-apt-repository ppa:certbot/certbot
apt-get update
apt-get install certbot