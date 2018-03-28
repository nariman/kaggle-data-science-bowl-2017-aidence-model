#!/usr/bin/env bash

# Script for Docker image building
# It should be called from the repo root directory, not in the `scripts`

# Build system environment
docker build -t aidence-sys -f ./dockerfiles/Dockerfile.sys .

# Build application environment, final image with sources
docker build -t aidence -f ./dockerfiles/Dockerfile.app .
