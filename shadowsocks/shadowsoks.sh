#!/bin/bash

# 安装 Shadowsocks-libev
apt-get -y install shadowsocks-libev 

# 停止 Shadowsocks-libev 服务
systemctl stop shadowsocks-libev 

# 更新配置文件
scp ./config.json /etc/shadowsocks-libev/config.json 

# 启动 Shadowsocks-libev 服务
systemctl start shadowsocks-libev
systemctl status shadowsocks-libev
