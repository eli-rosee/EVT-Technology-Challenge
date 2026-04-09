#!/bin/bash

mkdir certs
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ../certs/server.key -out ../certs/server.crt -config ../configs/openssl.conf
docker build -t localhost-server:v3 ../
docker run -p 443:443 -d localhost-server:v3
