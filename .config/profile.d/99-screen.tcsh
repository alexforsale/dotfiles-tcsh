#!/usr/bin/env tcsh
# ~/.config/profile.d/99-screen.tcsh
# configuration for GNU Screen
# <alexforsale@yahoo.com>

if ( -X screen ) then
    if ( ! -d ${XDG_CONFIG_HOME}/screen ) then
        mkdir -p ${XDG_CONFIG_HOME}/screen
        if ( -d ${HOME}/.screen ) then
            mv ${HOME}/.screen/* ${XDG_CONFIG_HOME}/screen
            rm -rf ${HOME}/.screen
        endif
    endif
endif

setenv SCREENDIR ${XDG_CONFIG_HOME}/screen
chmod 0700 ${SCREENDIR}
setenv SCREENRC ${SCREENDIR}/config
