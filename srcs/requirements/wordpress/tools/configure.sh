# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    configure.sh                                       :+:    :+:             #
#                                                      +:+                     #
#    By: cbijman <cbijman@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2023/11/13 16:11:50 by cbijman       #+#    #+#                  #
#    Updated: 2024/09/03 14:26:33 by cbijman       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

# Wait till the database runs.

# Attempt to install wordpress!
if [ ! -f "/var/www/html/wp-config.php" ]; then
	echo "Installing wordpress from the $(whoami) user!"

	 until mysql -h $DB_HOST -u $DB_USER -p $DB_PASS -e "status" >/dev/null 2>&1; do
        echo "Waiting for MySQL to be ready..."
        sleep 5
    done

	wp --allow-root core download --path=/var/www/html
	wp --allow-root config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --dbcharset='utf8'
	wp --allow-root core install --url=$WP_DOMAIN --title=$WP_TITLE --admin_user=$WP_USER --admin_email=$WP_EMAIL --admin_password=$WP_PASS
else
	echo "Wordpress is installed!"
fi

# And done...
exec "$@"