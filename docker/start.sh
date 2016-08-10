#!/bin/bash
# /usr/local/bin/nfs-client
sleep 2
systemctl start nginx
/usr/sbin/in.tftpd -l --permissive /nbi
cd /bsdpy
git pull
./bsdpserver.py -p ${DOCKER_BSDPY_PATH} -i ${DOCKER_BSDPY_IFACE} -r ${DOCKER_BSDPY_PROTO} &
sleep 2
tail -f /var/log/bsdpserver.log
