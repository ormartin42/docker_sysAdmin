FROM debian:buster

# On download et on installe les paquets PHP
RUN apt-get update && apt-get -y install php7.3-fpm php7.3-common php7.3-mysql curl mariadb-client

# Normalement ces fichiers se creent automatiquement mais pour etre surs du bon fonctionnement on les cree manuellement en amot
RUN mkdir -p /var/www/html && mkdir -p /run/php 

# On dowmload et on installe Wordpress via wp-cli qui permet l'installation et la configuration en ligne de commande: 
#   plus besoin de modifier les fichiers de configuration manuellement
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Modification du fichier ci-dessous pour que php ecoute sur un port (9000) et non pas sur un socket
COPY ./conf/www.conf	/etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/script.sh	/tmp/script.sh
RUN chmod +x /tmp/script.sh

CMD ["sh", "/tmp/script.sh"]