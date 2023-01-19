#!/bin/bash


export NETWORK_NAME=deepvision


# Check for NETWORK_NAME network and create it
if [ -z $(docker network ls --filter name=^${NETWORK_NAME}$ --format="{{ .Name }}") ] ; then
    echo "Creating network '$NETWORK_NAME'"
    docker network create ${NETWORK_NAME} ;
fi


# Build production container
if [[ "$1" == build ]]
then
    docker-compose -f docker/docker-compose.mss.api.yml build
fi

# Start container API
if [[ "$1" == start ]]
then
    docker-compose -f docker/docker-compose.mss.api.yml up -d
fi

# Start production container API interactively
if [[ "$1" == starti ]]
then
    docker-compose -f docker/docker-compose.mss.api.yml up
fi

# Stop production container
if [[ "$1" == stop ]]
then
    docker-compose -f docker/docker-compose.mss.api.yml down
fi


