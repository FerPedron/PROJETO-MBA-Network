


#!/bin/bash

sudo su -
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enabled httpd


