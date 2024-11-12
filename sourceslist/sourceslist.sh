#!/bin/bash

# 备份原有的 sources.list
cp /etc/apt/sources.list /etc/apt/sources.list_backup

# 替换 sources.list 文件
cp ./$1 /etc/apt/sources.list

# 检测发行版并执行相应的更新命令
if [ -f /etc/os-release ]; then
    . /etc/os-release
    case $ID in
        ubuntu|debian)
            echo "Updating $ID system..."
            apt update
            ;;
        centos|rhel)
            echo "Updating $ID system..."
            yum update -y
            ;;
        fedora)
            echo "Updating $ID system..."
            dnf update -y
            ;;
        arch)
            echo "Updating $ID system..."
            pacman -Syu
            ;;
        *)
            echo "Unsupported Linux distribution."
            ;;
    esac
else
    echo "Cannot detect the Linux distribution."
fi
