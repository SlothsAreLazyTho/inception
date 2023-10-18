wp --allow-root core download --path=/var/www/html
wp --allow-root config create --dbname=wordpress --dbuser=wordpress --dbpass=wordpress --dbhost=database:3306 --dbcharset='utf-8' --dbcollate="utf8_general_ci"
wp --allow-root core install --url=localhost:8080 --title=Inception --admin_user=cbijman --admin_email=cbijman@student.codam.nl --admin_password=cbijman

exec "$@"