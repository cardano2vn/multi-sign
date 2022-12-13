# ./*.sh payment.skey tx.raw

# Trước khi chạy copy file tx.raw mới đã tạo giao dịch vào thư mục gốc

#CARDANO_NET_PREFIX="--mainnet"
CARDANO_NET_PREFIX="--testnet-magic 1"

#=== Ký(sign) giao dịch============
./cardano-cli transaction sign \ 
--signing-key-file $1 \
--tx-body-file $2 \
--out-file payment-0.witness \
${CARDANO_NET_PREFIX}
