FROM php:8.1.31-fpm-alpine3.21

# docker-php-entrypoint         docker-php-ext-enable       docker-php-source
# docker-php-ext-configure     docker-php-ext-install      docker-php-ext-uninstall
# docker-php-ext-enable         docker-php-ext-install      docker-php-source

# Install dependencies needed to do pdo with mysql
RUN docker-php-ext-install pdo pdo_mysql