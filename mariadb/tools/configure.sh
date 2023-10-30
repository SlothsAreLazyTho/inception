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
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
CREATE DATABASE $DB_NAME;
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

mysql < setup.sql

/etc/init.d/mariadb stop

exec "$@"