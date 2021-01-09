#! /bin/bash
echo "run user datat" >> /tmp/userdata.log
sudo apt-get update -y >> /tmp/userdata.log
sudo apt-get upgrade -y >> /tmp/userdata.log
mkdir /tmp/ssm
cd /tmp/ssm
wget https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb
sudo dpkg -i amazon-ssm-agent.deb /tmp/userdata.log
sudo systemctl enable amazon-ssm-agent /tmp/userdata.log

cat << 'EOS' >> /opt/bitnami/apps/wordpress/htdocs/.htaccess
<IfModule mod_rewrite.c>
RewriteEngine on
RewriteCond %{HTTPS} !=on [NC]
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R,L]
</IfModule>
EOS

sudo /opt/bitnami/ctlscript.sh restart apache

cp /opt/bitnami/apps/wordpress/htdocs/wp-config.php /opt/bitnami/apps/wordpress/htdocs/wp-config.php.back
sed -i "s/'WP_SITEURL', 'http:\/\/'/'WP_SITEURL', 'https:\/\/'/g"  /opt/bitnami/apps/wordpress/htdocs/wp-config.php
sed -i "s/'WP_HOME', 'http:\/\/' \. \$_SERVER\['HTTP_HOST'\] \. '\/');/'WP_HOME', 'https:\/\/' \. \$_SERVER\['HTTP_HOST'\] \. '\/');\ndefine('FORCE_SSL_ADMIN', true);\nif (strpos(\$_SERVER['HTTP_X_FORWARDED_PROTO'], 'https') !== false)\n   \$_SERVER['HTTPS']='on';/g"  /opt/bitnami/apps/wordpress/htdocs/wp-config.php
sudo /opt/bitnami/ctlscript.sh restart apache

--//