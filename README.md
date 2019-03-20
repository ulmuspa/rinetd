### 端口转发神器 Rinetd

---

- 内网转发使用iptables。
- 外网转发使用Rinetd。



#### 安装

```shell
git clone https://github.com/ulmuspa/rinetd.git
cd rinetd
chmod +x install.sh
./install.sh
```

#### 配置

```shell
#配置文件
/etc/rinetd.conf
#二进制
/usr/sbin/rinetd
#配置
vim /etc/rinetd.conf

#[Source Address] [Source Port] [Destination Address] [Destination Port]
0.0.0.0 3306 192.168.1.77 3306
logfile /var/log/rinetd.log
#保存退出
```

#### 启动

```shell
#关闭进程
pkill rinetd
#启动进程
rinetd -c /etc/rinetd.conf
#无间断重启
pkill -SIGHUP rinetd
#查看是否成功
netstat -tanulp|grep rinetd
#开机自启动
vim /etc/rc.d/rc.local
#写入
/usr/sbin/rinetd -c /etc/rinetd.conf
```

