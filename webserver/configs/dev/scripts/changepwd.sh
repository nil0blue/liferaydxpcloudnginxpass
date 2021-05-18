#!/bin/bash 
echo "More secure implementation of dev environment password by using a Secret"
envsubst < "/var/www/html/.htpasswd" | sponge "/var/www/html/.htpasswd"






