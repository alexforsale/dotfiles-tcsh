#!/usr/bin/env tcsh
# ~/.config/profile.d/99-ccache.tcsh
# ccache configuration
# <alexforsale@yahoo.com>

if ( -X ccache ) then
    if ( -d /usr/lib/ccache/bin ) setenv PATH /usr/lib/ccache/bin:${PATH}
endif

switch ( $DISTRO )
    case gentoo:
        if ( -r /var/cache/ccache ) setenv CCACHE_DIR var/cache/ccache
        breaksw
endsw
