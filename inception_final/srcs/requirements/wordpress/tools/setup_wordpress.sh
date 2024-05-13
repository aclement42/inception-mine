#!/bin/bash

sleep 10

if wp core is-installed --allow-root; then
	echo "Wordpress is allready installed"
	php-fpm7.4 -F -R

if ! wp core is-installed --allow-root; then
    wp core download --allow-root --force

    wp config create --dbname=wordpress --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --allow-root --force

    wp core install --url="aclement.42.fr" --title="Inception" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_MAIL --allow-root
		#--skip-email \

    wp user create $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PASS --allow-root
#	--role=author \

    wp config shuffle-salts --allow-root
      echo "Wordpress installation complete!"
fi

else
	echo "Wordpress installation failed..!"
fi
#cd -
#exec /usr/sbin/php-fpm7.4 -F -R






#
#sleep 10
#
#if ! wp core is-installed --allow-root  ; then
#    wp core download --allow-root --force

#    wp config create --dbname=wordpress --dbuser=$MYSQL_USER \
#    --dbpass=$MYSQL_PASSWORD --dbhost=mariadb \
#    --allow-root --force

#    wp core install --url="aclement.42.fr" --title="Inception" \
#    --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS \
#    --admin_email=$WP_ADMIN_MAIL --allow-root

#    wp user create $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PASS --allow-root

#    wp config shuffle-salts --allow-root
#    echo "Wordpress's installation complete"
#fi
#
#if wp core is-installed --allow-root  ; then
#    echo "Wordpress is installed and running"
#    php-fpm7.4 -F -R
#else
#    echo "Wordpress's installation failed"
#fi

