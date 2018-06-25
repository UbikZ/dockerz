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

cmdVersion=0
cmdEncryptFile=0
cmdDecryptFile=0

case "$1" in
    openssl) openssl ${@:2} ;;
    efile) cmdEncryptFile=1 ;;
    dfile) cmdDecryptFile=1 ;;
    -v) cmdVersion=1 ;;
    -h) usage ;;
    *) usage ;;
esac

[ "${cmdVersion}" -eq 1 ] && echo "OpenSSL : $(openssl version)"

[ "${cmdEncryptFile}" -eq 1 ] && openssl enc -aes-256-cbc -in ${@[2]} -out ${@[3]}

[ "${cmdDecryptFile}" -eq 1 ] && openssl enc -aes-256-cbc -d -in ${@[2]} > ${@[3]}
