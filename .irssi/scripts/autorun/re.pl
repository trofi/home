#!/usr/bin/perl

# /re [some text]

use Irssi;
use strict;
use vars qw($VERSION %IRSSI);
use integer;
use utf8;

$VERSION = "0.0.2";
%IRSSI = (
    authors     => 'slyfox',
    name        => 're',
    description => 'en2ru n vice versa',
    license     => 'Public Domain'
);

sub cmd_re
{
    my ($data, $server, $witem) = @_;
    if($data)
    {
        $witem->command("/say ".`echo "$data" | conv`);
    }
}

Irssi::command_bind('re', 'cmd_re');
