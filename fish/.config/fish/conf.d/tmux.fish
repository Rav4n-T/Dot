set -x TMUX_ENABLED true

if status is-interactive

  if test -n "$DISPLAY"; and type -q tmux; and test $TMUX_ENABLED = "true"
    # echo -ne '\e[5 q'
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
end

