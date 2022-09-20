#! /usr/bin/env nix-shell
#! nix-shell --pure
#! nix-shell -p alsa-utils
#! nix-shell -p grim -p imagemagick
#! nix-shell -i bash

set -e

cd ~/archive/shots
FILE="$(date "+%F-%H-%M-%S").png"

if [[ -n $WAYLAND_DISPLAY ]]; then
    grim "$FILE"
elif [[ -n $DISPLAY ]]; then
    import -window root "$FILE"
else
    echo "ERROR: how should I shot?"
    exit 1
fi
aplay ~/bin/done.wav
