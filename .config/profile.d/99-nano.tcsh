#!/usr/bin/env tcsh
# ~/.config/profile.d/99-nano.tcsh
# see https://nano-editor.org
# <alexforsale@yahoo.com>
if ( -X nano ) then
    mkdir -p ${XDG_CONFIG_HOME}/nano
    if ( -f ${HOME}/.nanorc ) mv ${HOME}/.nanorc ${XDG_CONFIG_HOME}/nano/nanorc
endif
