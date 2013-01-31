#!/usr/bin/perl
# by sjk (irc.pte.hu)
# kline [server], paste logs, ctrl+d
# $Id: kline,v 1.3 2006/03/18 19:04:20 sjk Exp $ $Revision: 1.3 $
#
use strict;
use warnings;

my $reason = "drones/flooding";
my $duration = "14400";
my %hosts;

foreach(<STDIN>) {
    if ($_ =~ /\b~?[a-zA-z0-9._-]{1,10}@([a-zA-Z0-9_.-]+)\b/) {
        if (defined($hosts{$1})) { next; }
        if ($ARGV[0]) { print "/KLINE $duration *\@$1 ON $ARGV[0] :$reason\n"; }
        else { print "/KLINE 14400 *\@$1 :$reason\n"; }
        $hosts{$1} = 1;
    }
}

