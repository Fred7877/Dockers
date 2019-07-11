#!/bin/bash
npm install
rm /run/apache2/apache2.pid
exec /usr/sbin/apache2ctl -D FOREGROUND
exec chmod -R 755 /var/www/html/codeIgniter
exec mysql -uroot -proot -e 'create database IF NOT EXISTS codeigniter CHARACTER SET utf8'
