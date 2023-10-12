FROM debian:bookworm

# Install packages
RUN apt update -y
RUN apt install -y mariadb-server

# Create directories for the mysql user
RUN mkdir -p /var/run/mysqld /var/lib/mysql
RUN chown -R mysql:mysql /var/run/mysqld /var/lib/mysql

# Replace variables
RUN sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
COPY --chown=root:root ./tools/configure.sh ./

# Configure and run configure.sh
#RUN chmod +x ./configure.sh
#RUN ./configure.sh

# Expose some ports
EXPOSE 3306

# Et voila!
CMD [ "mysqld", "--user=mysql" ]