#!/bin/bash

open /System/Applications/FindMy.app;
osascript -e 'tell application "Finder"' -e 'set visible of process "Find My" to false' -e 'end tell';
sleep 10; 
/usr/local/bin/jq -r '.[] | select(.name == "AIRTAGNAME") | .location | "\(.latitude) \(.longitude) \(.timeStamp)"' /Users/YOURUSERNAME/Library/Caches/com.apple.findmy.fmipcore/Items.data >> /Users/YOURUSERNAME/Library/Scripts/log.txt
