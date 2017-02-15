FROM nimmis/java:openjdk-8-jdk

MAINTAINER MyKings <xsseroot@gmail.com>

# 使用国内淘宝源
ADD sources.list /etc/apt/
RUN echo "" > /etc/apt/sources.list.d/openjdk-r-ppa-trusty.list

# 安装服务
RUN apt-get -y update && apt-get -y install unzip mysql-server wget

# 切换工作目录
WORKDIR /opt/

COPY ./setup.sh /home/setup.sh

RUN wget http://mirrors.cnnic.cn/apache/tomcat/tomcat-8/v8.5.11/bin/apache-tomcat-8.5.11.zip && unzip apache-tomcat-8.5.11.zip
RUN chmod 777 /opt/apache-tomcat-8.5.11/bin/catalina.sh

# 设置 root 密码
RUN /etc/init.d/mysql start &&\
    mysql -e "grant all privileges on *.* to 'wavsep'@'localhost' identified by 'wavsepPass782';"

# 切换工作目录
WORKDIR /opt/apache-tomcat-8.5.11/webapps/

RUN wget --no-check-certificate https://github.com/sectooladdict/wavsep/releases/download/wavsep-v1.5-war/wavsep-v1.5-war.zip -O /opt/apache-tomcat-8.5.11/webapps/wavsep-v1.5-war.zip && unzip /opt/apache-tomcat-8.5.11/webapps/wavsep-v1.5-war.zip

# 拷贝监控服务配置
COPY ./wavsep.conf /etc/supervisor/conf.d/wavsep.conf

EXPOSE 8080

# 启动容器后执行的命令
CMD ["/usr/bin/supervisord"]
