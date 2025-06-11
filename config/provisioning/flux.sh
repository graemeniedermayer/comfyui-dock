#!/bin/bash

curl -H "$AUTH_PROV" -Lo- "$PROVISIONING_SCRIPT" > /secure_provisioning.sh
chmod +x /secure_provisioning.sh && \
(set -o pipefail; /secure_provisioning.sh 2>&1 | tee -a /var/log/portal/secure_provisioning.log) && \
touch /.provisioning_complete && \
echo "Secure Provisioning complete!" | tee -a /var/log/portal/secure_provisioning.log
