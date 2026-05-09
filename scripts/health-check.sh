#!/bin/bash

echo "Checking DSpace service health..."

# Check DSpace
if curl -sf http://localhost:8080/rest/status > /dev/null; then
    echo "✓ DSpace is healthy"
else
    echo "✗ DSpace is not responding"
fi

# Check Solr
if curl -sf http://localhost:8983/solr/ > /dev/null; then
    echo "✓ Solr is healthy"
else
    echo "✗ Solr is not responding"
fi

# Check PostgreSQL
if docker-compose exec -T postgres pg_isready -U dspace > /dev/null 2>&1; then
    echo "✓ PostgreSQL is healthy"
else
    echo "✗ PostgreSQL is not responding"
fi
