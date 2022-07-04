# airtrack
logging air tag locations

## Notes
This only works for OSX Big Sur and up.

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

