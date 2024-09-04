# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: cbijman <cbijman@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2023/11/13 16:12:15 by cbijman       #+#    #+#                  #
#    Updated: 2024/09/03 14:01:43 by cbijman       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:bookworm

# Install packages
RUN apt-get update -y
RUN apt-get install -y nginx openssl

# Do some copying.
WORKDIR /etc/nginx
COPY ./conf/wordpress.conf ./sites-enabled/wordpress.conf

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
				-out /etc/nginx/ssl/cbijman.42.fr.crt \
				-keyout /etc/nginx/ssl/cbijman.42.fr.key \
				-subj "/C=NL/ST=North-Holland/L=Amsterdam/O=Codam/OU=cbijman/CN=cbijman/"

## Copy SSL Keys
#COPY ./conf/cbijman.42.fr.crt ./ssl/cbijman.42.fr.crt
#COPY ./conf/cbijman.42.fr.key ./ssl/cbijman.42.fr.key

# Temporary once volumes are fixed
RUN rm -rf /etc/nginx/sites-enabled/default

# Expose some ports
EXPOSE 80

CMD [ "nginx", "-g", "daemon off;"]
