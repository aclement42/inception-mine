FROM 	debian:bullseye

RUN 	apt-get update
RUN 	apt-get upgrade -y

RUN	apt-get install bash -y
RUN 	apt-get install wget -y \
    	curl

RUN 	apt-get install -y php7.4 \
	php-fpm\
	php-mysql\
	mariadb-client

COPY 	./conf/php.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY	./conf/php.conf /wp-config.php
RUN	mkdir -p /run/php && chmod 755 /run/php

RUN 	wget https://fr.wordpress.org/wordpress-6.2-fr_FR.tar.gz -P /var/www
RUN 	cd /var/www && tar -xzf wordpress-6.2-fr_FR.tar.gz && rm wordpress-6.2-fr_FR.tar.gz
RUN	chmod 755 /var/www/wordpress #&& chown -R root:root /var/www/wordpress

COPY 	./tools/setup_wordpress.sh /etc/setup_wordpress.sh
RUN	chmod +x /etc/setup_wordpress.sh

RUN	apt-get update && apt-get upgrade -y
RUN 	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  	&& chmod +x wp-cli.phar \
  	&& mv wp-cli.phar /usr/local/bin/wp

#We expose the 9000 port
EXPOSE 9000

#We go the html directory
WORKDIR /var/www/wordpress

#ENTRYPOINT ["bash", "/etc/setup_wordpress.sh"]

#Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
CMD 	["bash", "/etc/setup_wordpress.sh"]


##############################################################

#FROM	debian:bullseye
#
#RUN		apt-get update && apt-get upgrade -y
#
#RUN		apt-get install -y bash
#
#RUN		apt-get install -y wget
#RUN		apt-get install -y php7.4 php-fpm php-mysql mariadb-client;
#
#COPY	/conf/php.conf /etc/php/7.4/fpm/pool.d/www.conf
#RUN     mkdir -p /run/php
#RUN     chmod 755 /run/php
#
#RUN		wget https://fr.wordpress.org/wordpress-6.2-fr_FR.tar.gz -P /var/www
#RUN		cd /var/www && tar -xzf wordpress-6.2-fr_FR.tar.gz && rm wordpress-6.2-fr_FR.tar.gz
#RUN		chmod 755 /var/www/wordpress
#
#COPY	/tools/setup_wordpress.sh /etc/setup_wordpress.sh
#
#RUN		chmod +x /etc/setup_wordpress.sh
#
#RUN		apt-get update && apt-get upgrade -y
#RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#RUN		chmod +x wp-cli.phar
#RUN		mv wp-cli.phar /usr/local/bin/wp
#
#EXPOSE	9000
#
#WORKDIR /var/www/wordpress
#
#CMD		["bash", "/etc/setup_wordpress.sh"]
