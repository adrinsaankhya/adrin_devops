#!/bin/bash
#!/bin/bash

echo "=============================="
echo "📊 Server Performance Report"
echo "=============================="

echo -e "\n🧠 Total CPU Usage:"
# CPU usage as a percentage
top -bn1 | grep "Cpu(s)" |sed "s/.*, *\([0-9.]*\)%* id.*/\1/" |awk '{print 100 - $1"%"}'

echo -e "\n🧠 Total Memory Usage:"
free -m | awk 'NR==2 {
  TOTAL=$2; USED=$3; FREE=$4;
  printf("USED : %dMB\t FREE : %dMB\tUSEAGE: %.2f%%\n", USED, FREE, (USED/TOTAL)*100)
}'
echo -e "\n🧠 Total Disk Usage:"
 df -h / | awk 'NR==2 { printf ("Used: %s\tFree: %s\tUsage: %s\n", $3 ,$4 ,$5)}'

echo -e "\n🔥 Top 5 Processes by CPU Usage:"
 ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo -e "\n🧮 Top 5 Processes by Memory Usage:" # Sorting by MEM, skipping header, then showing top 5 
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

