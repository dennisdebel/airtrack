#!/bin/bash

open /System/Applications/FindMy.app;
osascript -e 'tell application "Finder"' -e 'set visible of process "Find My" to false' -e 'end tell';
sleep 10; 
/usr/local/bin/jq -r '.[] | select(.name == "AIRTAGNAME") | .location | "\(.latitude) \(.longitude) \(.timeStamp)"' $HOME/Library/Caches/com.apple.findmy.fmipcore/Items.data >> $HOME/Library/Scripts/log.txt
