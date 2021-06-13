FROM php:8.0-fpm
ARG user=multisafepay
ARG uid=1000
RUN apt-get update && apt-get install -y git curl zip libonig-dev unzip libpng-dev libjpeg-dev libfreetype6-dev libxml2-dev zlib1g-dev libzip-dev openssl libicu-dev mariadb-client
RUN pecl install xdebug

#Install node
RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install nodejs -y

RUN apt-get update && apt-get install -y libpng-dev
RUN apt-get install -y \
    libwebp-dev \
    libjpeg62-turbo-dev \
    libpng-dev libxpm-dev \
    libfreetype6-dev

RUN docker-php-ext-configure gd \
            --with-freetype=/usr/include/freetype2 \

            --with-jpeg=/usr/include

RUN docker-php-ext-install gd

RUN docker-php-ext-install gd pdo pdo_mysql mysqli zip gd intl xml mbstring
RUN docker-php-ext-enable xdebug pdo_mysql mysqli gd
#RUN docker-php-ext-configure gd --enable-gd-native-ttf --with-freetype-dir=/usr/include/freetype2 --with-png-dir=/usr/include --with-jpeg-dir=/usr/include
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && chown -R $user:$user /home/$user

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

USER $user