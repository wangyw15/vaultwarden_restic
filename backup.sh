#!/bin/sh
LOG_FILE="/logs"
LOG_FILE+=$(date "+%Y-%m-%dT%H%M%S")
LOG_FILE+=".log"

restic backup /data >> $LOG_FILE 2>&1
restic forget --keep-daily 31 --prune >> $LOG_FILE 2>&1
restic snapshots >> $LOG_FILE 2>&1