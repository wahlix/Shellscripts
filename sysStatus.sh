#!/usr/bin/bash


MAX_CPU_USAGE=80  # Max tillåten CPU-användning i procent
MAX_MEM_USAGE=80  # Max tillåten minnesanvändning i procent

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

if (( $(echo "$CPU_USAGE > $MAX_CPU_USAGE" | bc -l) )); then
    echo "Varning: CPU-användningen är hög: $CPU_USAGE%"
fi
if (( $(echo "$MEM_USAGE > $MAX_MEM_USAGE" | bc -l) )); then
    echo "Varning: Minnesanvändningen är hög: $MEM_USAGE%"
else
    echo "Inga problem"
fi