#!/usr/bin/env tcsh
# ~/.config/profile.d/99-cargo.tcsh
# cargo configuration
# https://wiki.archlinux.org/index.php/Rust#Cargo
# <alexforsale@yahoo.com>
if ( -d ${HOME}/.cargo/bin ) setenv PATH ${HOME}/.cargo/bin:${PATH}
