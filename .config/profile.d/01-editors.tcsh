#!/usr/bin/env tcsh
# ~/.config/profile.d/02-editors.tcsh
# ${EDITOR}, ${VISUAL} and ${ALTERNATE_EDITOR}
# <alexforsale@yahoo.com>

switch ( $DISTRO )
    case gentoo:
        unsetenv VISUAL EDITOR
        breaksw
endsw

if ( -e "${HOME}/.config/chemacs/profile" ) then
   setenv CHEMACS_PROFILE `cat "${HOME}/.config/chemacs/profile"`
   else if ( -e "${HOME}/.emacs-profile" ) then
       setenv CHEMACS_PROFILE `cat "${HOME}/.emacs-profile"`
endif

if ( "${CHEMACS_PROFILE}" != "" ) then
  setenv emacs_args "-s ${CHEMACS_PROFILE}"
endif

# see https://unix.stackexchange.com/questions/4859/visual-vs-editor-what-s-the-difference
if ( -X emacs ) then
    if ( ! $?VISUAL ) setenv VISUAL "emacsclient -c ${emacs_args}"
endif

# use vim if available for cli editor
if ( -X nvim ) then
    if ( ! $?EDITOR ) setenv EDITOR nvim
else if ( -X vim ) then
    if ( ! $?EDITOR ) setenv EDITOR vim
else if ( -X emacs )
    if ( ! $?EDITOR ) setenv EDITOR "emacsclient -t ${emacs_args}"
else
    if ( ! $?EDITOR ) setenv EDITOR vi
endif

if ( -X nvim-qt ) then
    if ( ! $?VISUAL ) setenv VISUAL nvim-qt
endif

if ( -X gvim ) then
    if ( ! $?VISUAL ) setenv VISUAL gvim
endif

#TODO: set VIMINIT and MYVIMRC

foreach editor ( leafpad l3afpad kate pluma kwrite scribe geany gedit )
    if ( ! $?ALTERNATE_EDITOR  && -X $editor ) setenv ALTERNATE_EDITOR "$editor"
end
unset editor
