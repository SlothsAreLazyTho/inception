# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: cbijman <cbijman@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2023/11/13 16:11:59 by cbijman       #+#    #+#                  #
#    Updated: 2023/11/13 16:12:01 by cbijman       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

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
RUN mkdir -p /var/www/html

# Setup PHP
RUN echo "listen=9000" >> /etc/php/8.2/fpm/pool.d/www.conf

# Expose the ports.
EXPOSE 9000

# Execute entry point as the minimal user.
CMD [ "sh", "/configure.sh" ]