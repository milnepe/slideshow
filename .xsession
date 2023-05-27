#!/bin/bash
# xinit script to run slideshow in libreoffice

# ref: http://www.alandmoore.com/blog/2011/11/05/creating-a-kiosk-with-linux-and-x11-2011-edition/

# switch off screensaver
xset s off
xset -dpms

# start window manager in background
matchbox-window-manager &

# run forever
while true; do
	# refresh home dir
	rsync -qr --delete --exclude='.Xauthority' /opt/${USER}/ $HOME/
	# copy slideshow dir from usb drive - this must contain the slideshow.odp
	# and any embedded audio / video media files
	cp -r /mnt/usbdrive/slideshow .
	# run libreoffice in kiosk mode
	soffice --norestore -show slideshow/slideshow.odp 
done
