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
#开启转发
echo 'net.ipv4.ip_forward = 1' >> /etc/sysctl.d/99-sysctl.conf
sysctl -p

#配置文件
cat > /etc/rinetd.conf <<EOF
logfile /var/log/rinetd.log
logcommon
pidlogfile /var/run/rinetd.pid
EOF

#启动
rinetd -c /etc/rinetd.conf

#无间断重启
pkill -SIGHUP rinetd

#行首插入
#规则  bindaddress bindport connectaddress connectport
#sed  -i '1 i\{0.0.0.0 $port $destinationip $desinationport}' /etc/rinetd.conf
#如果开启了防火墙
#firewall-cmd --zone=public --add-port=${port}/tcp --permanent
#firewall-cmd --reload
