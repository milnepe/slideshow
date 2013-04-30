#!/bin/bash
# xinit script to run slideshow in libreoffice
# author: Pete Milne
# date: 16-03-2013
# version: 1.0
# ref: http://www.alandmoore.com/blog/2011/11/05/creating-a-kiosk-with-linux-and-x11-2011-edition/

# switch off screensaver
xset s off
xset -dpms

# start window manager in background
matchbox-window-manager &

# run forever
while true; do
	# refresh home dir
	rsync -qr --delete --exclude='.Xauthority' /opt/pi/ $HOME/
	# del libreoffice profile to avoid recovery mode
	rm -r .config/libreoffice
	# run libreoffice in kiosk mode
	soffice -show slideshow.odp 
done
