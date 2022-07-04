# airtrack
logging air tag locations

## Prerequisites
* Apple Airtags (or OpenHaystack?).
* iOS device 14.5 and up.
* OSX device Big Sur and up.
* Xcode commandline tools
* Homebrew
* jq (brew install jq)

You need to give Terminal and /bin/bash full disk access in order for this to work (Preferences > Security and Privacy > Full disk access)

## Config
Change the YOURUSERNAME to your user name... and edit the name/id of you Airtag

## Add to crontab
To log every hour + have a error log add this line to the contrab window (VIM editor):

```
0 * * * * /bin/bash /Users/YOURUSERNAME/Library/scripts/track.sh >/tmp/cronlogfile.txt 2>&1
```

Invoke contab by issueing the following command in the Terminal"

```
$ crontab -e
```

