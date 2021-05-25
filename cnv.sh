#!/bin/bash
echo "Welcome to the Simple and Sweet CLI!"
apt -y update && apt -y upgrade 
apt-get -y install apache2
apt -y install php libapache2-mod-php
apt install -y php-curl php-xml php-common php-gd php-iconv php-imagick php-json
apt -y update
apt -y upgrade
apt -y install ffmpeg
apt -y install imagemagick
apt install yamdi
cd /tmp
wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
tar -zxvf ioncube_loaders_lin_x86*
cd ioncube/
sudo cp /tmp/ioncube/ioncube_loader_lin_7.4.so /usr/lib/php/20190902
echo "zend_extension = /usr/lib/php/20190902/ioncube_loader_lin_7.4.so" >> /etc/php/7.4/cli/php.ini
echo "zend_extension = /usr/lib/php/20190902/ioncube_loader_lin_7.4.so" >> /etc/php/7.4/apache2/php.ini
systemctl restart apache2
php -v
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw allow ssh
sudo ufw allow 22/tcp
sudo ufw allow 21/tcp
sudo ufw allow from 0.0.0.0
sudo ufw allow from 0.0.0.0
yes | sudo ufw enable
sudo systemctl status ufw.service
sudo ufw status
sudo apt install vsftpd
echo $'write_enable=YES\nascii_upload_enable=YES\nascii_download_enable=YES\nconnect_timeout=5000\nidle_session_timeout=5000\ndata_connection_timeout=5000' >> /etc/vsftpd.conf
systemctl restart vsftpd
systemctl status vsftpd
sudo adduser 000
