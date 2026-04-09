#!/bin/bash

if [ -z "$(docker ps -a -q -f name=awesome-server)" ]; then
    if [[ -f "../certs/server.key" && -f "../certs/server.crt" ]]; then
        echo "Certs already generated!"
    else
        if ! [ -d "../certs" ]; then
            mkdir ../certs
        fi
        echo "Certs and / or key do not exist. Generating new private key and self signed certificate."
        openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ../certs/server.key -out ../certs/server.crt -config ../configs/openssl.conf
    fi
    
    docker build -t localhost-server:1.0 ../
    docker run -d -p 80:80 -p 443:443 --name awesome-server localhost-server:1.0
else
    echo "ERROR. Server Already Running."
fi
