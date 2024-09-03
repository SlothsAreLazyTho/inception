# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: cbijman <cbijman@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2023/11/13 16:12:23 by cbijman       #+#    #+#                  #
#    Updated: 2023/11/13 16:12:24 by cbijman       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:bookworm

# Install packages
RUN apt update -y
RUN apt install -y mariadb-server

# Create directories for the mysql user
RUN mkdir -p /var/run/mysqld /var/lib/mysql
RUN chown -R mysql:mysql /var/run/mysqld /var/lib/mysql

# Configure and run configure.sh
COPY --chown=root:root ./tools/configure.sh ./
RUN chmod +x ./configure.sh

# Expose some ports
EXPOSE 3306

ENTRYPOINT [ "bash", "configure.sh" ]

# Et voila!
CMD [ "mysqld", "--user=mysql", "--bind-address=0.0.0.0" ]