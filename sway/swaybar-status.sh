#!/bin/bash

while true; do
    # Check if mpc is available and running
    if command -v mpc >/dev/null 2>&1; then
        MPD_STATUS=$(mpc status 2>/dev/null | awk 'NR==2 {print $1}' | tr -d '[]')
        
        if [ "$MPD_STATUS" = "playing" ]; then
            MEDIA="▶ $(mpc current -f '%artist% - %title%') | "
        elif [ "$MPD_STATUS" = "paused" ]; then
            MEDIA="⏸ | "
        else
            MEDIA=""
        fi
    else
        MEDIA=""
    fi

    # Output to swaybar
    echo "${MEDIA}$(date '+%A %d | %H:%M:%S')"
    sleep 1
done
