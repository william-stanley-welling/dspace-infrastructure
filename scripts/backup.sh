#!/bin/bash

set -e

BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/dspace_backup_$TIMESTAMP.sql"

mkdir -p "$BACKUP_DIR"

echo "Backing up DSpace database..."

docker-compose exec -T postgres pg_dump -U dspace dspace > "$BACKUP_FILE"

echo "Backup completed: $BACKUP_FILE"
echo "File size: $(du -h "$BACKUP_FILE" | cut -f1)"
