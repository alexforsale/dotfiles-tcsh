#!/usr/bin/env tcsh
      # ~/.config/profile.d/00-distro.tcsh
# set distro environment
# <alexforsale@yahoo.com>

# set DISTRO and DISTROVER
if ( -f /etc/os-release ) then
    # freedesktop.org and systemd
    foreach p ( `awk -F'=' '{print $1}' /etc/os-release` )
        setenv $p `grep ^${p}= /etc/os-release | awk -F'=' '{print $2}'`
    end
    setenv DISTRO ${ID}
    if ( $?VERSION_ID ) then
        setenv DISTROVER ${VERSION_ID}
    else if ( $?BUILD_ID ) then
        setenv DISTROVER ${BUILD_ID}
    endif
    unsetenv p
    # remove other variables
    unsetenv NAME PRETTY_NAME ID BUILD_ID ANSI_COLOR HOME_URL DOCUMENTATION_URL \
             SUPPORT_URL BUG_REPORT_URL LOGO
else if ( -X lsb_release ) then
    setenv DISTRO `lsb_release -si | awk '{print tolower ($0)}'`
    setenv DISTROVER `lsb_release -sr | awk '{print tolower ($0)}'`
else if ( -f /etc/lsb-release ) then
    foreach p ( `awk -F'=' '{print $1}' /etc/lsb-release` )
        setenv $p `grep ^$p /etc/lsb-release | awk -F'=' '{print $2}'`
    end
    setenv DISTRO ${DISTRIB_ID}
    setenv DISTROVER ${DISTRIB_RELEASE}
    unsetenv p LSB_VERSION DISTRIB_ID DISTRIB_RELEASE DISTRIB_DESCRIPTION
else if ( -f /etc/debian_version )
    setenv DISTRO debian
    setenv DISTROVER `cat /etc/debian_version`
else
    setenv DISTRO `uname -s | awk '{print tolower ($0)}'`
    setenv DISTROVER `uname -r`
endif
