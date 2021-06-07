FROM php:7.2-cli

## Install base dependencies
RUN apt update && apt install  -y git zip unzip autoconf zlib1g-dev

## Install extensions
RUN pecl install xdebug-2.8.1 \
    && docker-php-ext-enable  xdebug

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY src src
COPY composer.json composer.json
RUN composer update
RUN composer install --dev
