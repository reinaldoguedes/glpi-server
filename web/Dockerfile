FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER Reinaldo Guedes
RUN apt-get update && apt upgrade -y \
&& apt-get install -y apache2 \
                      && apt-get install software-properties-common -y \
                      && add-apt-repository ppa:ondrej/php \
                      && apt update -y && apt upgrade -y \
                      && apt install libapache2-mod-php8.2 php8.2 php8.2-curl php8.2-fileinfo php8.2-gd \
                      php8.2-mbstring php8.2-mysqli php8.2-xml php8.2-intl php8.2-bz2 php8.2-zip php8.2-ldap php8.2-bcmath -y \
                      && echo "session.cookie_httponly=on" >> /etc/php/8.2/apache2/php.ini \
                      && a2enmod rewrite
COPY chamados.visionclinica.local.conf /etc/apache2/sites-available/chamados.visionclinica.local.conf
RUN a2dissite 000-default \
&& a2ensite chamados.visionclinica.local.conf
EXPOSE 80
CMD apachectl -D FOREGROUND
