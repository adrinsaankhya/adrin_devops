#!/bin/bash

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then
    echo "❌ Log file not found: $LOG_FILE"
    echo "Usage: $0 <log_file_path>"
    exit 1
fi

echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{printf "%s - %s requests\n", $2, $1}'
echo

echo "Top 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{printf "%s - %s requests\n", $2, $1}'
echo

echo "Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{printf "%s - %s requests\n", $2, $1}'
echo

echo "Top 5 user agents:"
awk '{print $12}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print substr($0,index($0,$2)) " - " $1 " requests"}'

