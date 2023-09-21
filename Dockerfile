ARG PHP_EXTENSIONS="apcu bcmath pdo_mysql redis imagick gd"
FROM php:8.2.1-fpm AS php_base
COPY --chown=docker:docker ./application /var/www/html
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN composer install --quiet --optimize-autoloader --no-dev
FROM node:16 as node_dependencies
WORKDIR /var/www/html
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=false
#bring in the laravel application from the php_base to our node js container
COPY --from=php_base /var/www/html /var/www/html
RUN npm set progress=false && \
    npm config set depth 0 && \
    npm install && \
    rm -rf node_modules
FROM php_base
#bring the finished build back into the php container
COPY --from=node_dependencies --chown=docker:docker /var/www/html /var/www/html