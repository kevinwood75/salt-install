#!/bin/bash

# if [[ $(uname -r | cut -d\. -f1) -eq 4 ]];then
if [[ $(uname -s) = 'Darwin' ]];then
    wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
    apt-get -y update
    apt-get -y install salt-minion
    sed -e 's/#master: salt/master: saltmaster01.woodez.net/g' -i /etc/salt/minion
    systemctl restart salt-minion
    systemctl enable salt-minion
    exit 0
elif [[ $(cat /etc/redhat-release  | awk '{print $4}' | cut -d\. -f1) -eq 8 ]];then
    rpm --import https://repo.saltproject.io/py3/redhat/8/x86_64/latest/SALTSTACK-GPG-KEY.pub
    curl -fsSL https://repo.saltproject.io/py3/redhat/8/x86_64/latest.repo | sudo tee /etc/yum.repos.d/salt.repo
    yum clean expire-cache
    yum -y install salt-minion
    sed -e 's/#master: salt/master: saltmaster01.woodez.net/g' -i /etc/salt/minion
    systenctl restart salt-minion
    systemctl enable salt-minion
    exit 0
else
    rpm --import https://repo.saltproject.io/py3/redhat/7/x86_64/3001/SALTSTACK-GPG-KEY.pub
    curl -fsSL https://repo.saltproject.io/py3/redhat/7/x86_64/3001.repo | sudo tee /etc/yum.repos.d/salt.repo
    yum clean expire-cache
    yum -y install salt-minion
    sed -e 's/#master: salt/master: saltmaster01.woodez.net/g' -i /etc/salt/minion
    systenctl restart salt-minion
    systemctl enable salt-minion
fi
