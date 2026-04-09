#!/bin/bash

mkdir certs
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ../certs/server.key -out ../certs/server.crt -config ../configs/openssl.conf
docker build -t localhost-server:1.0 ../
docker run -p --name awesome-server 80:80 -p 443:443 -d localhost-server:1.0
