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
    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql
    
    echo "Starting MySQL in safe mode without network"
    mysqld_safe --skip-networking &
    sleep 5

    # Insert query to the database
    mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
    mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;"
    mysql -e "CREATE DATABASE $DB_NAME;"
    mysql -e "FLUSH PRIVILEGES;"
    
    #Done so turn off the server and lets enable the container with networking now!
    mysqladmin --user=root shutdown
    echo "Successfully added $DB_USER to the database"
else
    echo "MariaDB was already installed"
fi

exec "$@"