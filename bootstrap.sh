#!/usr/bin/env bash

sudo rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm;
sudo yum install puppet-agent rubygems-devel -y
sudo gem install librarian-puppet
