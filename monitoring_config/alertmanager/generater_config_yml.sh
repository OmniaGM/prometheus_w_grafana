#!/bin/bash

GMAIL_ACCOUNT=me@example.com # Substitute in your full gmail address here.
GMAIL_AUTH_TOKEN=XXXX        # Substitute in your app password

cat <<EOF > monitoring_config/alertmanager/config.yml
route:
  receiver: ops-team-email

receivers:
- name: ops-team-email
  email_configs:
  - to: $GMAIL_ACCOUNT
    from: $GMAIL_ACCOUNT
    smarthost: smtp.gmail.com:587
    auth_username: "$GMAIL_ACCOUNT"
    auth_identity: "$GMAIL_ACCOUNT"
    auth_password: "$GMAIL_AUTH_TOKEN"
EOF