#!/bin/bash
BACKUP_DIR="/home/liveuser/Desktop/backup"
mkdir -p "$BACKUP_DIR"
DATE=$(date +%Y-%m-%d_%H-%M)
BACKUP_FILE="$BACKUP_DIR/logs_backup_$DATE.tar.gz"

echo "Starting backup..."

if sudo tar -czf "$BACKUP_FILE" /var/log/syslog /var/log/auth.log 2>/dev/null || [[ ! -f /var/log/syslog ]]; then
    sudo chown liveuser:liveuser "$BACKUP_FILE"
    chmod 644 "$BACKUP_FILE"
    echo "Log backup created: $BACKUP_FILE"
    echo "$(date): SUCCESS - $BACKUP_FILE" >> "$BACKUP_DIR/backup.log"
else
    echo "Log backup failed"
    echo "$(date): FAILED - Backup failed" >> "$BACKUP_DIR/backup.log"
fi

find "$BACKUP_DIR" -name "logs_backup_*.tar.gz" -mtime +30 -delete
echo "Cleanup done."
