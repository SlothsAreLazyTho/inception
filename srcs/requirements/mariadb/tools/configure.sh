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
    mysql_install_db --datadir=/var/lib/mysql --user=mysql
    
    service mariadb start

    sleep 5

    mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
    mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;"
    mysql -e "CREATE DATABASE $DB_NAME;"
    mysql -e "FLUSH PRIVILEGES;"

    service mariadb stop

    echo "Successfully added $DB_USER to the database"
else
    echo "MariaDB was already installed"
fi

exec "$@"