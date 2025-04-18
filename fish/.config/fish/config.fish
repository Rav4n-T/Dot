# set -x DISPLAY_SERVER "X11"
set -x DISPLAY_SERVER "wayland"
# Start Hyprland at login
if status is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    switch $DISPLAY_SERVER
	  case X11
	      startx
	  case wayland
	      exec Hyprland
	      # exec uwsm start hyprland
    case sway
      exec dbus-run-session sway
	  case gnome
      exec gnome-shell --wayland
      # MOZ_ENABLE_WAYLAND=1 QT_QPA_PLATFORM=wayland XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
	  case kde
	      exec startplasma-wayland
	  end
  end
end


#starship init fish | source

