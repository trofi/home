#! /usr/bin/env nix-shell
#! nix-shell -i python -p xmms2.python xmms2


import html
import sys

if   sys.argv[1] in ['irc', 'xmobar', 'none', 'tty', 'pango']:
    pass
else:
    print("ERROR: please choose available flavour")
    exit(1)

flavour = sys.argv[1]

def paint(color, text):
    if flavour == 'xmobar':
        return "<fc=%s>%s</fc>" % (color, text)
    elif flavour == 'pango':
        return "<span foreground='%s'>%s</span>" % (color, html.escape(text))
    elif flavour == 'irc':
        colors = { 'green'        : 3
                 , 'brightred'    : 4
                 , 'red'          : 5
                 , 'yellow'       : 7
                 , 'brightyellow' : 8
                 , 'cyan'         : 10
                 , 'brightcyan'   : 11
                 , 'gray'         : 14
                 , 'white'        : 15
                 }
        return "\x03%02d%s" % (colors.get(color, 15), text)
    elif flavour == 'tty':
        colors = { 'green'        : 32
                 , 'brightred'    : 31
                 , 'red'          : 31
                 , 'yellow'       : 33
                 , 'brightyellow' : 33
                 , 'cyan'         : 36
                 , 'brightcyan'   : 36
                 , 'gray'         : 30
                 , 'white'        : 29
                 }
        return "\033[01;%02dm%s\033[00m" % (colors.get(color, 15), text)
    elif flavour == 'none':
        return text
    else:
        print("ERROR: bad flavour: %s" % flavour)
        exit(1)

import locale

def show(s):
    print(s)

import xmmsclient

xc = xmmsclient.XMMSSync('xmobar-tray')
xc.connect()

mid   = xc.playback_current_id()
mdata = xc.medialib_get_info(mid)

# set segmet more prioritized
mdata.sources = [ 'client/xmobar-tray'
                , 'plugin/segment'
                # , 'plugin/mad'   # over id3v2
                , 'plugin/id3v2' # over id3v1
                , 'server'
                , 'plugin/*'
                , 'client/*'
                , '*']

def pp_duration(milliseconds):
    result = ""
    seconds = milliseconds // 1000
    minutes = seconds // 60
    hours   = minutes // 60
    days    = hours // 24
    started_output = False
    if days     > 0 or started_output: result += ("%dd " % days); started_output = True
    if hours    > 0 or started_output: result += ("%dh " % (hours % 24)); started_output = True
    if minutes  > 0 or started_output: result += ("%dm " % (minutes % 60)); started_output = True
    if seconds  > 0 or started_output: result += ("%ds"  % (seconds % 60)); started_output = True
    return result

show(' '.join(map( (lambda c: paint(*c))
                 ,       [ ('cyan',   "<%s>"    % mdata.get('artist', '?'))
                         #, ('green',  "%s"       % '-')
                         , ('yellow', "[%s]"     % mdata.get('album', '?'))
                         #, ('green',  "%s"       % '-')
                         , ('red',    "%s"       % mdata.get('title', '?'))
                         , ('cyan',   "[%dkbps]" % (mdata.get('bitrate', 0) / 1000))
                         , ('green',  "%s"       % pp_duration(mdata.get('duration', 0)))
                         ])))
