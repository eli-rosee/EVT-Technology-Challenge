#!/bin/bash

if [ -z "$(docker ps -a -q -f name=awesome-server)" ]; then
    echo "ERROR. Server Logs Do Not Exist."
else
    docker logs -f awesome-server
fi
