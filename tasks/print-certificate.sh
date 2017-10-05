#!/usr/bin/env bash

echo "Full Chain"
cat ${CERTIFICATE_DOMAIN}/live/${CERTIFICATE_DOMAIN}/fullchain.pem

echo "Private Key"
cat ${CERTIFICATE_DOMAIN}/live/${CERTIFICATE_DOMAIN}/privkey.pem