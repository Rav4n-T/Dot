set -x ZELLIJ_AUTO_ATTACH true
set -x ZELLIJ_AUTO_EXIT true
set -x ZELLIJ_ENABLED false

# alias z="zellij -s Default"
# alias zc="zellij -s Code -l code"
# alias zf="zellij -s Full -l full"
# alias za="zellij a"


if status is-interactive
  if test -n "$DISPLAY"; and type -q zellij; and test $ZELLIJ_ENABLED = "true"
    # echo -ne '\e[5 q'
    # Commands to run in interactive sessions can go here
    # Autostart zellij
    if not set -q ZELLIJ
        if test "$ZELLIJ_AUTO_ATTACH" = "true"
            zellij attach -c Raven
        else
            zellij -s Raven
        end

        if test "$ZELLIJ_AUTO_EXIT" = "true"
            kill $fish_pid
        end
    end
  end
end
