#!/bin/bash

# Remove any old/deprecated/system-specific docker packages
sudo yum remove docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-engine

# Download and execute convinience script to install Docker Engine 
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Setup docker group
sudo groupadd docker
sudo usermod -aG docker vagrant

# Configure docker to start at system start
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl start docker.service
sudo systemctl start containerd.service