#!/usr/bin/env tcsh
# ~/.config/profile.d/99-fortune.tcsh
# configuration for fortune
# <alexforsale@yahoo.com>

switch ( $DISTRO )
    case freebsd:
        if ( -X fortune ) fortune freebsd-tips
        breaksw
    case debian:
    case devuan:
        if ( -X fortune ) fortune debian-hints
        breaksw
    default:
        if ( -X fortune ) fortune linux
        breaksw
endsw
