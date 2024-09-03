# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    configure.sh                                       :+:    :+:             #
#                                                      +:+                     #
#    By: cbijman <cbijman@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2023/11/13 16:12:30 by cbijman       #+#    #+#                  #
#    Updated: 2024/09/03 14:26:15 by cbijman       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null
    
    service mariadb start

    echo "CREATE USER \"$DB_USER\"@'%' IDENTIFIED BY \"$DB_PASS\";" | mysql
    echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO \"$DB_USER\"@'%' WITH GRANT OPTION;" | mysql
    echo "CREATE DATABASE $DB_NAME;" | mysql
    echo "FLUSH PRIVILEGES;" | mysql

    # Cleaning inception
    service mariadb stop

    echo "Successfully added $DB_USER to the database"
else
    echo "MariaDB was already installed"
fi

exec "$@"