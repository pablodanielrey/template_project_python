#!/bin/bash

if [[ "$1" != "stop" ]]
then
    if [[ ! -f ".env.dev" ]] 
    then
            echo ".env.dev file does not exist and is required"
            echo "See examples directory or README for more details"
            exit 1
    fi
fi

case "$1" in
    "build")
    docker-compose -f docker/docker-compose.dev.yml build
    ;;
    "start")
    docker-compose -f docker/docker-compose.dev.yml up -d
    ;;
    "stop")
    docker-compose -f docker/docker-compose.dev.yml down
    ;;
    *)
    echo "Use build, start or stop"
    exit 1
    ;;
esac


