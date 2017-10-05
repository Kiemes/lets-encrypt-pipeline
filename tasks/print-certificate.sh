#!/usr/bin/env bash

echo "Full Chain (containing cert & chain)"
cat letsencrypt/live/${CERTIFICATE_DOMAIN}/fullchain.pem

echo "Cert"
cat letsencrypt/live/${CERTIFICATE_DOMAIN}/cert.pem

echo "Chain"
cat letsencrypt/live/${CERTIFICATE_DOMAIN}/chain.pem

echo "Private Key"
cat letsencrypt/live/${CERTIFICATE_DOMAIN}/privkey.pem