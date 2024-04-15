#!/bin/bash
 
# Prompt the user to enter the target network to scan
echo "Please enter the target network to scan: "
read TARGET_NETWORK

# Check if the target network is provided and valid
if [ -z "$TARGET_NETWORK" ]; then
    echo "Target network is required. Exiting."
    exit 1
fi
 
# Run Nmap to perform a port scan and identify service versions
# '-Pn' - Scan without first using ping, necessary if hosts do not respond to ping
# '-sV' - Identifies versions of services running on open ports
# '-oG' - Output in grepable format, facilitates subsequent processing
OUTPUT_FILE="nmap_scan_results.txt"
nmap -Pn -sV $TARGET_NETWORK -oG $OUTPUT_FILE
 
# Analyze scan results for potential vulnerabilities
echo "Nmap skanning slutförd för nätverket: $TARGET_NETWORK"
echo "Analyserar resultat för potentiella sårbarheter..."
while read line; do
    if echo $line | grep -q "80/open"; then
        echo "Potential vulnerability: Web service on port 80 may be open to attacks such as SQL injection or XSS."    fi
    if echo $line | grep -q "22/open"; then
        echo "Potential vulnerability: SSH service on port 22 should be checked for weak passwords and brute force attacks."
    fi
    if echo $line | grep -q "443/open"; then
        echo "Potential vulnerability: HTTPS service on port 443 should be checked for SSL/TLS vulnerabilities."
    fi
done < $OUTPUT_FILE