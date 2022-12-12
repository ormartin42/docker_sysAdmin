#!/bin/sh

# On checke si Wordpress a deja ete configure ou non. Si oui, on saute cette etape
if [ ! -f /var/www/html/wp-config.php ]; then

 	# On se place dans le bon dossier avant de lancer l'installation et la configuration de Wordpress
    cd /var/www/html/

	# On lance l'installation de Wordpress inception, pour le host on peut juste indique le nom de l'image.
    # Toutes les commandes wp ne tournent qu'en root donc besoin de rajouter --allow-root a la fin
    wp core download --allow-root
	
    # On se connecte remotely a notre base de donnees MYSQL via mysqladmin ("mysqladmin is a client for performing
    #   administrative operations. You can use it to check the server's configuration and current status, to create 
    #   and drop databases, and more")
    #   https://dev.mysql.com/doc/refman/8.0/en/mysqladmin.html
    # Ici vu que les containers mariadb et wordpress appartiennent au meme docker network inception, pour le host on
    # peut juste indique le nom de l'image.
    #mysqladmin -hmariadb -u${MYSQL_USER} -p${MYSQL_USER_PASSWORD}
    until mysqladmin -hmariadb -u${MYSQL_USER} -p${MYSQL_USER_PASSWORD} ping; do
        sleep 2
    done

    # On cree une nouvelle configuration
	wp config create --dbname=${MYSQL_DABATASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_USER_PASSWORD} --dbhost=mariadb --allow-root
	# On run le standard wordpress installation process
    #   - url: adresse du nouveau site
    #   - title: titre du nouveau site
    #   - admin_user: nom du amdin user
    wp core install --url=${DOMAIN_NAME} --title="${WP_TITLE}" --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_MAIL} --skip-email --allow-root
	# On cree un nouvel utilisateur non admin
    wp user create ${WP_USER} ${WP_USER_MAIL} --role=author --user_pass=${WP_USER_PASSWORD} --allow-root
fi

php-fpm7.3 -F -R
