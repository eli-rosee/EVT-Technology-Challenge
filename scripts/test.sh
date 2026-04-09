#!/bin/bash

echo -e "\nTesting HTTP (hopefully redirected to HTTPS)...\n"
curl -I http://localhost
echo -e "\nTesting HTTPS...\n"
curl -k -I https://localhost
echo -e "\nTesting HTTPS with verbose output to view TLS handshake (ignore self-signed cert warning)...\n"
curl -v https://localhost
echo
