#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 [toggle|prev|next|stop|status]"
    exit 1
fi

case $1 in
    toggle)
        playerctl play-pause
        ;;
    prev)
        playerctl previous
        ;;
    next)
        playerctl next
        ;;
    stop)
        playerctl stop
        ;;
    status)
        status=$(playerctl status)
        if [[ $status == "Playing" ]]; then
            echo ""
        elif [[ $status == "Paused" ]]; then
            echo ""
        else
            echo ""
        fi
        ;;
    *)
        echo "Usage: $0 [toggle|prev|next|stop|status]"
        exit 1
        ;;
esac
