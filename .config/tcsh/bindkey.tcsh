#!/usr/bin/env tcsh
      # <alexforsale@yahoo.com>
      # tcsh keybinding file

      if ( $?tcsh ) then
          bindkey -e
          bindkey " " magic-space
          bindkey ^W backward-delete-word
          bindkey ^Z run-fg-editor
          bindkey ^[^W kill-region
      endif
