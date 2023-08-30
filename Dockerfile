FROM ubuntu
MAINTAINER ifeng <https://t.me/HiaiFeng>

RUN apt update -y && apt install -y wget unzip nginx supervisor qrencode net-tools

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir /etc/mysql /usr/local/mysql
COPY config.json /etc/mysql/
COPY entrypoint.sh /usr/local/mysql/
COPY mysql/ /usr/local/mysql/mysql/

# 感谢 fscarmen 大佬提供 Dockerfile 层优化方案
   
    chmod a+x /usr/local/mysql/entrypoint.sh
