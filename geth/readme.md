创建ether私有测试节点

赋予权限
chmod 777 geths.sh

配置和启动
./geths.sh
 

附：
gethAccount 与 geths 里 step 4 功能相同 可设置成你的私钥地址


测试：
cd /root/btc/geth-linux-amd64-1.14.11-f3c696fa
./geth  attach http://127.0.0.1:2545

[链id
    >eth.chainId()
]

[获取交易状态
    >eth.getTransaction("0x22013bea5f4b034839ee8b9b86536c7b3a51041f466bf02e9664cee84938dd32")
]


---------------高级配置：nginx 代理 rpc url:
./geth --datadir ./data --dev --dev.period 2 --http --http.api eth,web3,net --http.corsdomain "http://eth.youdomian.com" --password password.txt --http.port 2545 --http.vhosts="*"
[ nginx  代理 rpc  
    cp ./data/eth.nginx.conf /etc/nginx/sites-available
    cp ./data/www.nginx.conf /etc/nginx/sites-available
    ln -s /etc/nginx/sites-available/eth.nginx.conf /etc/nginx/sites-enabled/
    ln -s /etc/nginx/sites-available/www.nginx.conf /etc/nginx/sites-enabled/   
    nginx -t
    nginx -s reload

    [ 获取ssl证书        
        sudo apt-get install certbot
        sudo certbot certonly --standalone -d eth.youdomain.com
    ]
    
    ./geth attach https://eth.youdomain.com/v1/
]

