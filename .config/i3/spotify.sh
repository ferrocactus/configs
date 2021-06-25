#!/bin/bash
stat=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus'|egrep -A 1 "string"|cut -b 26-|cut -d '"' -f 1|egrep -v ^$`

if [ $1 == "play" ]; then
    dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
elif [ $1 == "next" ]; then
    if [ "$stat" == "Playing" ]; then
        dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
    fi
elif [ $1 == "prev" ]; then
    if [ "$stat" == "Playing" ]; then
        dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
    fi
fi
