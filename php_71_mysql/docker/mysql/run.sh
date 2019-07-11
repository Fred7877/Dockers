#!/bin/bash
exec mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'mysqldb'@'*' IDENTIFIED BY 'mysqldb'";
exec mysql -umysqldb -e 'create database IF NOT EXISTS codeigniter CHARACTER SET utf8';


exec mysql -uroot -e "FLUSH PRIVILEGES";
