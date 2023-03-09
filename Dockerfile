FROM php:apache

ENV DATABASE_NAME=database
ENV DATABASE_USER=user
ENV DATABASE_PASSWORD=password
ENV DATABASE_HOST=host
ENV DATABASE_PORT=port

ENV APP_ENV=prod
ENV APP_SECRET=jfbzdjqkfbsdkqfbdsqkjfnkjdsqbfkuqdsbfkubqu
ENV APP_DEBUG=0

WORKDIR /var/www/html

COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY docker/000-default.conf /etc/apache2/sites-available/000-default.conf

COPY . .

RUN touch .env

RUN docker-php-ext-install pdo pdo_mysql && apt update && apt install -y git zip unzip

RUN composer install --no-dev --optimize-autoloader

ENTRYPOINT ["/var/www/html/docker-entrypoint.sh"]