#!/bin/bash
if [ `cmus-remote -C status | sed -n 1p | grep -o paused` ]; then
    echo "Paused"
else
    echo `cmus-remote -C status | sed -n 2p | grep -o '[^/]*$'` | sed 's/\&//g'
fi
