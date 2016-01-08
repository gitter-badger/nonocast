#!/bin/bash

TMPDIR=$(mktemp --tmpdir -d ytdl_XXXXXX)
cd $TMPDIR

FIFONAME=omx.fifo

mkfifo $FIFONAME 

youtube-dl -q -o - $1 > $FIFONAME &

omxplayer -o local $FIFONAME

trap `rm -rf "$TMPDIR"` EXIT
