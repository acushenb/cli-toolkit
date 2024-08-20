#!/bin/bash

# Create the keys directory
mkdir -p /keys
cd /keys

cardano-cli node key-gen-KES \
    --verification-key-file kes.vkey \
    --signing-key-file kes.skey
echo "KES keys generated at location /keys"

cardano-cli node key-gen-VRF \
    --verification-key-file vrf.vkey \
    --signing-key-file vrf.skey
chmod 400 vrf.skey
echo "VRF keys generated at location /keys"

cardano-cli address key-gen \
    --verification-key-file payment.vkey \
    --signing-key-file payment.skey
echo "payment address keys generated at location /keys"

cardano-cli stake-address key-gen \
    --verification-key-file stake.vkey \
    --signing-key-file stake.skey
echo "stake address keys generated at location /keys"
