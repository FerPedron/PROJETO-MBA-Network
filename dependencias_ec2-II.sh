


#!/bin/bash

sudo su -
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enabled httpd

echo "<h1>INSTANCIA-II</h1>" > /var/www/html/index.html

