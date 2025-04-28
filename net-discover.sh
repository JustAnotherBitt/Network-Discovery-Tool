#!/bin/bash

# Checks if the argument is not empty
if [ -z "$1" ]; then
        echo "Usage: ./net-discover.sh 10.0.1"
        echo "Note: Do not include the last octet. It will be replaced automatically during the scan."
        exit 1
fi

# Checks if the argument has only 2 dots (3 octets)
if [[ $(grep -o "\." <<< "$1" | wc -l) -ne 2 ]]; then
        echo "Error: You must provide only the first three octets, like 10.0.1"
        exit 1
fi

#  Scans in background - better perfomance
echo "Scanning network $1.0/24..."

for i in {0..254}; do
        (
                ip="$1.$i"
                if ping -c 1 -w 1 "$ip"| grep -q "ttl"; then
                        echo "Host UP: $ip"
                fi
        ) &
done
wait

echo "Scan finished!"
