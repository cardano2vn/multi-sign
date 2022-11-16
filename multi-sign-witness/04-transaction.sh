#!/bin/bash


. ./env

ADDRESS=$(cat ${ADDRESSES_PATH}/script.addr)
DSTADDRESS=$(cat /opt/cardano/cnode/priv/wallet/tada/payment.addr)

TRANS=$(cardano-cli query utxo ${CARDANO_NET_PREFIX} --address ${ADDRESS} | tail -n1)
UTXO=$(echo ${TRANS} | awk '{print $1}')
ID=$(echo ${TRANS} | awk '{print $2}')
TXIN=${UTXO}#${ID}

cardano-cli transaction build \
--babbage-era \
--tx-in ${TXIN} \
--tx-out ${DSTADDRESS}+200000000 \
--change-address ${ADDRESS} \
--tx-in-script-file ${POLICY_PATH}/policy.script \
--witness-override 3 \
--out-file tx.raw \
${CARDANO_NET_PREFIX}
