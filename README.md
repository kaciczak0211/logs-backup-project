Automated Log Backup Script
===========================

Daily compressed system log backups with 30-day retention. Cron-ready for production.

Features:
- Timestamped .tar.gz archives (logs_backup_YYYY-MM-DD_HH-MM.tar.gz)
- Auto-detects syslog vs journalctl (Fedora/Ubuntu compatible)
- Automatic 30-day cleanup
- Success/failure audit logging
- Zero external dependencies (just tar, find)

Prerequisites:
Fedora/CentOS: sudo dnf install tar findutils
Ubuntu/Debian: sudo apt install tar findutils

Quick Setup (2 minutes):
1. chmod +x logs_script.sh
2. Edit BACKUP_DIR (line 2) if needed
3. ./logs_script.sh          (Test)
4. crontab -e                (Schedule)
   0 14 * * * /full/path/to/logs_script.sh

Output Files:
backup/
├── logs_backup_2025-11-29_00-13.tar.gz  (Logs archive)
└── backup.log                           (Audit trail)

Usage Examples:
./logs_script.sh                          (Run manually)
tail backup/backup.log                    (Check audit log)
tar -tzf backup/logs_backup_*.tar.gz | head -10  (Verify contents)

Cron Schedules:
0 14 * * * /path/to/logs_script.sh        (Daily 2PM)
0 * * * * /path/to/logs_script.sh         (Hourly)
0 3 * * 0 /path/to/logs_script.sh         (Weekly Sunday 3AM)

Troubleshooting:
crontab -l                                (List cron jobs)
journalctl -u cron -f                     (Fedora cron logs)
grep CRON /var/log/syslog                 (Ubuntu cron logs)

Tech Support Portfolio Project
Demonstrates: Bash scripting, cron automation, Linux administration, log management, Git workflow

Marcin Kaciczak | Technical Support Engineer | kaciczak0211@gmail.com
