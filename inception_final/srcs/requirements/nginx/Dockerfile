FROM 	debian:bullseye

RUN 	apt-get update && apt-get upgrade -y
RUN 	apt-get install -y nginx openssl 
#&& rm -rf /var/lib/apt/lists/*

RUN	mkdir -p /etc/nginx/ssl
RUN 	openssl \
	req \
#	-newkey rsa:4096 \
	-x509 \
	#-days 365 \
	-nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=PARIS/0=42/OU=42/CN=aclement.42.fr/UID=aclement"

RUN 	mkdir -p /var/run/nginx

COPY	./conf/nginx.conf /etc/nginx/nginx.conf

RUN	mkdir -p /var/www/html \
	&& chmod 755 /var/www/
#&& chmod -R 755 /var/www/*
RUN 	chown -R www-data:www-data /var/www/html

#EXPOSE 443

CMD	["nginx", "-g", "daemon off;"]
