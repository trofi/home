#!/usr/bin/perl

use Irssi;
use strict;
use vars qw($VERSION %IRSSI);
use utf8;

$VERSION = "0.0.1";
%IRSSI = (
    authors     => 'slyfox',
    name        => 'signal on QUERY',
    description => 'wave sound player on QUERY',
    license     => 'Public Domain'
);

sub toc_toc
{
    my $sound="login.wav";
    `aplay ~/.irssi/sounds/$sound >/dev/null 2>&1 &`;
}

Irssi::signal_add_last('query created', 'toc_toc');
