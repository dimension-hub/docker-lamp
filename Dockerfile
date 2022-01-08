FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
software-properties-common
RUN apt-get update
RUN apt-get -y install php7.4 \
php7.4-dev \
php7.4-cli \
php7.4-zip \
php7.4-mysql \
php7.4-gd \
libapache2-mod-php \
php7.4-curl \
php7.4-xml \
php7.4-bcmath \
php7.4-json \
php7.4-common \
php7.4-mbstring \
apache2 \
composer

CMD ["apachectl","-D","FOREGROUND"]
RUN a2enmod rewrite
EXPOSE 80
EXPOSE 443