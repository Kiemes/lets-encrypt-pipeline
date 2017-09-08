#!/usr/bin/env bash

set -e -x

echo 'Downloading certbot...'
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot