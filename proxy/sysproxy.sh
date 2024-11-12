#!/bin/bash

if [ "$1" != "" ]; then  
    cat ./$1 > /etc/profile.d/$1
    cat ./$1 > ~/.bashrc  #all terminal
    source /etc/profile.d/$1  #current terminal
fi

 curl http://ipinfo.io
