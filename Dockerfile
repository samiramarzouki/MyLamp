FROM debian:stable-slim
LABEL version="1.0" maintainer="SAMIRA MARZOUKI <samira.marzouki03@gmail.com>"
ARG APT_FLAGS="-q -y"
ARG DOCUMENTROOT="/var/www/html"
RUN apt-get update -y && \
    apt-get install ${APT_FLAGS} apache2
RUN apt-get install ${APT_FLAGS} mariadb-server
COPY db/articles.sql /
RUN apt-get install ${APT_FLAGS} \
    php-mysql \
    php && \
    rm -f ${DOCUMENTROOT}/index.html && \
    apt-get autoclean -y
COPY app ${DOCUMENTROOT}
EXPOSE 8081
WORKDIR  ${DOCUMENTROOT}
ENTRYPOINT service mysql start && mysql < /articles.sql && apache2ctl -D FOREGROUND
