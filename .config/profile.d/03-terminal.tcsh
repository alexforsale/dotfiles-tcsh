#!/usr/bin/env tcsh
# ~/.config/profile.d/03-terminal.tcsh
# ${TERMINAL} apps
# <alexforsale@yahoo.com>

# Terminal apps
foreach terminal ( xterm urxvt lilyterm xfce4-terminal terminology \
                  st konsole lxterminal yakuake guake tilda terminator\
                  gnome-terminal sakura )
    if ( ! $?TERMINAL ) then
        if ( -X $terminal ) setenv TERMINAL $terminal
    endif
end
unset terminal
