FROM debian:jessie
MAINTAINER Frédéric Amary <famary@sismic.fr>

RUN apt-get update && apt-get -y upgrade

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -yq install vim \
                    curl \
                    sudo \
                    wget \
                    net-tools

RUN apt-get install -yq apt-transport-https lsb-release ca-certificates
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
RUN apt-get update

# Installation de PHP 7.1
RUN apt-get update && apt-get -yq install php7.1 \
                     apache2 \
                     libapache2-mod-php7.1 \
                     php7.1-pgsql \
                     php7.1-curl \
                     php7.1-json \
                     php7.1-gd \
                     php7.1-mcrypt \
                     php7.1-msgpack \
                     php7.1-memcached \
                     php7.1-intl \
                     php7.1-sqlite3 \
                     php7.1-gmp \
                     php7.1-geoip \
                     php7.1-mbstring \
                     php7.1-xml \
                     php7.1-zip \
                     apt-transport-https \
                     postgresql-contrib \
                     php7.1-bcmath \
                     php-amqplib

RUN apt-get -yq update && apt-get -y upgrade

RUN apt install -yq php7.1-dev
RUN apt-get -yq install libapache2-mod-php7.1

RUN apt-get -yq update && apt-get -y upgrade
RUN apt-get -yq install postgresql-9.4 postgresql-client-9.4

RUN sed -ri "s!^#?(listen_addresses)\s*=\s*\S+.*!\1 = '*'!" /etc/postgresql/9.4/main/postgresql.conf

# Install git
RUN apt-get -yq install git-core

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -o Dpkg::Options::=--force-confdef phppgadmin

RUN apt-get update
RUN apt-get install -y vim curl

RUN a2enmod rewrite

RUN chmod -R 755 /usr/share/phppgadmin

WORKDIR /var/www/html/

ADD run.sh /run.sh
RUN chmod -v +x /run.sh

VOLUME ["/var/lib/postgresql"]

CMD ["/run.sh"]

EXPOSE 5432/tcp
EXPOSE 80
