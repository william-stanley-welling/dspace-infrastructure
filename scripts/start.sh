#!/bin/bash

set -e

echo "Starting DSpace Infrastructure..."

# Load environment variables
if [ -f .env ]; then
    export $(cat .env | grep -v '#' | xargs)
fi

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "Error: Docker daemon is not running"
    exit 1
fi

echo "Building and starting services..."
docker-compose up -d

echo "Waiting for services to be healthy..."
sleep 10

echo "DSpace is starting up. Access at http://localhost:8080"
echo "Solr admin at http://localhost:8983/solr"
