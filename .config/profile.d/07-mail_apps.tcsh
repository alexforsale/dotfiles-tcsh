#!/usr/bin/env tcsh
# ~/.config/profile.d/07-mail_apps.tcsh
# ${MAIL_APP} configuration
# <alexforsale@yahoo.com>

foreach mail ( alpine balsa evolution geary kmail kube mailspring thunderbird )
    if ( -X $mail ) then
        if ( ! $?MAIL_APP ) setenv MAIL_APP $mail
    endif
end
unset mail
