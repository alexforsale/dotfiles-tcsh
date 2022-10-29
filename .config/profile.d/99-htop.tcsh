#!/usr/bin/env tcsh
# ~/.config/profile.d/99-htop.tcsh
# <alexforsale@yahoo.com>

if ( -X htop ) then
    setenv HTOPRC ${XDG_CONFIG_HOME}/htop/htoprc
    mkdir -p ${HTOPRC:h}
endif
