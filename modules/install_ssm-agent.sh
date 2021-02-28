#!/bin/bash
sleep 60
echo "timezone" >> /tmp/userdata.log
timedatectl set-timezone Asia/Tokyo
echo "update" >> /tmp/userdata.log
apt-get update >> /tmp/userdata.log 2>&1
echo "update" >> /tmp/userdata.log
apt-get upgrade -y >> /tmp/userdata.log 2>&1
echo "apache" >> /tmp/userdata.log
apt-get install apache2 -y >> /tmp/userdata.log 2>&1
echo "php" >> /tmp/userdata.log
apt-get install php7.4 php7.4-mysql -y >> /tmp/userdata.log 2>&1
apt-get install php7.4-gd -y >> /tmp/userdata.log 2>&1
apt-get install php7.4-curl -y >> /tmp/userdata.log 2>&1
apt-get install php7.4-dom -y >> /tmp/userdata.log 2>&1
apt-get install php7.4-mbstring -y >> /tmp/userdata.log 2>&1
apt-get install php7.4-imagick -y >> /tmp/userdata.log 2>&1
apt-get install php7.4-zip -y >> /tmp/userdata.log 2>&1
echo "mariadb" >> /tmp/userdata.log
apt-get install mariadb-server mariadb-client -y >> /tmp/userdata.log 2>&1
systemctl enable mariadb >> /tmp/userdata.log 2>&1
systemctl start mariadb >> /tmp/userdata.log 2>&1
cd /tmp
wget https://ja.wordpress.org/latest-ja.tar.gz >> /tmp/userdata.log 2>&1
tar xvf latest-ja.tar.gz >> /tmp/userdata.log
cp -rf wordpress/* /var/www/html
cd /var/www/html
rm index.html
chown -R www-data:www-data .
systemctl enable apache2
