#!/bin/sh

# expose displays
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway

# expose cursors
# do we need it?
#set $my_cursor ComixCursors-Green
#set $my_cursor_size 48
#seat seat0 xcursor_theme $my_cursor $my_cursor_size

gsettings set org.gnome.desktop.interface cursor-theme Adwaita
gsettings set org.gnome.desktop.interface cursor-size 32
