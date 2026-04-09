#!/bin/bash

if [ -z "$(docker ps -a -q -f name=awesome-server)" ]; then
    echo "ERROR. Server does not exist"
else
    echo -e "\nStopping server..."
    docker stop awesome-server > /dev/null
    echo -e "Server stopped.\n"

    echo -e "Removing container..."
    docker rm awesome-server > /dev/null
    echo -e "Container removed.\n"

    echo -e "Server shut down. Run ./setup.sh to start it again.\n"
fi
