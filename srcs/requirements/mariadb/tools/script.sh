#!/bin/sh

# On checke si notre database a deja ete creee. Si oui, on saute cette etape
if [ ! -d /var/lib/mysql/${MYSQL_DABATASE} ]; then
    service mysql start
    until mysqladmin ping; do
        sleep 2
    done
    mysql -u root -e "CREATE DATABASE ${MYSQL_DABATASE};"
    mysql -u root -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';"
    mysql -u root -e "GRANT ALL ON ${MYSQL_DABATASE}.* TO '${MYSQL_USER}'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');"
    service mysql stop
fi

mysqld_safe