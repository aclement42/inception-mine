FROM	debian:bullseye

#MISE A JOUR DE MA VERSION DEBIAN
RUN 	apt-get update -y
RUN 	apt-get upgrade -y
#installation mariadb
RUN 	apt-get install mariadb-server -y

#creation de sous doss pour mysql: stock db dans var/lib/mysql && ecriture socket run/mysqld
#RUN mkdir -p /var/lib/mysql
RUN mkdir 	-p /run/mysqld
RUN 		chown mysql:root /run/mysqld

COPY 		conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY 		./tools/mariadb.sh /etc/mariadb.sh

#rendre le scrypt executable
RUN 		chmod +x /etc/mariadb.sh
#RUN chown root:root ./scrypt.sh

#change l'utilisateur et le grp qui ont les droits sur var/lib/mysql && run/mysqld
#RUN chown mysql:mysql /var/lib/mysql
#RUN chmod 777 /var/lib/mysql
#RUN chmod 777 /run/mysqld

#USER 0:0
EXPOSE		3306

CMD 		[ "sh", "/etc/mariadb.sh" ]


###############################


#FROM	debian:bullseye
#
#RUN		apt-get update -y && apt-get upgrade -y
#RUN		apt-get install mariadb-server -y
#
#RUN     mkdir -p /run/mysqld && chown mysql:root /run/mysqld
#
#COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
#COPY	./tools/mariadb.sh /etc/mariadb.sh
#
#RUN		chmod +x /etc/mariadb.sh
#
#EXPOSE	3306
#
#CMD		["sh", "/etc/mariadb.sh"]
