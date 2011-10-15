#!/bin/sh

while :
do
    $HOME/bin/player-status-entry.py xmobar 2>&1 || echo "<fc=red>[error]</fc>"
    sleep 4
done
