#!/bin/bash
touch log.txt
url="$1" 
wget "$url" 
if [ $? -eq 0 ]; then 
    echo "Downloaded: $url" >> "log.txt"
else 
    echo "Failed to download: $url"
 fi
