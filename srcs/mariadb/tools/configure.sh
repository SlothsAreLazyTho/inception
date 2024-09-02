# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    configure.sh                                       :+:    :+:             #
#                                                      +:+                     #
#    By: cbijman <cbijman@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2023/11/13 16:12:30 by cbijman       #+#    #+#                  #
#    Updated: 2023/11/13 16:12:31 by cbijman       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

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

    # Cleaning inception
    service mariadb stop
    rm -rf $SQL_FILE_NAME;
else
    echo "MariaDB was already installed"
fi

exec "$@"