FROM debian:buster

# On download et on installe nginx et openssl pour le TLS certificate (Transport Layer Security)
RUN apt-get update && \
	apt-get -y install nginx openssl

# On configure et on cree notre cle SSL qui passe par un TLSv1.2 
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt \
	-subj "/CN=FR/SN=Paris/L=75/O=42/OU=ormartin/CN=ormartin@student.42.fr"

# On copie notre fichier de configuration dans le container et on remplace celui de nginx par 
#   default par le notre
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# On lance nginx avec le daemon off pour qu'in run en foreground (plus facile pour le debug)
CMD [ "nginx", "-g", "daemon off;" ]
