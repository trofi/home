

use Irssi;
use strict;
use vars qw($VERSION %IRSSI);
use utf8;

$VERSION = "0.0.1";
%IRSSI = (
    authors     => 'slyfox',
    name        => 'private message signal',
    description => 'wave sound player on PRIVMSG <us>',
    license     => 'Public Domain'
);

sub query_up
{
    my $sound="privmsg.wav";
    `aplay ~/.irssi/sounds/$sound >& /dev/null &`;
}

Irssi::signal_add_last('message private', 'query_up');