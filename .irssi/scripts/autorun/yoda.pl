#!/usr/bin/perl

# /yoda [some text]

use Irssi;
use strict;
use vars qw($VERSION %IRSSI);
use integer;
use utf8;

$VERSION = "0.0.1";
%IRSSI = (
    authors     => 'slyfox',
    name        => 'yoda',
    description => 'reverses words in sentence',
    license     => 'Public Domain'
);

sub cmd_yoda
{
    my ($data, $server, $witem) = @_;
    if($data)
    {
        my $result = join(" ", reverse(split(/\s/, $data)));
        $witem->command("/say ".$result);
    }
}

Irssi::command_bind('yoda', 'cmd_yoda');
