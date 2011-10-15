#!/usr/bin/perl

use Irssi;
use strict;
use vars qw($VERSION %IRSSI);
use integer;
use utf8;

$VERSION = "0.0.2";
%IRSSI = (
    authors     => 'slyfox',
    name        => 'opme',
    description => 'alias for ^msg chanserv #current_channel <cmd>',
    license     => 'Public Domain'
);

sub cmd_cs
{
    my ($data, $server, $witem) = @_;

    my @data_arr = split / /, $data;
    my $first = shift @data_arr;
    my $command = "$first ".'$C'." @data_arr;";
    $witem->command('/eval ^msg chanserv '.$command);
}

Irssi::command_bind('cs', 'cmd_cs');
