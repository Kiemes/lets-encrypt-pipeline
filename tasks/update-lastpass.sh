#!/usr/bin/env bash

echo "Full Chain"
cat letsencrypt/live/bosh-ci.cpi.sapcloud.io/fullchain.pem

echo "Private Key"
cat letsencrypt/live/bosh-ci.cpi.sapcloud.io/privkey.pem