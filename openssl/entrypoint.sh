#!/usr/bin/env bash

cd /home/workspace/openssl

function usage() {
    echo "  usage: uossl [openssl] [efile] [dfile]"
    echo ""
    echo "         openssl                      execute openssl."
    echo "         efile <infile> <outfile>     encrypt file."
    echo "         dfile <infile> <outfile>     decrypt file."
    echo "         -v       show versions."
    echo "         -h       show usage."
    exit 1
}

# No param
[ -z "$1" ] && usage

case "$1" in
    openssl) openssl ${@:2} ;;
    efile) openssl enc -aes-256-cbc -in ${2} -out ${3} ;;
    dfile) openssl enc -aes-256-cbc -d -in ${2} > ${3} ;;
    -v) echo "OpenSSL : $(openssl version)" ;;
    -h) usage ;;
    *) usage ;;
esac
