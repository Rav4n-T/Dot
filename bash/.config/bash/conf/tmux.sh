export TMUX_ENABLED="true"

if command -v tmux &> /dev/null && [ "$TMUX_ENABLED" = "true" ]; then
  if [[ $- =~ i ]]; then
    echo -ne '\e[5 q'
    # Commands to run in interactive sessions can go here
  
    # 检查是否已经在一个 tmux 会话中
    if [ -z "$TMUX" ]; then
      # 检查 tmux 是否有 DEFAULT 会话
      if tmux has-session -t DEFAULT 2>/dev/null; then
        # 如果存在，则附加到该会话
        tmux attach-session -t DEFAULT
      else
        # 如果不存在，则创建新的 DEFAULT 会话
        tmux new-session -d -s DEFAULT
        # 附加到新的 DEFAULT 会话
        tmux attach-session -t DEFAULT
      fi
    fi
  fi
fi
