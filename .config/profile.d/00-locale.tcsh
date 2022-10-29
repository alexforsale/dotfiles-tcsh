#!/usr/bin/env tcsh
# ~/.config/profile.d/00-locale.tcsh
# locale settings
# <alexforsale@yahoo.com>

# language
if ( ! $?LANG ) setenv LANG en_US.UTF-8
if ( ! $?MM_CHARSET ) setenv MM_CHARSET $LANG
