#!/bin/bash

/etc/init.d/mysql start &&\
/opt/apache-tomcat-8.5.11/bin/catalina.sh start &&\
curl "http://127.0.0.1:8080/wavsep/wavsep-install/install.jsp" --data "username=root&password=&host=localhost&port=3306&wavsep_username=&wavsep_password=" &&\
mysql -e "grant all privileges on *.* to 'wavsep'@'localhost' identified by 'wavsepPass782';" &&\
curl "http://127.0.0.1:8080/wavsep/wavsep-install/install.jsp" --data "username=wavsep&password=wavsepPass782&host=localhost&port=3306&wavsep_username=&wavsep_password="
