#!/bin/bash

curl -H "Authorization: Bearer $AUTH_PAT" -Lo- "$AUTH_PROVISION" > /secure_provisioning.sh
chmod +x /secure_provisioning.sh && \
(set -o pipefail; /secure_provisioning.sh 2>&1 | tee -a /var/log/portal/secure_provisioning.log) && \
echo "Secure Provisioning complete!" | tee -a /var/log/portal/secure_provisioning.log
