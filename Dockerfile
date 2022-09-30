FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER Reinaldo Guedes
RUN apt-get update && apt upgrade -y \
&& apt-get install -y apache2 \
                      && apt-get install software-properties-common -y \ 
                      && add-apt-repository ppa:ondrej/php \ 
                      && apt update -y && apt upgrade -y \ 
                      && apt install libapache2-mod-php8.1 php8.1 php8.1-curl php8.1-fileinfo php8.1-gd \
                      php8.1-mbstring php8.1-mysqli php8.1-xml php8.1-intl php8.1-bz2 php8.1-zip php8.1-ldap -y \
                      && echo "session.cookie_httponly=on" >> /etc/php/8.1/apache2/php.ini 
EXPOSE 80
CMD apachectl -D FOREGROUND

