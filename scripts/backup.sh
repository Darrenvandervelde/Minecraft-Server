#!/bin/bash

# Minecraft Server Backup Script

BACKUP_DIR="backups"
WORLD_DIR="server/world"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/world_backup_${TIMESTAMP}.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "${BACKUP_DIR}"

# Check if world directory exists
if [ ! -d "${WORLD_DIR}" ]; then
    echo "Error: World directory not found at ${WORLD_DIR}"
    exit 1
fi

echo "Creating backup: ${BACKUP_FILE}"

# Create compressed backup
tar -czf "${BACKUP_FILE}" -C "$(dirname "${WORLD_DIR}")" "$(basename "${WORLD_DIR}")"

if [ $? -eq 0 ]; then
    echo "Backup completed successfully: ${BACKUP_FILE}"
    
    # Optional: Delete backups older than 7 days
    echo "Cleaning up old backups (older than 7 days)..."
    find "${BACKUP_DIR}" -name "world_backup_*.tar.gz" -mtime +7 -delete
else
    echo "Backup failed!"
    exit 1
fi
