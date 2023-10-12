#!/bin/bash

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

echo "CREATE USER 'wordpress' IDENTIFIED BY 'wordpress';" >> setup.sql
echo "CREATE DATABASE wordpress;" >> setup.sql
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress' WITH GRANT OPTION;" >> setup.sql
echo "FLUSH PRIVILEGES;" >> setup.sql

mysql < setup.sql