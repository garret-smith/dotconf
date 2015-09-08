#!/usr/bin/env sh

DIR=~/.config/pianobar
SONG=${DIR}/song
SONG_FIFO=${DIR}/song_fifo

EVT="$1"

while read L; do
        k="`echo "$L" | cut -d '=' -f 1`"
        v="`echo "$L" | cut -d '=' -f 2`"
        export "$k=$v"
        echo "$k=$v" >> $SONG
done

if [ "$EVT" = "songstart" ]; then
        if [ "$rating" = "1" ]; then
                love="<3 "
        else
                love=""
        fi
        echo "$love$title / $artist" | nbwf $SONG_FIFO
fi
