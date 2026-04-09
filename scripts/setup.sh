#!/bin/bash

if [ -z "$(docker ps -a -q -f name=awesome-server)" ]; then
    if [[ -f "../certs/server.key" && -f "../certs/server.crt" ]]; then
        echo -e "\nCertificate already exist, skipping generation.\n"
    else
        if ! [ -d "../certs" ]; then
            mkdir ../certs
        fi
        echo -e "\nGenerating new self-signed certificate...\n"
        openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ../certs/server.key -out ../certs/server.crt -config ../configs/openssl.conf
        echo -e "\nCertificate generated.\n"
    fi

    echo -e "Building Docker image...\n"
    docker build -t localhost-server:1.0 ../
    echo -e "\nImage built successfully."

    echo -e "Starting container...\n"
    docker run -d -p 80:80 -p 443:443 --name awesome-server localhost-server:1.0
    echo -e "\nSuccess! Server started: https://localhost\n"
else
    echo "ERROR. Server Already Running."
fi
