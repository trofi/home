#!/bin/sh

# it's an i3status wrapper with external tool that populate
# status updates:
# - xmms2 status

(
    xmms2_status_file=/tmp/i3status-xmms2
    printf "hello!" > "${xmms2_status_file}"
    $HOME/bin/player-status-entry-persist.py none | while read l; do
        printf "%s" "${l}" > "${xmms2_status_file}"
    done
) &

i3status
wait
