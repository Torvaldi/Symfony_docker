# Dockerisation d'une application Symfony

## A quoi s'attendre dans ce repo ?

Le but de ce repo est de montrer comment lancer une application minimaliste Symfony dans un conteneur Docker.

Si vous lancer le repo tel quel, vous aurez une application Symfony qui tourne sur un serveur Apache dans un conteneur Docker.

Vous pourrez y accéder à partir de l'URL [http://localhost:8000](http://localhost:8000).

## Commandes utiles

- `docker compose up -d --build` - Compile et lance les conteneurs Docker du fichier [docker-compose.yml](docker-compose.yml)

## Les fichiers à modifier / regarder

- [docker-compose.yml](docker-compose.yml) - Fichier de configuration de Docker Compose
- [Dockerfile](Dockerfile) - Fichier de compilation de l'image Docker
- [docker/000-default.conf](docker/000-default.conf) - Fichier de configuration de Apache
- [docker-entrypoint.sh](docker-entrypoint.sh) - Script d'entrée de l'image Docker
