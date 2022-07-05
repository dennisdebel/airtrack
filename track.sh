#!/bin/bash

open /System/Applications/FindMy.app;
osascript -e 'tell application "Finder"' -e 'set visible of process "Find My" to false' -e 'end tell';
sleep 10; 
/usr/local/bin/jq -r '.[] | select(.name == "0003") | .location | "\(.latitude) \(.longitude) \(.timeStamp)"' /Users/s/Library/Caches/com.apple.findmy.fmipcore/Items.data >> /Users/s/Library/Scripts/log.txt