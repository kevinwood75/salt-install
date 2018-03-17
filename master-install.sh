#!/bin/bash

yum -y install https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm
yum clean expire-cache
yum -y install salt-master
yum -y install salt-ssh
yum -y install salt-cloud
yum -y install salt-api
sed -e 's/#interface: 0.0.0.0/interface: 0.0.0.0/g' -i /etc/salt/master
service salt-master restart
