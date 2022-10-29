#!/usr/bin/env tcsh
# ~/.config/profile.d/05-filemanagers.tcsh
# filemanager configuration
# <alexforsale@yahoo.com>

# file manager
foreach fileman ( ranger vifm pcmanfm thunar dolphin caja nautilus nemo rox )
    if ( -X $fileman ) then
        if ( ! $?FILE ) setenv FILE $fileman
    endif
end
unset fileman
