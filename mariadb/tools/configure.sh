#!/bin/sh

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

/etc/init.d/mariadb start

mysql_secure_installation << EOF

Y
n
Y
Y
Y
Y
EOF

cat << EOF > setup.sql
CREATE USER 'wordpress' IDENTIFIED BY 'wordpress';
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

mysql

/etc/init.d/mariadb stop

exec "$@"