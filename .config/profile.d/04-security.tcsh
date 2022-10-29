#!/usr/bin/env tcsh
# ~/.config/profile.d/04-security.tcsh
# various security apps
# <alexforsale@yahoo.com>

# from https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
setenv GPG_TTY `tty`

# https://wiki.gentoo.org/wiki/GnuPG#Automatically_starting_the_GPG_agent
if ( $?SSH_CONNECTION ) setenv PINENTRY_USER_DATA "USE_CURSES=1"

# gpg-agent freebsd
switch ( $DISTRO )
    case freebsd:
        if ( ! `pgrep -u ${USER} -x gpg-agent` ) then
            /usr/local/bin/gpg-agent --enable-ssh-support \
                                     --pinentry-program /usr/local/bin/pinentry \
                                     --daemon "$@"
            if ( -f ${HOME}/.gpg-agent.info ) then
                sh -c "source ${HOME}/.gpg-agent.info"
            endif
        endif
        breaksw
    default:
        if ( ! `pgrep -u ${USER} -x gpg-agent` ) gpg-agent --pinentry-program `which pinentry` > /dev/null
        breaksw
endsw

# keychain
# https://wiki.gentoo.org/wiki/Keychain
if ( -X keychain ) then
    if ( ! $?HOSTNAME ) setenv HOSTNAME "`uname -n`"
    keychain --quiet --agents "gpg,ssh"
    if ( -f ${HOME}/.keychain/${HOSTNAME}-csh ) source ${HOME}/.keychain/${HOSTNAME}-csh
    if ( -f ${HOME}/.keychain/${HOSTNAME}-csh-gpg ) source ${HOME}/.keychain/${HOSTNAME}-csh-gpg
endif
