#!/bin/bash

if [ $1 == "play" ]; then
    if ! pgrep -x cmus ; then
        termite --class=cmus -e cmus & \
        sleep .5 && \
        cmus-remote -p && \
        cmus-remote -C "view 2" && \
        title=`cmus-remote -C "format_print %F"` && \
        notify-send "$title"
    else
        cmus-remote -u
        stat=`cmus-remote -C status | grep status`
        if [ "$stat" == "status paused" ]; then
                notify-send -u low "Paused"
        else
                title=`cmus-remote -C "format_print %F"`
                notify-send "$title"
        fi
    fi
elif [ $1 == "next" ]; then
    stat=`cmus-remote -C status | grep status`
    if [ "$stat" == "status playing" ]; then
        cmus-remote -n
        title=`cmus-remote -C "format_print %F"`
        notify-send "$title"
    fi
elif [ $1 == "prev" ]; then
    stat=`cmus-remote -C status | grep status`
    if [ "$stat" == "status playing" ]; then
        cmus-remote -r
        title=`cmus-remote -C "format_print %F"`
        notify-send "$title"
    fi
elif [ $1 == "seekf" ]; then
    cmus-remote -k +20
elif [ $1 == "seekp" ]; then
    cmus-remote -k -20
elif [ $1 == "update" ]; then
    cmus-remote -c -l && \
    cmus-remote -l ~/Music && \
    cmus-remote -C "view 2" && \
    notify-send "Playlist updated"
fi
