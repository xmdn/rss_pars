FROM php:7.4-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    libzip-dev \
    zip \
    && docker-php-ext-install pdo pdo_mysql zip \
    && a2enmod rewrite

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite
