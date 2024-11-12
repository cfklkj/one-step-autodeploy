#!/bin/bash
# https://geth.ethereum.org/downloads  下载 geth

# 定义文件名和下载链接
DIR=$(cd $(dirname $0); pwd)
echo $DIR

FILENAME="geth-linux-amd64-1.14.11-f3c696fa"
FILE="$FILENAME.tar.gz"
URL="https://gethstore.blob.core.windows.net/builds/$FILE"

# 检查文件是否存在
if [ ! -f "$FILE" ]; then
    echo "$FILE 不存在，正在下载..."
    wget $URL
else
    echo "$FILE 已存在。"
fi

mkdir -p /root/btc && tar -xzvf $FILE -C /root/btc

# step2 
cp  ./json/genesis.json /root/btc/$FILE
scp  ./json/coinbase.json /root/btc/$FILE
scp  ./json/password.txt /root/btc/$FILE

# step 3  init
cd /root/btc/$FILENAME
chmod 777 geth
mkdir ./data
./geth --datadir ./data init ./genesis.json


# step 4 import user  default address is 0xc3b4a4e15ee551dd6c1ccb3bfb2a74a4e5dc33b7   # password is 123456 
./geth account import $DIR/data/prikey.txt  
# then replace coinbase.json 0xc3b4a4e15ee551dd6c1ccb3bfb2a74a4e5dc33b7 to you self address 

#step 5
./geth --datadir ./data init  ./coinbase.json

#step 6 start
./geth --datadir ./data --dev --dev.period 2 --http --http.api eth,web3,net --http.corsdomain "http://eth.youdomain.com" --password password.txt --http.addr 0.0.0.0 --http.port 2545 --http.vhosts="*"