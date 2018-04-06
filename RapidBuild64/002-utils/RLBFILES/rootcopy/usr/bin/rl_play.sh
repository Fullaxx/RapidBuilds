#!/bin/bash

if [ "$#" == "0" ]; then
  echo "$0 <*.m3u> or $0 <*.mp3 ...>"
  exit -1
fi

if [[ $1 == *.m3u ]]; then
  PLAYLIST="$1"
  # MP3_HTTP_PROXY,  http_proxy and HTTP_PROXY, in this order
  http_proxy="http://127.0.0.1:3128" mpg123 -Z -v -C -b 8192 --long-tag -@ $PLAYLIST
else
  mpg123 -Z -v -C -b 8192 --long-tag $*
fi

