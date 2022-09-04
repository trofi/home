#!/bin/sh

# it's an i3status wrapper with external tool that populate
# status updates:
# - xmms2 status
# - NIC interface usage

(
    xmms2_status_file=/tmp/i3status-xmms2
    printf "<span>hello!</span>\n" > "${xmms2_status_file}"
    $HOME/bin/player-status-entry-persist.py pango | while read l; do
        printf "%s\n" "${l}" > "${xmms2_status_file}"
    done
) 2>/tmp/i3status-xmms2-err &

(
    nic_status_file=/tmp/i3status-nic-usage
    printf "<span>hello!</span>\n" > "${nic_status_file}"
    $HOME/bin/nic-status-persist.bash auto | while read rx tx; do
        printf "<span>rx:${rx} / tx:${tx}</span>\n" > "${nic_status_file}"
    done
) 2>/tmp/i3status-nic-usage-err &

i3status
wait
