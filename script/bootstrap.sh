#!/bin/sh

WORKDIR=$(cd `dirname $0` && pwd)

if [ -f /etc/debian_version]; then
	$WORKDIR/bootstrap-debian;
fi
