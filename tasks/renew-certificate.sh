#!/usr/bin/env bash

set -e

: ${HOSTED_ZONE_ID:?}
: ${AWS_DEFAULT_REGION:?}
: ${AWS_ACCESS_KEY_ID:?}
: ${AWS_SECRET_ACCESS_KEY:?}
: ${CERTIFICATE_DOMAIN:?}

if [ -z $CERTBOT_DOMAIN ]; then
  mkdir -p $PWD/$CERTIFICATE_DOMAIN

  certbot certonly \
    --non-interactive \
    --manual \
    --manual-auth-hook $PWD/$0 \
    --preferred-challenge dns \
    --config-dir $PWD/$CERTIFICATE_DOMAIN \
    --work-dir $PWD/$CERTIFICATE_DOMAIN \
    --logs-dir $PWD/$CERTIFICATE_DOMAIN \
    --register-unsafely-without-email \
    --agree-tos \
    --domain $CERTIFICATE_DOMAIN \
    --manual-public-ip-logging-ok \
    --manual-cleanup-hook $PWD/$0 \

else
  [[ $CERTBOT_AUTH_OUTPUT ]] && ACTION="DELETE" || ACTION="UPSERT"

  echo "CERTBOT_AUTH_OUTPUT: $CERTBOT_AUTH_OUTPUT"
  echo "AWS_DEFAULT_REGION: $AWS_DEFAULT_REGION"
  echo "HOSTED_ZONE_ID: $HOSTED_ZONE_ID"
  echo "ACTION: $ACTION"
  echo "CERTBOT_DOMAIN: $CERTBOT_DOMAIN"
  echo "CERTBOT_VALIDATION: $CERTBOT_VALIDATION"
  aws route53 wait resource-record-sets-changed --id $(
    aws route53 change-resource-record-sets \
    --hosted-zone-id $HOSTED_ZONE_ID \
    --query ChangeInfo.Id --output text \
    --change-batch "{
      \"Changes\": [{
        \"Action\": \"$ACTION\",
        \"ResourceRecordSet\": {
          \"Name\": \"_acme-challenge.$CERTBOT_DOMAIN.\",
          \"ResourceRecords\": [{\"Value\": \"\\\"$CERTBOT_VALIDATION\\\"\"}],
          \"Type\": \"TXT\",
          \"TTL\": 30
        }
      }]
    }"
  )

  echo 1
fi