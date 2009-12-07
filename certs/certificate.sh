#!/bin/sh

if [ $# -ne 2 ]
then
    echo ""
    echo "$0 - Generate RSA key pairs and Auto-Signed Certificate"
    echo ""
    echo "Usage: $0 site.name number.of.valid.days"
    echo "Ex: generate a certificate for a site valid for 1 year:"
    echo "  $0 example.com 365"
    echo ""
    exit
fi

SITE=$1
VALIDADE=$2
openssl genrsa -out $SITE.key 1024
chmod 600 $SITE.key
openssl req -new -key $SITE.key -out $SITE.csr
openssl x509 -in $SITE.csr -out $SITE.crt -req -signkey $SITE.key -days $VALIDADE

