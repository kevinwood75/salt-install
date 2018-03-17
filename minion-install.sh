#!/bin/bash

yum -y install https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm
yum clean expire-cache
yum -y install salt-minion
sed -e 's/#master: salt/master: saltmaster01.woodez.net/g' -i /etc/salt/minion
service salt-minion restart
