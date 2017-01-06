FROM ubuntu:14.04

MAINTAINER MyKings <xsseroot@gmail.com>

# 使用国内淘宝源
ADD sources.list /etc/apt/

# 安装服务
RUN apt-get -y update \
  && apt-get -y install php5 php5-mysqlnd php5-gd mysql-server unzip supervisor

# 修改 php.ini
RUN sed -i 's/allow_url_include = Off/allow_url_include = On/g' /etc/php5/apache2/php.ini

# 切换工作目录
WORKDIR /var/www/html/

# 删除默认首页
COPY www_cn_20140811.zip /var/www/html/www_cn_20140811.zip
RUN rm /var/www/html/index.html && unzip www_cn_20140811.zip &&\
 mv www_cn_20140811/* . && rm -rf www_cn_20140811/ www_cn_20140811.zip && chmod -R 777 ./hackable/ ./external/

# 拷贝监控服务配置
COPY ./dvwa_wooyun.conf /etc/supervisor/conf.d/dvwa_wooyun.conf

EXPOSE 80

CMD ["/usr/bin/supervisord"]
