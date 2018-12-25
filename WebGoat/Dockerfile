FROM nimmis/java:openjdk-8-jdk

MAINTAINER MyKings <xsseroot@gmail.com>

# 使用国内淘宝源
ADD sources.list /etc/apt/
RUN echo "" > /etc/apt/sources.list.d/openjdk-r-ppa-trusty.list

# 安装服务
RUN apt-get -y update && apt-get -y install

# 切换工作目录
WORKDIR /opt/

#COPY ./bin/apache-tomcat-8.5.9.zip /opt/apache-tomcat-8.5.9.zip
#RUN unzip /opt/apache-tomcat-8.5.9.zip

RUN wget http://apache.fayea.com/tomcat/tomcat-8/v8.5.35/bin/apache-tomcat-8.5.35.zip && unzip apache-tomcat-*.zip
RUN chmod 777 /opt/apache-tomcat-*/bin/catalina.sh

# 切换工作目录
WORKDIR /opt/apache-tomcat-*/webapps/

#COPY ./bin/webgoat-container-7.1.war /opt/apache-tomcat-8.5.9/webapps/webgoat-container-7.1.war
RUN wget --no-check-certificate https://github.com/WebGoat/WebGoat/releases/download/7.1/webgoat-container-7.1.war


# 拷贝监控服务配置
COPY ./webgoat.conf /etc/supervisor/conf.d/webgoat.conf

EXPOSE 8080

# 启动容器后执行的命令
CMD ["/usr/bin/supervisord"]
