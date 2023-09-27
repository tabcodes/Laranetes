ARG PHP_EXTENSIONS="apcu bcmath pdo_mysql redis imagick gd"
FROM php:8.2.1-fpm AS php_base

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    && docker-php-ext-install mysqli pdo_mysql

WORKDIR /code
COPY --chown=docker:docker ./application /code

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN composer install --quiet --optimize-autoloader --no-dev

FROM node:16 as node_dependencies
WORKDIR /var/www/html
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=false

COPY --from=php_base /code /var/www/html
RUN npm set progress=false && \
    npm config set depth 0 && \
    npm install && \
    rm -rf node_modules

FROM php_base
WORKDIR /var/www/html
COPY --from=node_dependencies --chown=docker:docker /var/www/html /var/www/html