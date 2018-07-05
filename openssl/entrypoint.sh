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

case "$1" in
    efile) openssl enc -aes-256-cbc -in "${2}" -out "${3}" ;;
    dfile) openssl enc -aes-256-cbc -d -in "${2}" > "${3}" ;;
    -v) echo "OpenSSL : $(openssl version)" ;;
    -h) usage ;;
    *) openssl "${@:2}" ;;
esac
