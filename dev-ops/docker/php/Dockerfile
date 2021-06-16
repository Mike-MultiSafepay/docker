FROM php:8.0-fpm

ARG user=multisafepay
ARG uid=1000

RUN apt-get update \
    && apt-get install -y \
        git curl zip unzip \
        libonig-dev libpng-dev libjpeg-dev \
        libwebp-dev libjpeg62-turbo-dev libxpm-dev \
        libfreetype6-dev libxml2-dev \
        zlib1g-dev libzip-dev openssl \
        libicu-dev mariadb-client \
        libmcrypt-dev

RUN pecl install xdebug mcrypt

#Install node
RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install nodejs -y

RUN docker-php-ext-configure gd \
            --with-freetype=/usr/include/freetype2 \
            --with-jpeg=/usr/include

RUN docker-php-ext-install gd pdo_mysql mysqli zip intl
RUN docker-php-ext-enable xdebug mcrypt

RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && chown -R $user:$user /home/$user

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

USER $user
