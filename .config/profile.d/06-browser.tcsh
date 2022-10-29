#!/usr/bin/env tcsh
# ~/.config/profile.d/06-browser.tcsh
# ${BROWSER} configuration
# <alexforsale@yahoo.com>

# Browser
foreach browser ( google-chrome-stable midori qutebrowser chromium firefox seamonkey falkon elinks lynx w3m links nyxt )
    if ( -X $browser ) then
        if ( ! $?BROWSER ) setenv BROWSER $browser
    endif
end
unset browser

# lynx configuration
if ( -X lynx ) then
    setenv WWW_HOME "lite.duckduckgo.com/lite"
    if ( -f ${XDG_CONFIG_HOME}/lynx/lynx.cfg ) then
        setenv LYNX_CFG ${XDG_CONFIG_HOME}/lynx/lynx.cfg
        setenv LYNX_CFG_PATH ${XDG_CONFIG_HOME}/lynx
    endif
endif
