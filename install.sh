#!/bin/bash
if ! command -v tar >/dev/null 2>&1; then
    printf "tar is not installed! Please install tar first!\n"
    exit
fi

tar -zxvf rinetd.tar.gz 

mkdir -p /usr/man/man8

cd rinetd && make && make install



if ! command -v rinetd >/dev/null 2>&1; then
    printf "rinetd install failed!\n"
    exit
else
    printf "rinetd install success!\n"
    exit
fi

