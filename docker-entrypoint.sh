#!/bin/bash

php bin/console doctrine:migrations:migrate

apache2-foreground