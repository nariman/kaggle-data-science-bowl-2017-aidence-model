#!/usr/bin/env bash

# Script for Docker image running

# Run the container
docker run -d -p 8888:8888 --name aidence-container aidence

# Sleep while the Jupyter is starting
sleep 1s

# Get logs for the Jupyter token
docker logs aidence-container
