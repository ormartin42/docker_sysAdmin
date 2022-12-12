FROM debian:buster

# On download et on installe les paquets mariadb
RUN apt-get update && apt-get -y install mariadb-server mariadb-client

# Normalement ces fichiers se creent automatiquement mais pour etre surs du bon fonctionnement on les cree manuellement en amont
RUN mkdir -p /var/run/mysqld && chown mysql /var/run/mysqld
RUN mkdir -p /run/mysqld && chown mysql /run/mysqld

# /etc/mysql/my.cnf: c'est le fichier de configuration principal mais il ne fait pas grand chose hormis charger 
#   automatiquement les fichiers de configuration presents dans /etc/mysq/conf.d et /etc/mysql/mariadb.conf.d
# /etc/mysql/mariadb.conf.d/50-server.cnf: c'est le fichier de configuration du demon du serveur, qui contient
#   notamment les instructions de ce dernier apres le mot cle [mysqld]
# Ici on veut surtout commenter la ligne bind-address ou ajouter les IP autorises a se connecter, donc juste besoin
#   de modifier le fichier 50-server.cnf La valeur par defaut est 127.0.0.1 pour listen for local connections only.
#   Pour l'ouvrir a des external addresses, on change donc sa valeur a 0.0.0.0
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf 

COPY ./tools/script.sh /tmp/script.sh
RUN chmod +x /tmp/script.sh

CMD ["sh", "/tmp/script.sh"]