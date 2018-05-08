FROM ubuntu:14.04

MAINTAINER MyKings <xsseroot@gmail.com>

# 使用国内淘宝源
ADD sources.list /etc/apt/

# 安装服务
RUN apt-get -y update \
  && apt-get -y --no-install-recommends install php5 php5-mysqlnd php5-gd mariadb-server wget unzip curl supervisor

# 修改 php.ini
RUN sed -i 's/allow_url_include = Off/allow_url_include = On/g' /etc/php5/apache2/php.ini

# 切换工作目录
WORKDIR /var/www/html/

# 拷贝监控服务配置
COPY ./dvwa.conf /etc/supervisor/conf.d/dvwa.conf

# 删除默认首页
RUN rm /var/www/html/index.html

# 下载 DVWA
RUN wget --no-check-certificate https://github.com/ethicalhack3r/DVWA/archive/v1.9.zip\
  && unzip v1.9.zip\
  && rm v1.9.zip\
  && mv DVWA-1.9/* .\
  && rm -rf DVWA-1.9/\
  && chmod -R 777 ./hackable/ ./external//

RUN sed -i 's/p@ssw0rd//g' /var/www/html/config/config.inc.php
RUN sed -i 's/5432/3306/g' /var/www/html/config/config.inc.php

EXPOSE 80

CMD ["/usr/bin/supervisord"]
