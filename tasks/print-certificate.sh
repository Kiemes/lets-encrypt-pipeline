#!/usr/bin/env bash

echo "Full Chain"
cat letsencrypt/live/${CERTIFICATE_DOMAIN}/fullchain.pem

echo "Private Key"
cat letsencrypt/live/${CERTIFICATE_DOMAIN}/privkey.pem