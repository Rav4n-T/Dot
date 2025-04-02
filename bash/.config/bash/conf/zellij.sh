export ZELLIJ_ENABLED="false"

if command -v zellij &> /dev/null && [ "$ZELLIJ_ENABLED" = "true" ]; then
  if [[ $- =~ i ]]; then
    echo -ne '\e[5 q'
    # Commands to run in interactive sessions can go here
    
    # Autostart zellij
    if [ -z "$ZELLIJ" ]; then
      if [ "$ZELLIJ_AUTO_ATTACH" = "true" ]; then
        zellij attach -c Raven
      else
        zellij -s Raven
      fi
  
      if [ "$ZELLIJ_AUTO_EXIT" = "true" ]; then
        kill "$BASHPID"
      fi
    fi
  
  fi
fi
