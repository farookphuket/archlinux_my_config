#!/bin/bash

echo "=========== Sync music to External disk ======"

## the command to synce music file to my external harddisk 
## make sure you rename your disk label before run this file
## last update 12 Jan 2026
rsync -avh --delete ~/Music/ /run/media/farook/XDATA/MEDIA/Music/
