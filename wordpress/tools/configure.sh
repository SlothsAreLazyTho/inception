env | grep "DB"

# Wait till the database runs.


# Attempt to install wordpress!
if [ ! -f "/var/www/html/wp-config.php"]; then
	wp --allow-root core download --path=/var/www/html
	wp --allow-root config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --dbcharset='utf-8' --dbcollate="utf8_general_ci"
	wp --allow-root core install --url=localhost:8080 --title=Inception --admin_user=cbijman --admin_email=cbijman@student.codam.nl --admin_password=cbijman
else
	echo "Wordpress is installed!"
end

# And done...
exec "$@"