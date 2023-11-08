env | grep "DB"

# Wait till the database runs.


# Attempt to install wordpress!
if [ ! -f "/var/www/html/wp-config.php" ]; then
	wp --allow-root core download --path=/var/www/html
	wp --allow-root config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --dbcharset='utf8'
	wp --allow-root core install --url=$WP_DOMAIN:8080 --title=$WP_TITLE --admin_user=$WP_USER --admin_email=$WP_EMAIL --admin_password=$WP_PASS
else
	echo "Wordpress is installed!"
fi

# And done...
exec "$@"