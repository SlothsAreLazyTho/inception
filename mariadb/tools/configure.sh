#!/bin/sh

SQL_FILE_NAME="setup.sql"
END_KEYWORD=EOF

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null
	service mariadb start

	cat << $END_KEYWORD > $SQL_FILE_NAME
		CREATE USER "$DB_USER"@'%' IDENTIFIED BY "$DB_PASS";
		CREATE DATABASE $DB_NAME;
		GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;
		FLUSH PRIVILEGES;
	$END_KEYWORD

	mysql < setup.sql

	echo "Successfully added $DB_USER to the database"
	service mariadb stop

	# Cleaning inception
	rm -rf $SQL_FILE_NAME;
else
	echo "MariaDB was already installed"
end

exec "$@"