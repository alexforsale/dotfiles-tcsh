#!/usr/bin/env tcsh
      # <alexforsale@yahoo.com>
      # various tcsh options

      if ( $?prompt ) then
          set \
              autocorrect \
              autoexpand \
              autolist=ambiguous \
              correct=cmd \
              ellipsis \
              filec \
              history=1000 \
              killdup=erase \
              listjobs=long \
              listlinks \
              listmax=100 \
              nobeep \
      prompt='%N@%m:%B%c02%b%# ' \
              rmstar \
              savehist=(1000 merge) \

          unset promptchars

          switch ( "$OSTYPE" )
              case bsd44:
              case darwin:
              case FreeBSD:
              case NetBSD:
                  stty status ^G
                  if ( $?tcsh ) bindkey ^G stuff-char
                  breaksw
          endsw
      endif
