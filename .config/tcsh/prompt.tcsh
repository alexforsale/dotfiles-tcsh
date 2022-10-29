#!/usr/bin/env tcsh
      # prompt
      #  %/  The current working directory.
      #  %~  The current working directory, but with one's home
      #      directory represented by `~'
      #  %c[[0]n], %.[[0]n]
      #      The trailing component of the current working directory, or
      #      n trailing components if a digit n is given.  If n begins
      #      with `0'
      #  %C  Like %c, but without `~' substitution.
      #  %h, %!, !
      #      The current history event number.
      #  %M  The full hostname.
      #  %m  The hostname up to the first `.'.
      #  %S (%s)
      #      Start (stop) standout mode.
      #  %B (%b)
      #      Start (stop) boldfacing mode.
      #  %U (%u)
      #      Start (stop) underline mode.
      #  %t, %@
      #      The time of day in 12-hour AM/PM format.
      #  %T  Like `%t', but in 24-hour format
      #  %p  The `precise' time of day in 12-hour AM/PM format, with seconds.
      #  %P  Like `%p', but in 24-hour format
      #  \c  c is parsed as in bindkey.
      #  ^c  c is parsed as in bindkey.
      #  %%  A single `%'.
      #  %n  The user name.
      #  %N  The effective user name.
      #  %j  The number of jobs.
      #  %d  The weekday in `Day' format.
      #  %D  The day in `dd' format.
      #  %w  The month in `Mon' format.
      #  %W  The month in `mm' format.
      #  %y  The year in `yy' format.
      #  %Y  The year in `yyyy' format.
      #  %l  The shell's tty.
      #  %L  Clears from the end of the prompt to end of the display or
      #      the end of the line.
      #  %$  Expands the shell or environment variable name immediately
      #      after the `$'.
      #  %#  `>' (or the first character of the promptchars shell
      #      variable) for normal users, `#' (or the second character of
      #      promptchars) for the superuser.
      #  %{string%}
      #      Includes string as a literal escape sequence.
      #  %?  The return code of the command executed just before the
      #      prompt
      #  %R  In prompt2, the status of the parser.  In prompt3, the
      #      corrected string.  In history, the history string.
      #
      # examples:
      # standard prompt
      # %N@%m:%B%c02%b%#

      # from https://www.cs.umd.edu/~srhuang/teaching/code_snippets/prompt_color.tcsh.html
      # Colors!
      set     red="%{\033[1;31m%}"
      set   green="%{\033[0;32m%}"
      set  yellow="%{\033[1;33m%}"
      set    blue="%{\033[1;34m%}"
      set magenta="%{\033[1;35m%}"
      set purple="%{\033[0;35m%}"
      set    cyan="%{\033[1;36m%}"
      set   white="%{\033[0;37m%}"
      set     end="%{\033[0m%}" # This is needed at the end...

      switch ($DISTRO)
          case "freebsd":
              # red
              set prompt="${green}%n${red}@%m ${white}%~ ${green}%%${end} "
              breaksw
          case "artix":
          case "arch":
              set prompt="${green}%n${blue}@%m ${white}%~ ${green}%%${end} "
              breaksw
          case debian:
          case devuan:
          case ubuntu:
              # purple
              set prompt="${green}%n${purple}@%m ${white}%~ ${green}%%${end} "
              breaksw
          case gentoo:
              # purple
              set prompt="${green}%n${magenta}@%m ${white}%~ ${green}%%${end} "
              breaksw
          default:
              set prompt="${green}%n${yellow}@%m ${white}%~ ${green}%%${end} "
              breaksw
      endsw

      unset red green yellow blue magenta cyan yellow white purple end
