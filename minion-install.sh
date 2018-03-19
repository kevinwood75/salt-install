#!/bin/bash

if [[ $(uname -r | cut -d\. -f1) -eq 4 ]];then
    wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
    apt-get -y update
    apt-get -y install salt-minion
    sed -e 's/#master: salt/master: saltmaster01.woodez.net/g' -i /etc/salt/minion
    systemctl restart salt-minion
    exit 0
fi

yum -y install https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm
yum clean expire-cache
yum -y install salt-minion
sed -e 's/#master: salt/master: saltmaster01.woodez.net/g' -i /etc/salt/minion
service salt-minion restart
