#!/bin/bash

export sink=`pacmd list-sinks | grep -i -B 20 'used by: [1-9]' | grep "name:" | grep -oP '<\K[^>]+'`

if [ $1 == "up" ]; then
    pactl set-sink-volume $sink +5%
elif [ $1 == "down" ]; then
    pactl set-sink-volume $sink -5%
else
    pactl set-sink-mute $sink 'toggle'
fi
