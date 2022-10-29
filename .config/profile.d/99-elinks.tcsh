#!/usr/bin/env tcsh
# ~/.config/profile.d/99-elinks.tcsh
# configuration for elinks
# <alexforsale@yahoo.com>

if ( -X elinks ) then
    if ( ! -d ${XDG_CONFIG_HOME}/elinks ) mkdir -p ${XDG_CONFIG_HOME}/elinks
    if ( -d ${HOME}/.elinks ) then
        mv ${HOME}/.elinks/* ${XDG_CONFIG_HOME}/elinks
        rm -rf ${HOME}/.elinks
    endif
    setenv ELINKS_CONFDIR ${XDG_CONFIG_HOME}/elinks
endif
