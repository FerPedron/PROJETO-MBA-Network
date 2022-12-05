


#!/bin/bash

sudo su -
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enabled httpd

echo "<h1>INSTANCIA 2 do load balancers</h1>" > /var/www/html/index.html

