# airtrack
logging air tag locations

## Prerequisites
* Apple Airtags (or OpenHaystack?).
* iOS device 14.5 and up.
* OSX device Big Sur and up.
* Xcode commandline tools
* Homebrew
* jq (brew install jq)

## Permissions
You need to give 'Terminal', '/bin/bash', '/usr/local/bin/jq' and '/usr/sbin/cron' full disk access in order for this to work (Preferences > Security and Privacy > Full disk access)

After this is setup, pair the airtag with your ios device and it should sync with the Findmy.app on your OSX device. We then use the track.sh script to extract the Unix Epoch timestamp and Longitude and Latitude of the airtag from the findmy.app database located on your OSX device.

## Install
It is suggested that you copy the script 'track.sh' and 'log.txt' to your users' Library folder (Desktop, Downloads and Documents folders are extra protected from writing to). The current script assumes you made a folder in your home users Library folder called scripts. You can do so issueing the command below via the Terminal:

```
mkdir ~/Library/scripts/
```

You still need to make both 'track.sh' and 'log.txt' read/write/execute by all means necessary. So: 

```
cd ~/Library/scripts/
chmod a+rwx *
```

## Config
In 'track.sh' Change the AIRTAGNAME to match the name you gave to your airtag (yes, if you pair one, scroll to the bottom of the suggested  name list and you will be able to add a custom name).

## Tracking Multiple Airtags
This script is very basic, a blunt way to track multiple targets is to add the following to `script.sh`. Don't forget to edit SECONDAIRTAGNAME, log-SECONDAIRTAGNAME.txt and YOURUSERNAME variables.

```
sleep 2; 
/usr/local/bin/jq -r '.[] | select(.name == "SECONDAIRTAGNAME") | .location | "\(.latitude) \(.longitude) \(.timeStamp)"' /Users/YOURUSERNAME/Library/Caches/com.apple.findmy.fmipcore/Items.data >> /Users/YOURUSERNAME/Library/Scripts/log-SECONDAIRTAGNAME.txt
```

## Add to crontab
To log every hour + have a error log add this line to the contrab window (VIM editor):

```
0 * * * * /bin/bash /Users/YOURUSERNAME/Library/scripts/track.sh > /tmp/cronlogfile.txt 2>&1
```

Invoke contab by issueing the following command in the Terminal:

```
$ crontab -e
```

Type 'i' to enter insert mode, paste the line above, press escape and type ':' followed by 'wq' and press enter to save the crontab job. Crontab will start the job or mention if there is any syntax errors in your line. If there are errors in the trash.sh script, these will be logged at /tmp/cronlogfile.txt

## Improvents
* Auto format log as geojson...or other 'gis' inspired formats...bweh...

## Use cases
Tracking e-waste using airtags: http://dennisdebel.nl/trashtag/
It is debatable if it's a good idea to track e-waste by actively contributing to the same problem you are trying to address. Why not just talk to the recyclers?

## Similar projects
https://senseable.mit.edu/trashtrack/

