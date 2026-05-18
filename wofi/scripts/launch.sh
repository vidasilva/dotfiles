#!/bin/bash

if ! pgrep -x wofi > /dev/null; then
    wofi --show drun &
fi

exit 0
