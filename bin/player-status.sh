#!/bin/sh

while :
do
    $HOME/bin/player-status-entry-persist.py pango 2>&1 || echo "<span foreground='red'>[error]</span>"
    sleep 4
done
