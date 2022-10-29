#!/usr/bin/env tcsh
# ~/.config/profile.d/99-perl.tcsh
# configuration for perl
# <alexforsale@yahoo.com>

if ( ! -d ${HOME}/.local/perl5/bin ) mkdir -p ${HOME}/.local/perl5/bin
if ( ! -d ${HOME}/.local/perl5/lib/perl5 ) mkdir -p ${HOME}/.local/perl5/lib/perl5

setenv PATH ${HOME}/.local/perl5/bin:${PATH}
if ( $?PERL5LIB ) then
    setenv PERL5LIB ${HOME}/.local/perl5/lib/perl5:${PERL5LIB}
else
    setenv PERL5LIB ${HOME}/.local/perl5/lib/perl5
endif

if ( $?PERL_LOCAL_LIB_ROOT ) then
    setenv PERL_LOCAL_LIB_ROOT ${HOME}/.local/perl5:${PERL_LOCAL_LIB_ROOT}
else
    setenv PERL_LOCAL_LIB_ROOT ${HOME}/local/perl5
endif

setenv PERL_MB_OPT "--install_base ${HOME}/.local/perl5"
setenv PERL_MM_OPT "INSTALL_BASE=${HOME}/.local/perl5"
