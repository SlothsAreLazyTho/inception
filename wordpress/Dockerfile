FROM debian:bookworm

# Start installing packages
RUN apt update -y
RUN apt install -y php8.2 php8.2-common php8.2-fpm php8.2-mysql php8.2-cgi php8.2-gd php8.2-xml mariadb-client wget curl

# Install Wordpress CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy needed files
COPY ./tools/configure.sh ./

# Set working directory
WORKDIR /var/www/html

# Configure users
RUN useradd -ms /bin/bash wordpress
RUN mkdir -p /var/www/html
RUN chown -R wordpress /var/www/html

# Set users and install wordpress
USER wordpress

# Change users
USER root

# Setup PHP
RUN echo "listen=9000" >> /etc/php/8.2/fpm/pool.d/www.conf
#RUN sed -i "s/user = www-data/user = wordpress/g" /etc/php/8.2/fpm/pool.d/www.conf
#RUN sed -i "s/group = www-data/user = wordpress/g" /etc/php/8.2/fpm/pool.d/www.conf

# Test part
RUN echo "<html><body>It works!</body></html>" > /var/www/html/index.html

EXPOSE 9000

ENTRYPOINT [ "sh", "/configure.sh" ]

CMD [ "php-fpm8.2", "-F" ]