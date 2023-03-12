FROM php:apache

# Définition des variables d'environnement **PAR DEFAULT** pour la connexion à la base de données
ENV DATABASE_NAME=database
ENV DATABASE_USER=user
ENV DATABASE_PASSWORD=password
ENV DATABASE_HOST=host
ENV DATABASE_PORT=port

# Définition des variables d'environnement **PAR DEFAULT** pour l'application
ENV APP_ENV=prod
ENV APP_SECRET=jfbzdjqkfbsdkqfbdsqkjfnkjdsqbfkuqdsbfkubqu
ENV APP_DEBUG=0

# D'aprés la documentation de l'image php:apache, on travaille dans le dossier /var/www/html
WORKDIR /var/www/html

# On copie composer depuis une autre image Docker
COPY --from=composer /usr/bin/composer /usr/bin/composer

# On copie le fichier de configuration d'Apache
COPY docker/000-default.conf /etc/apache2/sites-available/000-default.conf

# On copie les fichiers de notre application
COPY . .

# Symfony a besoin d'un fichier .env pour fonctionner, même vide
RUN touch .env

# Installation des dépendances pour MYSQL et git
RUN docker-php-ext-install pdo pdo_mysql && apt update && apt install -y git zip unzip

# On installe les dépendances de l'application
RUN composer install --no-dev --optimize-autoloader

# On défini notre utilisateur comme étant www-data (pour éviter les problèmes de droits)
USER www-data

# On défini le point d'entrée de notre image Docker
ENTRYPOINT ["/var/www/html/docker-entrypoint.sh"]