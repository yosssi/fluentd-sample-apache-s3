#!/bin/bash

# Increase the max number of file descriptors.
sudo echo "root soft nofile 65536" >> /etc/security/limits.conf
sudo echo "root hard nofile 65536" >> /etc/security/limits.conf
sudo echo "* soft nofile 65536" >> /etc/security/limits.conf
sudo echo "* hard nofile 65536" >> /etc/security/limits.conf

# Optimize network kernel parameters.
sudo echo "net.ipv4.tcp_tw_recycle = 1" >> /etc/sysctl.conf
sudo echo "net.ipv4.tcp_tw_reuse = 1" >> /etc/sysctl.conf
sudo echo "net.ipv4.ip_local_port_range = 10240    65535" >> /etc/sysctl.conf

# Install td-agent.
curl -L http://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh

# Install Apache.
sudo apt-get update
sudo apt-get -y install apache2
