#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <backup_file>"
    exit 1
fi

BACKUP_FILE="$1"

if [ ! -f "$BACKUP_FILE" ]; then
    echo "Error: Backup file not found: $BACKUP_FILE"
    exit 1
fi

echo "Restoring DSpace database from $BACKUP_FILE..."

docker-compose exec -T postgres psql -U dspace dspace < "$BACKUP_FILE"

echo "Restore completed"
