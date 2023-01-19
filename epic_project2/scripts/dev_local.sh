#!/bin/bash

if [[ ! -f ".env.dev" ]] 
then
        echo ".env.dev file does not exist and is required"
        echo "See examples directory or README for more details"
        exit 1
fi

case "$1" in
    "shell")
    export $(cat .env.dev | xargs )
    poetry shell
    ;;
    "start")
    export $(cat .env.dev | xargs )
    poetry run manage start-reload
    ;;
    "init")
    poetry install
    ;;
    *)
    echo "Use init, shell or start"
    exit 1
    ;;
esac


