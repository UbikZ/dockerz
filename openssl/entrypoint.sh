#!/usr/bin/env bash

cd /home/workspace/openssl

function usage() {
    echo "  usage: ossl <options>"
    echo ""
    echo "         efile <infile> <outfile>     encrypt file."
    echo "         dfile <infile> <outfile>     decrypt file."
    echo "         -v       show versions."
    echo "         -h       show usage."
    exit 1
}

checkInputOutputArgs() {
    if [ -z $1 ]; then
        echo "  Error : Input file argument is required."; exit 1
    elif [ ! -f $1 ]; then
        echo "  Error : Input file ($1) does not exist."; exit 1
    elif [ -z $2 ]; then
        echo "  Error : Output file argument is required."; exit 1
    fi
}

case "$1" in
    efile)
        checkInputOutputArgs $2 $3
        openssl enc -aes-256-cbc -in "${2}" -out "${3}"
    ;;
    dfile)
        checkInputOutputArgs $2 $3
        openssl enc -aes-256-cbc -d -in "${2}" > "${3}"
    ;;
    -v) echo "OpenSSL : $(openssl version)" ;;
    -h) usage ;;
    *) openssl "${@:1}" ;;
esac
