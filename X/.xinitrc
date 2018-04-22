#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx

if [ -d /etc/X11/xinit/xinitrc.d ]; then
   for f in /etc/X11/xinit/xinitrc.d/*; do
     [ -x "$f" ] && . "$f"
   done
   unset f
fi

#export LC_ALL=en_US-UTF-8

xrdb -merge ~/.config/Xresources

setxkbmap -option caps:escape	 ## bind caps lock as escape
xscreensaver -no-splash &        ## set screensaver daemon
xsetroot -cursor_name left_ptr & ## set cursor icon
urxvtd -q -o -f                  ## start urxvt daemon
#sync &                           ## monitor calendar directory
exec i3                          ## finally, start window manager. When i3 exits, this script exits, bringing along xorg with it.

