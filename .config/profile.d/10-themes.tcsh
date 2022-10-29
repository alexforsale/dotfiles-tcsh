#!/usr/bin/env tcsh
# ~/.config/profile.d/10-themes.tcsh
# themes configuration
# <alexforsale@yahoo.com>

# wal
if ( -X wal ) then
    if ( ! $?SSH_CLIENT ) wal -R
endif

if ( $?DESKTOP_SESSION ) then
    if ( $?XDG_CURRENT_DESKTOP ) then
    switch ( $XDG_CURRENT_DESKTOP )
        case KDE:
            if ( $?xrdb_args ) xrdb -merge "${xrdb_args}" ${HOME}/.Xresources
            breaksw
    endsw
    endif
endif
setenv GTK_THEME "Arc-Dark"
