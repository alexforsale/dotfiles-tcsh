#!/usr/bin/env tcsh
# ~/.config/profile.d/99-ruby.tcsh
# ruby configuration
# <alexforsale@yahoo.com>
if ( -X ruby ) then
    if ( -d `ruby -e 'print Gem.user_dir'`/bin ) setenv PATH "`ruby -e 'print Gem.user_dir'`/bin:${PATH}"
endif
