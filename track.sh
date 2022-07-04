#!/bin/bash

open /System/Applications/FindMy.app;
sleep 10; 
/usr/local/bin/jq -r '.[] | select(.name == "AIRTAGNAME") | .location | "\(.latitude) \(.longitude) \(.timeStamp)"' /Users/YOURUSERNAME/Library/Caches/com.apple.findmy.fmipcore/Items.data >> /Users/YOURUSERNAME/Library/scripts/log.txt