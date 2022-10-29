#!/usr/bin/env tcsh
# ~/.config/profile.d/99-go.tcsh
# $GOPATH configuration
# set GOPATH to ~/.local so we don't need
# to add more PATH
# <alexforsale@yahoo.com>

if ( -X go ) then
    if ( ! $?GOPATH ) setenv GOPATH ${HOME}/.local
endif
