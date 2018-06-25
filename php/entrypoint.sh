#!/usr/bin/env bash

cd /home/workspace/php

function usage() {
    echo "  usage: uphp [php] [composer] [serve]"
    echo ""
    echo "         php                  execute php."
    echo "         composer             execute composer."
    echo "         serve    <path>      server static en localhost:8080."
    echo "         -v                   show versions."
    echo "         -h                   show usage."
    exit 1
}

# No param
[ -z "$1" ] && usage

case "$1" in
    php) php ${@:2} ;;
    composer) composer ${@:2} ;;
    serve) php -S localhost:8888 -t ${@:2} ;;
    -v) (
        echo "PHP : $(php -v)"
        echo "composer : $(composer --version)"
    ) ;;
    -h) usage ;;
    *) usage ;;
esac
