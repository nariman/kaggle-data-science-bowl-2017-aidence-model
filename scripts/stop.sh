#!/usr/bin/env bash

# Script for Docker container stopping

# Stop the container
docker stop aidence-container

# Remove the container for reuse the name
docker container rm aidence-container
