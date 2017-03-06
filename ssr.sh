#!/bin/ssr

yum -y install python-setuptools && easy_install pip

yum -y install git

yum -y install wget

yum -y groupinstall "Development Tools"

wget https://github.com/jedisct1/libsodium/releases/download/1.0.11/libsodium-1.0.11.tar.gz

tar xf libsodium-1.0.11.tar.gz && cd libsodium-1.0.11

./configure && make -j2 && make install

echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf

ldconfig

cd

git clone -b manyuser https://github.com/esdeathlove/shadowsocks.git

cd shadowsocks

yum -y install python-devel

yum -y install libffi-devel

yum -y install openssl-devel

pip install -r requirements.txt

cp apiconfig.py userapiconfig.py

cp config.json user-config.json

chmod +x *.sh 

cd

echo "* soft nofile 51200" >> /etc/security/limits.conf

echo "* hard nofile 51200" >> /etc/security/limits.conf

ulimit -n 51200

echo "fs.file-max = 51200" >> /etc/sysctl.conf

echo "net.core.rmem_max = 67108864" >> /etc/sysctl.conf

echo "net.core.wmem_max = 67108864" >> /etc/sysctl.conf

echo "net.core.netdev_max_backlog = 250000" >> /etc/sysctl.conf

echo "net.core.somaxconn = 4096" >> /etc/sysctl.conf

echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf

echo "net.ipv4.tcp_tw_reuse = 1" >> /etc/sysctl.conf

echo "net.ipv4.tcp_tw_recycle = 0" >> /etc/sysctl.conf

echo "net.ipv4.tcp_fin_timeout = 30" >> /etc/sysctl.conf

echo "net.ipv4.tcp_keepalive_time = 1200" >> /etc/sysctl.conf

echo "net.ipv4.ip_local_port_range = 10000 65000" >> /etc/sysctl.conf

echo "net.ipv4.tcp_max_syn_backlog = 8192" >> /etc/sysctl.conf

echo "net.ipv4.tcp_max_tw_buckets = 5000" >> /etc/sysctl.conf

echo "net.ipv4.tcp_fastopen = 3" >> /etc/sysctl.conf

echo "net.ipv4.tcp_rmem = 4096 87380 67108864" >> /etc/sysctl.conf

echo "net.ipv4.tcp_wmem = 4096 65536 67108864" >> /etc/sysctl.conf

echo "net.ipv4.tcp_mtu_probing = 1" >> /etc/sysctl.conf

sysctl -p

cd

rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm --quiet

yum install supervisor python-pip -y

pip install supervisor==3.1

chkconfig supervisord on

wget https://github.com/ccwy/ssshell-jar/raw/master/supervisord.conf -O /etc/supervisord.conf

wget https://github.com/ccwy/ssshell-jar/raw/master/supervisord -O /etc/init.d/supervisord


service supervisord start


service iptables stop

chkconfig iptables off

rpm -ivh http://soft.91yun.org/ISO/Linux/CentOS/kernel/kernel-firmware-2.6.32-504.3.3.el6.noarch.rpm

rpm -ivh http://soft.91yun.org/ISO/Linux/CentOS/kernel/kernel-2.6.32-504.3.3.el6.x86_64.rpm --force

rpm -qa | grep kernel



