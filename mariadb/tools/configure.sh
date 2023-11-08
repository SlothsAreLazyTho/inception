#!/bin/sh

SQL_FILE_NAME="setup.sql"

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null
    service mariadb start

    echo "CREATE USER \"$DB_USER\"@'%' IDENTIFIED BY \"$DB_PASS\";" >> $SQL_FILE_NAME
    echo "CREATE DATABASE $DB_NAME;" >> $SQL_FILE_NAME
    echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO \"$DB_USER\"@'%' WITH GRANT OPTION;" >> $SQL_FILE_NAME
    echo "FLUSH PRIVILEGES;" >> $SQL_FILE_NAME

    mysql < setup.sql
    echo "Successfully added $DB_USER to the database"
    service mariadb stop

    # Cleaning inception
    rm -rf $SQL_FILE_NAME;
else
    echo "MariaDB was already installed"
fi

exec "$@"