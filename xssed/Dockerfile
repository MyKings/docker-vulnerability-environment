FROM ubuntu:14.04

MAINTAINER MyKings <xsseroot@gmail.com>

# 使用国内淘宝源
ADD sources.list /etc/apt/

# 安装服务
RUN apt-get -y update
RUN apt-get -y install php5 wget unzip curl

# 切换工作目录
WORKDIR /var/www/html/

# 删除默认首页
RUN rm /var/www/html/index.html

# 下载 xssed
RUN wget --no-check-certificate https://github.com/aj00200/xssed/archive/master.zip \
  && unzip master.zip \
  && rm master.zip \
  && mv xssed-master/* . \
  && rm -rf ./xssed-master/

# 拷贝启动脚本
ADD ./startup.sh ./

EXPOSE 80

CMD ["/bin/bash"]