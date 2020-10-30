#!/bin/bash

if [ $1 == "trance" ]; then
   notify-send 'Converting video to mp3'
   youtube-dl -o "~/Floatzel/Music/Trance/%(title)s.%(ext)s" `xsel -ob`
   notify-send 'Video converted successfully'
elif [ $1 == "wave" ]; then
   notify-send 'Converting video to mp3'
   youtube-dl -o "~/Floatzel/Music/Wave/%(title)s.%(ext)s" `xsel -ob`
   notify-send 'Video converted successfully'
elif [ $1 == "chill" ]; then
   notify-send 'Converting video to mp3'
   youtube-dl -o "~/Floatzel/Music/Chill & Ambient/%(title)s.%(ext)s" `xsel -ob`
   notify-send 'Video converted successfully'
elif [ $1 == "deep" ]; then
   notify-send 'Converting video to mp3'
   youtube-dl -o "~/Floatzel/Music/Deep & Dark/%(title)s.%(ext)s" `xsel -ob`
   notify-send 'Video converted successfully'
elif [ $1 == "other" ]; then
   notify-send 'Converting video to mp3'
   youtube-dl -o "~/Floatzel/Music/AAA/%(title)s.%(ext)s" `xsel -ob`
   notify-send 'Video converted successfully'
fi
