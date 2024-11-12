#!/bin/bash 
DIR=$(cd $(dirname $0); pwd)
echo $DIR
FILENAME="geth-linux-amd64-1.14.11-f3c696fa" 
cd /root/btc/$FILENAME
# step 4 import user  default address is 0xc3b4a4e15ee551dd6c1ccb3bfb2a74a4e5dc33b7   # password is 123456 
./geth account import $DIR/data/prikey.txt  
# then replace coinbase.json 0xc3b4a4e15ee551dd6c1ccb3bfb2a74a4e5dc33b7 to you self address 
./geth account list

 