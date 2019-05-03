#!/bin/bash
# HOWTO EC2 with docker
# t2.micro with ami-0080e4c5bc078760e
# open network, some key pair, 8 GB storage seems ok
# use this as userdata/init script
# 
yum install -y docker
if [ -e /etc/init.d/docker ]; then
    /etc/init.d/docker start
else
    systemctl start docker.service
fi
chmod o+rw /var/run/docker.sock
