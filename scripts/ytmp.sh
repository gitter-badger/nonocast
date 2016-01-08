#!/bin/bash

usage()
{
    echo USAGE: $0 URL
}

if [ $# -ne 1 ]
then
    usage
    exit
fi

# youtube-dl args:
#     -q enables quiet mode. suppresses logging to stdout.
#     -o - directs youtube-dl output to stdout.
#
# mplayer args:
# -novideo disables video processing for the file to read.
# -cache <val> give mplayer memory to work with. this is required when reading from stdin because mplayer needs a buffer
# - read from stdin.

youtube-dl -q -o- $1 | mplayer -novideo -cache 8192  -

