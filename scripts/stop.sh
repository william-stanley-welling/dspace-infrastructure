#!/bin/bash

set -e

echo "Stopping DSpace Infrastructure..."

if [ -f docker-compose.yml ]; then
    docker-compose down
    echo "Services stopped"
else
    echo "Error: docker-compose.yml not found"
    exit 1
fi
