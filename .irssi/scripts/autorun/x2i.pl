#!/usr/bin/perl

# /xmms2info [some text]
# shows currently playing sound

use Irssi;
use strict;
use vars qw($VERSION %IRSSI);
use integer;
use utf8;

$VERSION = "0.0.2";
%IRSSI = (
    authors     => 'slyfox',
    name        => 'xmm2info',
    description => 'Shows currently playing by xmms2d sound',
    license     => 'Public Domain'
);

sub cmd_xmms2info 
{
    my ($data, $server, $witem) = @_;
    if($data)
    {
    }
    else
    {
        my $text = `~/bin/player-status-entry.py irc`;
        $witem->command("me $text");
    }
}

Irssi::command_bind('xmms2info', 'cmd_xmms2info');
