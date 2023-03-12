#!/bin/bash

# Lancement des migrations de symfony pour la base de données
# S'execute à chaque démarrage du container MAIS la commande vérifie si les migrations ont déjà été faites
php bin/console doctrine:migrations:migrate

# Lancement du serveur apache
apache2-foreground