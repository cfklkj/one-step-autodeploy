# https://golang.google.cn/dl/
FILENAME=go1.23.3.linux-amd64

#避免 存在的 冲突
rm /usr/bin/go 
if [ ! -f "$FILE" ]; then
    echo "$FILE 不存在，正在下载..."
    wget https://golang.google.cn/dl/$FILENAME.tar.gz

    #配置环境变量
    echo export PATH=$PATH:/usr/local/go/bin >> ~/.profile
    source ~/.profile
else
    echo "$FILE 已存在。"
fi

rm -rf /usr/local/go
tar -C /usr/local -xzf $FILENAME.tar.gz

go version
