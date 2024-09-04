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
RUN apt-get install -y nginx

# Do some copying.
WORKDIR /etc/nginx
COPY ./conf/wordpress.conf ./sites-enabled/wordpress.conf

# Temporary once volumes are fixed
RUN rm -rf /etc/nginx/sites-enabled/default

# Expose some ports
EXPOSE 443

CMD [ "nginx", "-g", "daemon off;"]