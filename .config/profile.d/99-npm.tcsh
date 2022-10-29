#!/usr/bin/env tcsh
# ~/.config/profile.d/99-npm.tcsh
# node packaged module configuration
# see https://wiki.archlinux.org/index.php/Node.js
# <alexforsale@yahoo.com>
if ( -X npm ) then
    setenv npm_config_prefix ${HOME}/.local
endif
