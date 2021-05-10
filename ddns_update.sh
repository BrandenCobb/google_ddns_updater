#!/bin/bash

### Run with cronjob every 5min:
### */5 * * * * /usr/local/bin/ddns_update.sh
###
### Google Domains provides an API to update a DNS "Syntheitc record". This script
### updates a record with the script-runner's public IP, as resolved using a DNS
### lookup.
###
### Google Dynamic DNS: https://support.google.com/domains/answer/6147083
### Synthetic Records: https://support.google.com/domains/answer/6069273

USERNAME=""
PASSWORD=""
HOSTNAME="example.com"
IP_CACHE_FILE="/var/cache/ddns_update/current_ip"

# Create directory if it doesn't exist
if [[ ! -d $(dirname $IP_CACHE_FILE) ]]; then
  mkdir -p $(dirname $IP_CACHE_FILE)
fi

OLD_IP=$(cat $IP_CACHE_FILE)
# Resolve current public IP
IP=$(curl -s "https://domains.google.com/checkip")
if [[ "$IP" != "$OLD_IP" ]]; then
  # Update Google DNS Record
  URL="https://${USERNAME}:${PASSWORD}@domains.google.com/nic/update?hostname=${HOSTNAME}&myip=${IP}"
  curl -s $URL
  # Update IP file
  echo $IP > $IP_CACHE_FILE
  echo "IP changed to: $IP"
else
  echo "No change current IP is: $IP"
fi
