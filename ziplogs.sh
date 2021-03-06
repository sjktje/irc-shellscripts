#!/bin/bash
# by sjk (irc.pte.hu) 
#
# bzip2's irclogs (not including the current days irclogs, since they may be
# used by the IRC client.) Log files should be in the format
# nick/channel-YYYY-MM-DD.log. 
# 
# I use:
#  autolog_path = ~/.irclogs/$tag/$0/${0}-%Y-%m-%d.log
# in irssi.


FIND="find"
DATE="date"
BZIP="bzip2"

$FIND ~/.irclogs/ -type f ! -iname '*bz2' ! -path '*`$DATE +%Y-%m-%d`.log' -exec $BZIP {} \;

