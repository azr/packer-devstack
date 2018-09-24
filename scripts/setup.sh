#!/bin/bash -x

set -e

git clone https://github.com/openstack-dev/devstack.git -b master

cd devstack/


######
# HOST_IP=10.0.2.15 
# HOST_IP=127.0.0.1
cat > local.conf <<EOF
[[local|localrc]]
FLOATING_RANGE=192.168.1.224/27
FIXED_RANGE=10.11.12.0/24
FIXED_NETWORK_SIZE=256
FLAT_INTERFACE=eth0
ADMIN_PASSWORD=supersecret
DATABASE_PASSWORD=iheartdatabases
RABBIT_PASSWORD=flopsymopsy
SERVICE_PASSWORD=iheartksl

EOF
# OFFLINE=True

./stack.sh
