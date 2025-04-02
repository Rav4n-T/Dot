function zel
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
