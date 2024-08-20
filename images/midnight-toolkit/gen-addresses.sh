#!/bin/bash
cd /keys

# Address Build
cardano-cli address build \
--payment-verification-key-file payment.vkey \
--stake-verification-key-file stake.vkey \
--testnet-magic 2 \
--out-file payment.addr
echo "payment.addr addresses generated at location /keys"


cardano-cli stake-address build \
--stake-verification-key-file stake.vkey \
--testnet-magic 2 \
--out-file stake.addr
echo "stake.addr generated at location /keys"
