#!/bin/bash

if [ -z "$(docker ps -a -q -f name=awesome-server)" ]; then
    echo "ERROR. Server does not exist"
else
    docker stop awesome-server
    docker rm awesome-server
fi
