# Start Hyprland at login
if status is-login
   #if test -z "$DISPLAY" -a $XDG_VTNR = 1
	#exec Hyprland
	#exec startplasma-wayland
        # exec gnome-shell --wayland
        # MOZ_ENABLE_WAYLAND=1 QT_QPA_PLATFORM=wayland XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
    #else
      # zel
    #end
end

if status is-interactive
  echo -ne '\e[5 q'
    # Commands to run in interactive sessions can go here
    # Autostart zellij
       # if not set -q ZELLIJ
       #     if test "$ZELLIJ_AUTO_ATTACH" = "true"
       #         zellij attach -c Raven
       #     else
       #         zellij -s Raven
       #     end
       #
       #     if test "$ZELLIJ_AUTO_EXIT" = "true"
       #         kill $fish_pid
       #     end
       # end
  # 检查是否已经在一个 tmux 会话中
  if not set -q TMUX
      # 检查 tmux 是否有 DEFAULT 会话
      if tmux has-session -t DEFAULT 2>/dev/null
          # 如果存在，则附加到该会话
          tmux attach-session -t DEFAULT
      else
          # 如果不存在，则创建新的 DEFAULT 会话
          tmux new-session -d -s DEFAULT
          # 附加到新的 DEFAULT 会话
          tmux attach-session -t DEFAULT
      end
  end
end

#starship init fish | source

