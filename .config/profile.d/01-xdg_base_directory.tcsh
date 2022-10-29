#!/usr/bin/env tcsh
      # ~/.config/profile.d/01-xdg_base_directory.tcsh
# XDG Base Directory specification
# https://wiki.archlinux.org/index.php/XDG_BASE_Directory_support
# <alexforsale@yahoo.com>

if ( ! $?XDG_CONFIG_HOME ) setenv XDG_CONFIG_HOME ${HOME}/.config
if ( ! -d $XDG_CONFIG_HOME ) mkdir -p $XDG_CONFIG_HOME

if ( ! $?XDG_CACHE_HOME ) setenv XDG_CACHE_HOME ${HOME}/.cache
if ( ! -d $XDG_CACHE_HOME ) mkdir -p $XDG_CACHE_HOME

if ( ! $?XDG_DATA_HOME ) setenv XDG_DATA_HOME ${HOME}/.local/share
if ( ! -d $XDG_DATA_HOME ) mkdir -p $XDG_DATA_HOME

if ( ! $?XDG_RUNTIME_DIR ) then
    switch ( $DISTRO )
        case gentoo:
        case freebsd:
            setenv XDG_RUNTIME_DIR "/tmp/`id -u`-runtime-dir"
            breaksw
        case arch:
        case artix:
            setenv XDG_RUNTIME_DIR "/run/user/`id-u`"
            breaksw
    endsw
    if ( ! -d $XDG_RUNTIME_DIR ) then
        mkdir -p $XDG_RUNTIME_DIR
        chmod 0700 $XDG_RUNTIME_DIR
    endif
endif

#if ( ! $?DBUS_SESSIONN_BUS_ADDRESS ) setenv DBUS_SESSION_BUS_ADDRESS "unix:path=${XDG_RUNTIME_DIR}/bus"

# XDG User Directories
# https://wiki.archlinux.org/index.php/XDG_user_directories
if ( ! $?XDG_DESKTOP_DIR ) setenv XDG_DESKTOP_DIR "${HOME}/Desktop"
if ( ! $?XDG_DESKTOP_DIR ) setenv XDG_DESKTOP_DIR "${HOME}/Desktop"
if ( ! $?XDG_DOWNLOAD_DIR ) setenv XDG_DOWNLOAD_DIR "${HOME}/Downloads"
if ( ! $?XDG_TEMPLATES_DIR ) setenv XDG_TEMPLATES_DIR "${HOME}/Templates"
if ( ! $?XDG_PUBLICSHARE_DIR ) setenv XDG_PUBLICSHARE_DIR "${HOME}/Public"
if ( ! $?XDG_DOCUMENTS_DIR ) setenv XDG_DOCUMENTS_DIR "${HOME}/Documents"
if ( ! $?XDG_MUSIC_DIR ) setenv XDG_MUSIC_DIR "${HOME}/Music"
if ( ! $?XDG_PICTURES_DIR ) setenv XDG_PICTURES_DIR "${HOME}/Pictures"
if ( ! $?XDG_VIDEOS_DIR ) setenv XDG_VIDEOS_DIR "${HOME}/Videos"

foreach dir ( $XDG_DESKTOP_DIR $XDG_DOWNLOAD_DIR $XDG_TEMPLATES_DIR \
             $XDG_PUBLICSHARE_DIR $XDG_DOCUMENTS_DIR $XDG_MUSIC_DIR \
             $XDG_PICTURES_DIR $XDG_VIDEOS_DIR)
    if ( ! -d $dir || -L $dir ) then
        mkdir -p $dir
    endif
end
unset dir

# set the location for gtk2 rc file
setenv GTK2_RC_FILES ${XDG_CONFIG_HOME}/gtk-2.0/gtkrc
if ( ! -d ${GTK2_RC_FILES:h} ) mkdir -p ${GTK2_RC_FILES:h}
