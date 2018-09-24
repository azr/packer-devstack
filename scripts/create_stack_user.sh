#!/bin/sh -x

echo "Creating a group called $STACK_USER"
groupadd $STACK_USER

set -e

echo "Creating a user called $STACK_USER"
useradd -g $STACK_USER -s /bin/bash -b $STACK_HOME_DIR -m $STACK_USER


echo "Giving stack user passwordless sudo privileges"
# UEC images ``/etc/sudoers`` does not have a ``#includedir``, add one
grep -q "^#includedir.*/etc/sudoers.d" /etc/sudoers ||
    echo "#includedir /etc/sudoers.d" >> /etc/sudoers
( umask 226 && echo "$STACK_USER ALL=(ALL) NOPASSWD:ALL\nDefaults:stack !requiretty" \
    > /etc/sudoers.d/50_stack_sh )
